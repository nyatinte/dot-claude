Copy the specified content to the clipboard based on the provided arguments.

## Usage
- Use `$ARGUMENTS` to specify what to copy
- If no arguments provided, copy relevant content from current conversation context

## Supported Content Types
1. **File paths**: Copy entire file contents
   - Example: `$ARGUMENTS = "/path/to/file.js"`
   - Copy the complete file content

2. **Directory paths**: Copy file structure or specific files from directory
   - Example: `$ARGUMENTS = "/path/to/directory"`
   - List and copy relevant files or directory structure

3. **Code snippets**: Copy specific code blocks or functions
   - Example: `$ARGUMENTS = "function calculateTotal from utils.js"`
   - Extract and copy the specified function

4. **Text content**: Copy any specified text or data
   - Example: `$ARGUMENTS = "API documentation for getUserProfile"`
   - Copy relevant documentation or information

5. **Multiple items**: Copy multiple files or code blocks
   - Example: `$ARGUMENTS = "src/components/Header.tsx src/styles/header.css"`
   - Copy multiple specified files

## Behavior
- Read and copy the exact content specified in $ARGUMENTS
- For files: include file path as comment/header
- For code: preserve formatting and indentation
- For directories: provide clear structure overview
- If $ARGUMENTS is empty: intelligently copy most relevant content from current conversation
- Always confirm what was copied to clipboard

## Output Format
Provide the copied content in a clear, formatted manner and confirm the clipboard operation was successful.
