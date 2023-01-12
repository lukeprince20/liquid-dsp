cmake_minimum_required(VERSION 3.10)

include_guard(GLOBAL)

set(_CHECK_ALLOCA_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}")

macro(check_alloca_h variable)
  if(NOT DEFINED "${variable}")
    if(NOT CMAKE_REQUIRED_QUIET)
      message(STATUS "Checking for alloca.h")
    endif()

    try_compile(${variable}
      "${CMAKE_BINARY_DIR}"
      "${_CHECK_ALLOCA_BASE_DIR}/CheckAllocaH.c"
      OUTPUT_VARIABLE OUTPUT
    )

    if(${variable})
      if(NOT CMAKE_REQUIRED_QUIET)
        message(STATUS "Checking for alloca.h - found")
      endif()
      set(${variable} 1 CACHE INTERNAL "Have alloca.h")
      file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
        "Checking for alloca.h passed with the following output:\n"
        "${OUTPUT}\n\n"
      )
    else()
      if(NOT CMAKE_REQUIRED_QUIET)
        message(STATUS "Checking for alloca.h - not found")
      endif()
      set(${variable} "" CACHE INTERNAL "Have alloca.h")
      file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
        "Checking for alloca.h failed with the following output:\n"
        "${OUTPUT}\n\n"
      )
    endif()
  endif()
endmacro()

macro(check_alloca variable_h variable_func)
  if(NOT DEFINED "${variable_func}")
    if(NOT CMAKE_REQUIRED_QUIET)
      message(STATUS "Checking for alloca")
    endif()

    check_alloca_h(${variable_h})

    if(${variable_h})
      set(${variable_func} 1)
    else()
      try_compile(${variable_func}
        "${CMAKE_BINARY_DIR}"
        "${_CHECK_ALLOCA_BASE_DIR}/CheckAlloca.c"
        OUTPUT_VARIABLE OUTPUT
      )
    endif()

    if(${variable_func})
      if(NOT CMAKE_REQUIRED_QUIET)
        message(STATUS "Checking for alloca - found")
      endif()
      set(${variable_func} 1 CACHE INTERNAL "Have alloca")
      file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
        "Checking for alloca passed with the following output:\n"
        "${OUTPUT}\n\n"
      )
    else()
      if(NOT CMAKE_REQUIRED_QUIET)
        message(STATUS "Checking for alloca - not found")
      endif()
      set(${variable_func} "" CACHE INTERNAL "Have alloca")
      file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
        "Checking for alloca failed with the following output:\n"
        "${OUTPUT}\n\n"
      )
    endif()
  endif()
endmacro()
