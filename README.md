
---
**StealthAgent**  
**An Open-Source Project**  
**Self-Extracting EXE & DLL Protector for Covert Payloads**

- ![Author](https://img.shields.io/badge/Author-Solitary-green)

- ![Project](https://img.shields.io/badge/Project-StealthAgent-blue)

- ![Version](https://img.shields.io/badge/Version-1.0.0-blue)

- ![Status](https://img.shields.io/badge/Status-Stable-brightgreen)



---
## Disclaimer

**StealthAgent** is intended for **security professionals** and **ethical hackers**. Unauthorized use is illegal.

- Always comply with the legal framework in your jurisdiction.
- The creators of this project are not responsible for any misuse or illegal actions.


---
## **Glossary**

- **EXE**: Executable file format used on Windows systems.
- **DLL**: Dynamic Link Library, a file containing code and data that can be used by other programs.
- **XOR**: A logical operation that compares bits and returns true when the bits are different.
- **RLE**: Run-Length Encoding, a basic form of data compression.
- **MinGW**: Minimalist GNU for Windows, a development environment for compiling native Windows applications.

---

# **Transform and Protect Your Executables**  
Secure your EXEs, embed them inside stealthy DLLs, and deliver your payloads covertly. From XOR encryption to custom compression, StealthAgent provides the tools you need for enhanced security and stealth.

---

# Table of Contents

1. Credits 
2. Overview  
3. Key Features  
   - XOR Encryption  
   - Run-Length Encoding (RLE) Compression  
   - Random Padding for Unique Hashes  
   - Self-Extracting EXE Creation  
   - DLL with Embedded EXE  
4. System Requirements 
5. Installation Instructions  
6. Self-Extracting EXE Generator  
   - Setup & Configuration  
   - Usage Example  
7. DLL with Embedded EXE  
   - Setup & Configuration  
   - Usage Example  
8. In-Depth Technical Walkthrough  
   - XOR Encryption and Decryption  
   - Run-Length Encoding (RLE) Compression  
   - Random Padding for Unique Hashes  
   - C Code Integration & Compilation  
9. Advanced Customization  
   - Automated Build Systems  
   - Extending Encryption & Compression  
   - Customizing EXE/DLL Structure  
10. Security Considerations  
     - Counteracting Reverse Engineering  
    - Advanced Encryption Techniques  
11. Troubleshooting & FAQs  
    - Common Errors and Solutions  


---
## **Credits**

This project incorporates and acknowledges the following important contributions:

- **UACME Project**:  
   The **User Account Control (UAC) bypass** techniques used in StealthAgent are based on the excellent work of [hfiref0x](https://github.com/hfiref0x) and the **UACME** project.  
- **UACME GitHub Repository**: [Click here](https://github.com/hfiref0x/UACME) to access the project.

We extend our gratitude to the community for their contributions to this project.

---



<b>This project follows the license specified in the **UACME** repository, as follows: </b>

---

> **UACME Project License**  
> *Copyright (c) 2014 - 2024, UACMe Project*  
> Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:  
> - Redistributions of source code must retain the copyright notice, this list of conditions, and the following disclaimer.  
> - Redistributions in binary form must reproduce the above copyright notice, this list of conditions, and the following disclaimer in the documentation and/or other materials provided with the distribution.  
> 
> **THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES** (INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE), AND IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

---

## **Overview**

**StealthAgent** is a comprehensive toolkit designed to secure, encrypt, and stealthily deploy executable files (EXEs) by embedding them inside self-extracting EXEs or DLLs. It is intended for developers, penetration testers. 

<b>StealthAgent employs techniques such as:</b>

- **XOR Encryption** for lightweight, fast obfuscation.
- **Run-Length Encoding (RLE)** for compression of payloads without sacrificing stealth.
- **Random Padding** to generate unique file hashes, thwarting signature-based detection.

### **Key Features:**

- **Self-Extracting EXE** creation that unpacks and runs the embedded payload without leaving traces on disk.
- **Encrypted EXE embedding** into stealthy DLLs, ideal for integration with legitimate software.
- **Advanced obfuscation & encryption** techniques, including XOR encryption and custom padding.
- **High versatility**, supporting both EXE and DLL formats for different deployment strategies.

---

## **Key Features**

### 1. **XOR Encryption**
   - **What is it?** A symmetric encryption technique that obfuscates your EXE files.
   - **Why it matters:** Ensures that even if your EXE is intercepted, its contents remain unreadable unless the key is known.

### 2. **Run-Length Encoding (RLE) Compression**
   - **What is it?** A data compression method that reduces file size by encoding repeating byte sequences.
   - **Why it matters:** Minimizes the payload size, improving efficiency while maintaining stealth.

### 3. **Random Padding for Unique Hashes**
   - **What is it?** Padding added to your encrypted payload to generate a unique file hash every time.
   - **Why it matters:** Prevents signature-based detection and makes reverse engineering more difficult.

### 4. **Self-Extracting EXE Creation**
   - **What is it?** A generated EXE that unpacks and runs the embedded payload in a streamlined process.
   - **Why it matters:** Ensures no remnants are left on disk, reducing detection by antivirus tools.

### 5. **DLL with Embedded EXE**
   - **What is it?** A DLL that holds and executes your EXE as part of the DLL's operations. Useful for embedding payloads into legitimate software or during post-compilation processes.
   - **Why it matters:** Enables stealthy execution within another application or system process.

---
## **Usage for Release EXE**
The pre-compiled EXE in the release section of StealthPack is mainly for obfuscating and packing normal payloads. It does not automatically incorporate UACME or any UAC bypass techniques.

<b>Creating a Self-Extracting EXE</b>

To create a self-extracting EXE from your payload (example.exe), use the following command:
```
agent.exe --create-exe C:/path/to/example.exe C:/output/self_extracted.exe C:/mingw/bin/gcc.exe C:/mingw/bin/windres.exe
```
This will generate a self-extracting EXE at C:/output/self_extracted.exe that contains the obfuscated payload from example.exe.

<b>Creating a DLL with Embedded EXE</b>

To create a DLL that embeds your EXE payload, use this command:

```
agent.exe --create-dll C:/path/to/example.exe C:/output/embedded.dll C:/mingw/bin/gcc.exe C:/mingw/bin/windres.exe
```
Here, You can either use your payload (example.exe) or the Self-Extracting EXE created in previous step (self_extracted.exe).

<b>DLL Execution</b>

You can then execute the DLL using regsvr32:
```
regsvr32 C:/output/embedded.dll
```
## **SOURCE CODE EXECUTION:**

<b> (Here I've used the UACME project for Demonstration purposes.)</b>

## **System Requirements**


- ![System Requirements](https://img.shields.io/badge/OS-Windows%207%20%2B-blue)
- 
![Python](https://img.shields.io/badge/Python-3.x-blue)

-
![MinGW](https://img.shields.io/badge/MinGW-w64-green)

### **Dependencies:**

1. **Python 3.x**  
   Download [Python 3.x](https://www.python.org/downloads/) and ensure it’s added to your system's PATH.
   
2. **MinGW-w64**  
   Get it from [here](https://sourceforge.net/projects/mingw-w64/), ensuring that `gcc.exe` and `windres.exe` are included in your system’s PATH.
   
3. **Install Python Libraries:** 

![Python Dependencies](https://img.shields.io/badge/Dependencies-pycryptodome-blue)

   ```bash
   pip install pycryptodome
   ```

---

## **Self-Extracting EXE Generator**

### **Overview**  
This tool generates a self-extracting EXE that can encrypt, compress, and run a payload. The EXE is packed with your code and is ready for covert distribution.

### **Setup & Configuration**

Configure paths in the script before use:
```python
exe_file_path = "C:/path/to/your/UACME.exe"  #Or_Your_payload 
output_path = "C:/path/to/output/self_extracted.exe"
gcc_path = r"C:\mingw64\bin\gcc.exe"
windres_path = r"C:\mingw64\bin\windres.exe"
```

Here in this line,
```
WinExec("C:/Users/Public/Documents/temp_1.tmp powershell.exe", SW_HIDE);
```
You can replace powershell.exe with your payload to bypass UAC.

### **Usage Example**  
Run the script to create the self-extracting EXE:
```python
create_self_extracting_exe(output_path, exe_file_path, gcc_path)
```

---

## **DLL with Embedded EXE**

### **Overview**  
This functionality allows you to create a DLL that contains and executes your EXE. It is useful for embedding payloads into legitimate software or performing post-compilation actions.

### **Setup & Configuration**  
Before running the script, configure the following paths:
```python
exe_file_path = "C:/path/to/output/self_extracted.exe"
output_path = "C:/path/to/output/embedded.dll"
gcc_path = r"C:\mingw64\bin\gcc.exe"
windres_path = r"C:\mingw64\bin\windres.exe"
```

### **Usage Example**  
Generate the DLL with:
```python
create_dll(output_path, exe_file_path, gcc_path, windres_path)
```

### **Running the DLL**  
You can execute the DLL using the `regsvr32` command, which does not require traditional program execution and allows for covert payload loading:
```bash
regsvr32 C:/path/to/output/embedded.dll
```

---

## **In-Depth Technical Walkthrough**

### **XOR Encryption and Decryption**  
XOR encryption applies a key to each byte of the EXE file. The same key is used for both encryption and decryption. Though simple, it offers effective obfuscation.

### **Run-Length Encoding (RLE) Compression**  
RLE reduces payload size by converting repeating byte sequences into a more compact format. This helps reduce the EXE size and adds another layer of obfuscation.

### **Random Padding for Unique Hashes**  
Padding ensures that every generated file has a unique fingerprint, preventing detection through static file signature-based methods.

### **C Code Integration & Compilation**  
The encrypted and compressed EXE is embedded into C code. The code is then compiled using GCC to produce either a self-extracting EXE or DLL. This ensures that no remnants of the original EXE remain on disk.

---

## **Advanced Customization**

### **Automated Build Systems**  
For large-scale projects, you can set up automated build pipelines using batch scripts or CI/CD tools (e.g., Jenkins, GitHub Actions). This ensures smooth integration and versioning.

### **Extending Encryption & Compression**  
You can integrate stronger encryption algorithms (e.g., AES-256) or more efficient compression techniques (e.g., LZ77) for enhanced security and performance.

### **Customizing EXE/DLL Structure**  
Modify the C code to add custom error handling, logging, or additional features to tailor the tool to your specific needs.

---

## **Security Considerations**

### **Counteracting Reverse Engineering**  
While XOR encryption is effective, it is not foolproof. To enhance security, consider implementing the following techniques:

- **Dynamic Key Generation:** Randomly generate keys at runtime to prevent static analysis.
- **Multi-layer Encryption:** Use multiple encryption methods to further obscure the payload.
- **Hardware-Based Keys:** Utilize secure hardware for key management to further increase protection.

### **Advanced Encryption Techniques**  
For stronger encryption, consider integrating AES-256 or RSA encryption with `pycryptodome`. These modern encryption methods provide stronger protection than XOR.

---

## **Troubleshooting & FAQs**

### **Common Errors and Solutions**

- **Error: "GCC not found"**  
  Solution: Ensure that MinGW is installed and that the `bin` folder is included in your system’s PATH.

- **Error: "File not found"**  
  Solution: Double-check the paths to your EXE and output files to ensure they are correct.

- **Error: "Invalid EXE format"**  
  Solution: Verify that the EXE is properly compiled and compatible with the toolset.

---
<footer style="color: #333333; font-family: 'Roboto', sans-serif; font-size: 16px; width: 100%; box-sizing: border-box; padding: 40px 0; margin: 0; background-color: #f4f4f4; border-top: 1px solid #e0e0e0;">
    <div style="text-align: center;">
        <!-- Project Name with Signature Look -->
        <p style="font-size: 28px; font-family: 'Dancing Script', cursive; color: #2c3e50; font-weight: normal; margin: 0; letter-spacing: 1px; line-height: 1.2;">
            StealthAgent
        </p>
        <p style="font-size: 16px; color: #7f8c8d; letter-spacing: 0.5px; font-weight: normal; margin-top: 10px; line-height: 1.6;">
            An Open-Source Project
        </p>
        <p style="font-size: 14px; color: #95a5a6; font-weight: 300; margin-top: 15px; line-height: 1.5;">
            &copy; 2024 StealthAgent.
        </p>
    </div>
</footer>
