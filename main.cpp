#include "hlslcc.h"

#include <iostream>
#include <fstream>
#include <string>

#include <shellscalingapi.h>
#include <Psapi.h>
#include <comdef.h>
#include <commdlg.h>
#include <ShlObj_core.h>
#include <comutil.h>
#include <winioctl.h>
#include <winuser.h>
#include <codecvt>
#include <Windows.h>
#include <filesystem>

template <typename T, int N>
char(&dim_helper(T(&)[N]))[N];
#define dim(x) (sizeof(dim_helper(x)))

std::filesystem::path GetExecutableDirectory()
{
    char path[512] = { 0 };
    if (GetModuleFileNameA(NULL, path, dim(path)) == 0)
    {
        return "";
    }

    std::filesystem::path result = path;
    result = result.parent_path();

    return result;
}

int main(int __argc, const char* const* __argv)
{
    HLSLccSamplerPrecisionInfo precisionInfo;
    HLSLccReflection reflection;
    GLSLShader result;
    auto srcPath = GetExecutableDirectory() / "Assets/test.dxbc";
    std::string srcPathStr = srcPath.string();
    int success = TranslateHLSLFromFile(srcPathStr.c_str(), HLSLCC_FLAG_INCLUDE_INSTRUCTIONS_COMMENTS, GLLang::LANG_METAL, nullptr, nullptr, precisionInfo, reflection, &result);
    if (success == 0)
    {
        return 0;
    }

    auto outputPath = GetExecutableDirectory() / "output.metal";
    std::ofstream outFile(outputPath);

    if (!outFile) {
        std::cerr << "Error: Could not open the file for writing." << std::endl;
        return 1;
    }

    outFile << result.sourceCode;
    outFile.close();

    if (outFile.good()) {
        std::cout << "String successfully written to the file." << std::endl;
    }
    else {
        std::cerr << "Error occurred while writing to the file." << std::endl;
    }

    return 0;
}
