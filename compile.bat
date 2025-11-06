@echo off
chcp 65001 >nul
title 游戏引擎编译脚本

echo 编译游戏引擎...

:: 创建输出目录
if not exist "build\classes" (
    mkdir "build\classes"
)

:: 编译所有Java文件
javac -d build\classes ^
    -cp . ^
    src\main\java\com\gameengine\math\Vector2.java ^
    src\main\java\com\gameengine\input\InputManager.java ^
    src\main\java\com\gameengine\core\Component.java ^
    src\main\java\com\gameengine\core\GameObject.java ^
    src\main\java\com\gameengine\components\TransformComponent.java ^
    src\main\java\com\gameengine\components\PhysicsComponent.java ^
    src\main\java\com\gameengine\components\RenderComponent.java ^
    src\main\java\com\gameengine\graphics\Renderer.java ^
    src\main\java\com\gameengine\core\GameEngine.java ^
    src\main\java\com\gameengine\core\GameLogic.java ^
    src\main\java\com\gameengine\scene\Scene.java ^
    src\main\java\com\gameengine\example\GameExample.java

if %errorlevel% equ 0 (
    echo 编译成功！
    echo 运行游戏: java -cp build\classes com.gameengine.example.GameExample
) else (
    echo 编译失败！
    exit /b 1
)

pause