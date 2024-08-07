
cmake_minimum_required(VERSION 2.8)

project(HLSLcc)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY $<1:${PROJECT_SOURCE_DIR}/Bin/Release>)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG $<1:${PROJECT_SOURCE_DIR}/Bin/Debug>)

file(COPY ${CMAKE_SOURCE_DIR}/Assets
    DESTINATION ${CMAKE_SOURCE_DIR}/Bin/Debug)

file(COPY ${CMAKE_SOURCE_DIR}/Assets
    DESTINATION ${CMAKE_SOURCE_DIR}/Bin/Release)

file(GLOB HLSLCC_HDRS "${CMAKE_CURRENT_SOURCE_DIR}/include/*")
set(HLSLCC_SRC
		src/ControlFlowGraph.cpp
		src/ControlFlowGraphUtils.cpp
		src/DataTypeAnalysis.cpp
		src/Declaration.cpp
		src/decode.cpp
		src/HLSLcc.cpp
		src/HLSLccToolkit.cpp
		src/HLSLCrossCompilerContext.cpp
		src/Instruction.cpp
		src/LoopTransform.cpp
		src/Operand.cpp
		src/reflect.cpp
		src/Shader.cpp
		src/ShaderInfo.cpp
		src/toGLSL.cpp
		src/toGLSLDeclaration.cpp
		src/toGLSLInstruction.cpp
		src/toGLSLOperand.cpp
		src/toMetal.cpp
		src/toMetalDeclaration.cpp
		src/toMetalInstruction.cpp
		src/toMetalOperand.cpp
		src/UseDefineChains.cpp
		src/cbstring/bsafe.c
		src/cbstring/bstraux.c
		src/cbstring/bstrlib.c)

add_library(hlslcc STATIC ${HLSLCC_SRC})

target_include_directories(hlslcc
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
    PRIVATE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src/cbstring>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src/internal_includes>)

set_target_properties(hlslcc PROPERTIES
    "CXX_STANDARD" "11"
    "CXX_STANDARD_REQUIRED" "ON"
    "PUBLIC_HEADERS" "${HLSLCC_HDRS}")

add_executable(test main.cpp)
target_link_libraries(test hlslcc)


set_target_properties(test PROPERTIES
    "CXX_STANDARD" "17"
    "CXX_STANDARD_REQUIRED" "ON")