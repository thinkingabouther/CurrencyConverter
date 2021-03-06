# CurrencyConverter
![Логотип CurrencyConverter](/CurrencyConverter/resources/iconCurrencyConverter_rounded.png)

## Обзор

Приложение отображает актуальные курсы валют и поддерживает конвертацию более __35 валютных пар__!

Курсы валют импортируются с [официального сайта ЦБ РФ](https://www.cbr.ru/currency_base/daily/) в виде файла формата XML.

### Уже реализовано
- Отображение __актуальных курсов__ валют и конвертация между ними
- Конвертация между различными валютами с использованием курсов __из архива ЦБ РФ__ вплоть до __1990 года__

### В разработке
- Отображение графиков изменения курсов валют за указанный период времени.

### Доступные валюты
- Российский рубль;
- Австралийский доллар;
- Азербайджанский манат;
- Фунт стерлингов;
- Армянский драм;
- Белорусский рубль;
- Болгарский лев;
- Бразильский реал;
- Венгерский форинт;
- Гонконгский доллар;
- Датская крона;
- Доллар США;
- Евро;
- Индийская рупия;
- Казахстанский тенге;
- Канадский доллар;
- Киргизский сом;
- Китайский юань;
- Молдавский лей;
- Польский злотый;
- Румынский лей;
- СДР;
- Сингапурский доллар;
- Таджикский сомони;
- Турецкая лира;
- Новый туркменский манат;
- Узбекский сум;
- Украинская гривна;
- Чешская крона;
- Шведская крона;
- Швейцарский франк;
- Южноафриканский рэнд;
- Вон Республики Корея;
- Японская Иена;

### Оглавление

- [Начало использования](#Начало-использования)
  - [Требования](#Требования)
  - [Установка](#Установка)
- [Использование](#Использование)
  - [Экран курсов](#Экран-курсов)
  - [Экран конвертации](#Экран-конвертации)
- [Устранение проблем](#Устранение-проблем)

## Начало использования
### Требования
 - macOS Catalina или новее;
 - Xcode 11 или новее;
 - iOS 13 или новее.
### Установка
1. Установите Xcode на компьютер Mac, используя магазин приложений Mac AppStore или по [ссылке](https://developer.apple.com/xcode/resources/).
2. Скачайте исходный код проекта и распакуйте его.
3. Откройте файл с расширением *.xcodeproject* при помощи Xcode.
4. Подключите iPhone к компьютеру Mac с помощью кабеля или используя беспроводную точку доступа.
5. Соберите проект в Xcode и запустить его на iPhone.

Результат установки приложения в Xcode:
![Installation screenshot](/CurrencyConverter/resources/InstallationShot.png)
## Использование
Приложение имеет два основных экрана:
- [Экран курсов](#Экран-курсов)
- [Экран конвертера](#Экран-конвертации)

### Экран курсов
![Courses view screenshot](/CurrencyConverter/resources/CoursesViewShot.jpg)

На данном экране отображаются актуальные курсы валют. Кроме того, есть возможность задать дату для отображения курса из архива и для последующей конвертации.
 
#### Описание элементов интерфейса
1. Кнопка __Настройки__. При нажатии открывается панель выбора даты. После выбора даты приложение импортирует курсы с сайта ЦБ РФ. Выбранная дата применяется как к экрану курсов, так и к экрану конвертации. 
2. Поле __Текущая дата__. Курсы за эту дату используются для конвертации.
3. Кнопка __Обновление__. При нажатии приложение сбрасывает дату к сегодняшнему дню и вновь импортирует курсы с сайта ЦБ РФ.

### Экран конвертации
![Converter view screenshot](/CurrencyConverter/resources/ConverterViewShot.jpg)

На данном экране выполняется перевод между различными валютами.  
#### Описание элементов интерфейса
1. Кнопки __Валюта__. Используются для выбора валюты-источника и валюты-приемника. 
2. Поле __Пользовательский ввод__. Используется для ввода значения в валюте-источнике для конвертации. Конвертированное значение отображается в текстовом поле справа.

## Устранение проблем
При возникновении проблем с установкой или использованием приложения вы можете написать на адрес aineistroev_1@edu.hse.ru.
