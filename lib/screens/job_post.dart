import 'package:flutter/material.dart';

class JobPost extends StatefulWidget {
  // In case of editing, existing jobPost
  final Map<String, String>? initialData;

  const JobPost({super.key, this.initialData});

  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    // filling controllers if editing, else leave empty
    _titleController = TextEditingController(text: widget.initialData?['title'] ?? "");
    _descController = TextEditingController(text: widget.initialData?['location'] ?? "");
  }

  @override
  void dispose() {
    // to clear up controllers, saving memory
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.initialData != null;

    return Scaffold(
      backgroundColor: const Color(0xFF191720),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    isEditing ? "Edit Job" : "Add New Job",
                    style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTextField(
                        hint: "Enter position name",
                        controller: _titleController,
                      ),
                      const SizedBox(height: 28),
                      _buildTextField(
                        hint: "Describe Requirement...",
                        controller: _descController,
                        maxLines: 15, 
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    // logic: sends data back as Map --> JobListing
                    Navigator.pop(
                      context, 
                      {
                      "title": _titleController.text,
                      "location": _descController.text, 
                      }
                    );
                  },
                  child: Text(
                    isEditing ? "Update Job" : "Submit Job",
                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required TextEditingController controller, int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1E1C24),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF8F8F9E)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF35333B)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF35333B)),
        ),
      ),
    );
  }
}