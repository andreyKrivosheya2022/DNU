@echo off
chcp 65001

mkdir "Лабораторные\Группа\ФИО\Командная строка\Скрытая папка"
mkdir "Лабораторные\Группа\ФИО\Командная строка\Не скрытая папка"
attrib +h "Лабораторные\Группа\ФИО\Командная строка\Скрытая папка"

xcopy /? > "Лабораторные\Группа\ФИО\Командная строка\Не скрытая папка\copyhelp.txt"

xcopy "Лабораторные\Группа\ФИО\Командная строка\Не скрытая папка\copyhelp.txt" "Лабораторные\Группа\ФИО\Командная строка\Скрытая папка\copied_copyhelp.txt"

mkdir "Лабораторные\Группа\ФИО\batch"
mkdir "Лабораторные\Группа\ФИО\batch\Скрытая папка"
mkdir "Лабораторные\Группа\ФИО\batch\Не скрытая папка"
attrib +h "Лабораторные\Группа\ФИО\batch\Скрытая папка"

xcopy /? > "Лабораторные\Группа\ФИО\batch\Не скрытая папка\copyhelp.txt"

xcopy "Лабораторные\Группа\ФИО\batch\Скрытая папка\copyhelp.txt" "Лабораторные\Группа\ФИО\Командная строка\Скрытая папка\copied_copyhelp.txt"

dir /s /t:w
pause