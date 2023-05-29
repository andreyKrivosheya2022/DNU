using System;
using System.IO;
using System.Text;

class Program
{
    static void Main()
    {
        Console.OutputEncoding = Encoding.UTF8;
        Console.WriteLine("Введіть шлях до каталогу:");
        string rootPath = Console.ReadLine();

        bool showHints = false;
        Console.WriteLine("Ви хочете включити режим підказки? (так/ні)");
        string answer = Console.ReadLine();
        if (answer.ToLower() == "так")
        {
            showHints = true;
        }

        int fileCount = CountFiles(rootPath, showHints);
        Console.WriteLine($"Загальна кількість файлів: {fileCount}");

        Console.WriteLine("\nКількість файлів у підкаталогах:");
        CountFilesInSubdirectories(rootPath, showHints);
    }

    static int CountFiles(string path, bool showHints)
    {
        int count = 0;

        try
        {
            count += Directory.GetFiles(path).Length;

            string[] subdirectories = Directory.GetDirectories(path);
            foreach (string subdirectory in subdirectories)
            {
                count += CountFiles(subdirectory, showHints);
            }
        }
        catch (UnauthorizedAccessException)
        {
            if (showHints)
            {
                Console.WriteLine($"Немає доступу до каталогу: {path}");
            }
        }

        return count;
    }

    static void CountFilesInSubdirectories(string path, bool showHints)
    {
        try
        {
            string[] subdirectories = Directory.GetDirectories(path);
            foreach (string subdirectory in subdirectories)
            {
                int fileCount = CountFiles(subdirectory, showHints);
                Console.WriteLine($"{subdirectory}: {fileCount}");
            }
        }
        catch (UnauthorizedAccessException)
        {
            if (showHints)
            {
                Console.WriteLine($"Немає доступу до каталогу: {path}");
            }
        }
    }
}
