workspace ""
	architecture "x64"
	startproject ""

	configurations
	{
		"Debug",
		"Release",
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}

include "..."

project ""
	location ""
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on" 
	intrinsics "on"
	systemversion "latest"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
	}

	links 
	{ 
	}

	defines
	{
	}

	filter "system:windows"

		links
		{
		}

		defines
		{
			"_PLATFORM_WINDOWS",
		}


	filter "system:linux"
	
		links
		{
		}

		defines
		{
			"_PLATFORM_UNIX",
			"_PLATFORM_LINUX",
		}

	filter "system:macosx"

		links
		{
		}

		defines
		{
			"_PLATFORM_UNIX",
			"_PLATFORM_OSX",
		}

	filter "configurations:Debug"
		defines "_DEBUG"
		runtime "Debug"
		symbols "on"
		floatingpoint "Strict"


	filter "configurations:Release"
		defines "_RELEASE"
		runtime "Release"
		optimize "speed"
		inlining "auto"
		floatingpoint "Fast"

