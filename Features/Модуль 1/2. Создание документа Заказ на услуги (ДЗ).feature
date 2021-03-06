#language: ru

@tree

Функционал: Создание документа Заказ на услуги

Как Менеджер по продажам я хочу
создать заказ на услуги 
чтобы зафиксировать потребность на выполнение услуг 

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка наличия услуги в справочнике
	И В командном интерфейсе я выбираю 'Продажи' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Код'       | 'Наименование' |
		| '000000038' | 'Ремонт'       |


Сценарий: Создание документа Заказ на услуги
* Открытие формы создания Заказа на услуги
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа Заказ на услуги
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000005' | 'Скороход АО'  |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение табличной части документа Заказ на услуги
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000038' | 'Ремонт'       |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '150,00'
* Проверка возможности заполнения поля Количество
	Когда Проверяю шаги на Исключение:
		|'И в таблице "Товары" в поле с именем "ТоварыКоличество" я ввожу текст "10"'|
				
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения табличной части документа Заказ на товары
	Тогда таблица "Товары" содержит строки:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Ремонт' | '150,00' | ''          | '150,00' |
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Номер нового документа
	И я запоминаю значение поля с именем "Номер" как "$Номер$"
* Проведение документа Заказ на товары
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
* Проверка создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И таблица "Список" содержит строки:
		| 'Номер'   |
		| '$Номер$' |
		
		
		
	

