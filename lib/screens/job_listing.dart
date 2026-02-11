import 'package:flutter/material.dart';
import 'package:my_first_app/screens/job_post.dart';

class JobListing extends StatefulWidget {
  const JobListing({super.key});

  @override
  State<JobListing> createState() => _JobListingState();
}

class _JobListingState extends State<JobListing> {
  // static data entries (x2)
  final List<Map<String, String>> jobs = [
    {"title": "Flutter Developer Required", "location": "Karachi, Pakistan"},
    {"title": "Flutter Developer Required", "location": "Remote"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191720),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black, size: 26),
        onPressed: () async {
          // waits for data to come back from the JobPost page
          final newJob = await Navigator.pushNamed(context, '/jobpost');

          if (newJob != null && newJob is Map<String, String>) {
            setState(() {
              jobs.add(newJob);
            });
          }
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              _buildHeader(), // No 'const' here because it contains dynamic text
              const SizedBox(height: 19.0),
              _buildSearchBar(),
              const SizedBox(height: 28.0),

              Expanded(
                child: jobs.isEmpty
                    ? const Center(
                        child: Text("No Jobs found!", 
                        style: TextStyle(fontSize: 18, color: Colors.white)))
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: jobs.length,
                        itemBuilder: (context, index) {
                          return _buildJobCard(index);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FIXED: Removed 'const' from the Column to avoid TypeErrors with dynamic text
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Welcome", 
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
            Text("Javeria Irshad", 
              style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white, size: 26),
          onPressed: () => Navigator.pushReplacementNamed(context, '/signin'),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF5D5D67),
        hintText: "Search keywords...",
        hintStyle: const TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        prefixIcon: const Icon(Icons.search, size: 20.0, color: Color(0xFF8F8F9E)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildJobCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF201E27),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobs[index]['title'] ?? 'No Title', 
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  jobs[index]['location'] ?? 'No Location',
                  style: const TextStyle(color: Color(0xFF8F8F9E)),
                ),
              ],
            ),
          ),
          
          // Edit button
          GestureDetector(
            onTap: () async {
              final updatedJob = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobPost(initialData: jobs[index]),
                ),
              );

              if (updatedJob != null && updatedJob is Map<String, String>) {
                setState(() {
                  jobs[index] = updatedJob;
                });
              }
            },
            child: const Icon(Icons.edit_note_outlined, size: 26, color: Colors.white),
          ),

          const SizedBox(width: 10.0),

          // Delete button
          GestureDetector(
            onTap: () {
              setState(() {
                jobs.removeAt(index);
              });
            },
            child: const Icon(Icons.delete, size: 22, color: Colors.red),
          ),
        ],
      ),
    );
  }
}