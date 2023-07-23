-- Проект выполняется в интерактивном тренажере на платформе Яндекс.Практикума --

/*Задание 1. Отобразите все записи из таблицы company по компаниям, которые закрылись.*/

SELECT *
FROM company
WHERE status LIKE 'closed';

/*Задание 2. Отобразите количество привлечённых средств для новостных компаний США. Используйте данные из таблицы company. Отсортируйте таблицу по убыванию значений в поле funding_total.*/

SELECT funding_total
FROM company
WHERE country_code = 'USA' AND category_code = 'news'
ORDER BY funding_total DESC;

/*Задание 3. Найдите общую сумму сделок по покупке одних компаний другими в долларах. Отберите сделки, которые осуществлялись только за наличные с 2011 по 2013 год включительно.*/

SELECT SUM(price_amount)
FROM acquisition
WHERE term_code = 'cash'
AND EXTRACT(YEAR FROM CAST(acquired_at AS date)) BETWEEN 2011 AND 2013;

/*Задание 4. Отобразите имя, фамилию и названия аккаунтов людей в твиттере, у которых названия аккаунтов начинаются на 'Silver'.*/

SELECT first_name,
       last_name,
       twitter_username
FROM people
WHERE twitter_username LIKE 'Silver%';

/*Задание 5. Выведите на экран всю информацию о людях, у которых названия аккаунтов в твиттере содержат подстроку 'money', а фамилия начинается на 'K'.*/

SELECT *
FROM people
WHERE twitter_username LIKE '%money%'
AND last_name LIKE 'K%';

/*Задание 6. Для каждой страны отобразите общую сумму привлечённых инвестиций, которые получили компании, зарегистрированные в этой стране. Страну, в которой зарегистрирована компания, можно определить по коду страны. Отсортируйте данные по убыванию суммы.*/

SELECT country_code,
       SUM(funding_total)
FROM company
GROUP BY country_code
ORDER BY SUM(funding_total) DESC;

/*Задание 7. Составьте таблицу, в которую войдёт дата проведения раунда, а также минимальное и максимальное значения суммы инвестиций, привлечённых в эту дату.
Оставьте в итоговой таблице только те записи, в которых минимальное значение суммы инвестиций не равно нулю и не равно максимальному значению.*/

SELECT funded_at,
       MIN(raised_amount),
       MAX(raised_amount)
FROM funding_round
GROUP BY funded_at
HAVING MIN(raised_amount) <> 0
AND MIN(raised_amount) <> MAX(raised_amount);

/*Задание 8. Создайте поле с категориями:
                * Для фондов, которые инвестируют в 100 и более компаний, назначьте категорию high_activity.
                * Для фондов, которые инвестируют в 20 и более компаний до 100, назначьте категорию middle_activity.
                * Если количество инвестируемых компаний фонда не достигает 20, назначьте категорию low_activity.
Отобразите все поля таблицы fund и новое поле с категориями.*/

SELECT *,
       CASE
            WHEN invested_companies >= 100 THEN 'high_activity'
            WHEN invested_companies >= 20 THEN 'middle_activity'
            WHEN invested_companies < 20 THEN 'low_activity'
       END
FROM fund;

/*Задание 9. Для каждой из категорий, назначенных в предыдущем задании, посчитайте округлённое до ближайшего целого числа среднее количество инвестиционных раундов, в которых фонд принимал участие. Выведите на экран категории и среднее число инвестиционных раундов. Отсортируйте таблицу по возрастанию среднего.*/

SELECT CASE
           WHEN invested_companies>=100 THEN 'high_activity'
           WHEN invested_companies>=20 THEN 'middle_activity'
           ELSE 'low_activity'
       END AS activity,
       ROUND(AVG(investment_rounds))
FROM fund
GROUP BY activity
ORDER BY ROUND(AVG(investment_rounds));

/*Задание 10. Проанализируйте, в каких странах находятся фонды, которые чаще всего инвестируют в стартапы. 
Для каждой страны посчитайте минимальное, максимальное и среднее число компаний, в которые инвестировали фонды этой страны, основанные с 2010 по 2012 год включительно. Исключите страны с фондами, у которых минимальное число компаний, получивших инвестиции, равно нулю. 
Выгрузите десять самых активных стран-инвесторов: отсортируйте таблицу по среднему количеству компаний от большего к меньшему. Затем добавьте сортировку по коду страны в лексикографическом порядке.*/

SELECT country_code,
       MIN(invested_companies),
       MAX(invested_companies),
       AVG(invested_companies)
FROM fund
WHERE EXTRACT(YEAR FROM CAST(founded_at AS date)) BETWEEN 2010 AND 2012
GROUP BY country_code
HAVING MIN(invested_companies) > 0
ORDER BY AVG(invested_companies) DESC, country_code
LIMIT 10;

/*Задание 11. Отобразите имя и фамилию всех сотрудников стартапов. Добавьте поле с названием учебного заведения, которое окончил сотрудник, если эта информация известна.*/

SELECT p.first_name,
       p.last_name,
       e.instituition
FROM people AS p LEFT JOIN education AS e ON p.id = e.person_id;

/*Задание 12. Для каждой компании найдите количество учебных заведений, которые окончили её сотрудники. Выведите название компании и число уникальных названий учебных заведений. Составьте топ-5 компаний по количеству университетов.*/

SELECT c.name,
       COUNT(DISTINCT(e.instituition))
FROM company AS c
LEFT JOIN people AS p ON c.id = p.company_id
LEFT JOIN education AS e ON p.id = e.person_id
GROUP BY c.id
ORDER BY COUNT(DISTINCT(e.instituition)) DESC
LIMIT 5;

/*Задание 13. Составьте список с уникальными названиями закрытых компаний, для которых первый раунд финансирования оказался последним.*/

SELECT DISTINCT(c.name)
FROM company AS c RIGHT JOIN funding_round AS f ON c.id = f.company_id
WHERE f.is_first_round = 1
AND f.is_last_round = 1
AND c.status = 'closed';

/*Задание 14. Составьте список уникальных номеров сотрудников, которые работают в компаниях, отобранных в предыдущем задании.*/

WITH
sep_companys AS (
    SELECT DISTINCT(c.id)
    FROM company AS c RIGHT JOIN funding_round AS f ON c.id = f.company_id
    WHERE f.is_first_round = 1
    AND f.is_last_round = 1
    AND c.status = 'closed'
)

SELECT DISTINCT(id)
FROM people
WHERE company_id IN (SELECT *
                     FROM sep_companys);

/*Задание 15. Составьте таблицу, куда войдут уникальные пары с номерами сотрудников из предыдущей задачи и учебным заведением, которое окончил сотрудник.*/

WITH
sep_companys AS (
    SELECT DISTINCT(c.id)
    FROM company AS c RIGHT JOIN funding_round AS f ON c.id = f.company_id
    WHERE f.is_first_round = 1
    AND f.is_last_round = 1
    AND c.status = 'closed'
),

sep_people_id AS(
    SELECT DISTINCT(id)
    FROM people
    WHERE company_id IN (SELECT *
                         FROM sep_companys)
)

SELECT DISTINCT(person_id),
       instituition
FROM education
WHERE person_id IN (SELECT *
                    FROM sep_people_id);

/*Задание 16. Посчитайте количество учебных заведений для каждого сотрудника из предыдущего задания. При подсчёте учитывайте, что некоторые сотрудники могли окончить одно и то же заведение дважды.*/

WITH
sep_companys AS (
    SELECT DISTINCT(c.id)
    FROM company AS c RIGHT JOIN funding_round AS f ON c.id = f.company_id
    WHERE f.is_first_round = 1
    AND f.is_last_round = 1
    AND c.status = 'closed'
),

sep_people_id AS(
    SELECT DISTINCT(id)
    FROM people
    WHERE company_id IN (SELECT *
                         FROM sep_companys)
)

SELECT DISTINCT(person_id),
       COUNT(instituition)
FROM education
WHERE person_id IN (SELECT *
                    FROM sep_people_id)
GROUP BY person_id;

/*Задание 17. Дополните предыдущий запрос и выведите среднее число учебных заведений (всех, не только уникальных), которые окончили сотрудники разных компаний. Нужно вывести только одну запись, группировка здесь не понадобится.*/

WITH
sep_companys AS (
    SELECT DISTINCT(c.id)
    FROM company AS c RIGHT JOIN funding_round AS f ON c.id = f.company_id
    WHERE f.is_first_round = 1
    AND f.is_last_round = 1
    AND c.status = 'closed'
),

sep_people_id AS(
    SELECT DISTINCT(id)
    FROM people
    WHERE company_id IN (SELECT *
                         FROM sep_companys)
)

SELECT AVG(count)
FROM(SELECT DISTINCT(person_id),
            COUNT(instituition)
     FROM education
     WHERE person_id IN (SELECT *
                         FROM sep_people_id)
     GROUP BY person_id)
AS uneverses;

/*Задание 18. Напишите похожий запрос: выведите среднее число учебных заведений (всех, не только уникальных), которые окончили сотрудники Facebook.*/

WITH 
sep_people_id AS (
    SELECT DISTINCT(id)
    FROM people
    WHERE company_id = (SELECT id
                        FROM company
                        WHERE name = 'Facebook')
)

SELECT AVG(count)
FROM(SELECT DISTINCT(person_id),
            COUNT(instituition)
     FROM education
     WHERE person_id IN (SELECT *
                         FROM sep_people_id)
     GROUP BY person_id)
AS uneverses;

/*Задание 19. Составьте таблицу из полей:
                * name_of_fund — название фонда;
                * name_of_company — название компании;
                * amount — сумма инвестиций, которую привлекла компания в раунде.
В таблицу войдут данные о компаниях, в истории которых было больше шести важных этапов, а раунды финансирования проходили с 2012 по 2013 год включительно.*/

SELECT f.name AS name_of_fund,
       c.name AS name_of_company,
       fr.raised_amount AS amount
FROM fund AS f
INNER JOIN investment AS i ON f.id = i.fund_id
INNER JOIN funding_round AS fr ON i.funding_round_id = fr.id
INNER JOIN company AS c ON fr.company_id = c.id
WHERE EXTRACT(YEAR FROM CAST(fr.funded_at AS date)) BETWEEN 2012 AND 2013
AND c.milestones > 6;

/*Задание 20. Выгрузите таблицу, в которой будут такие поля:
                * название компании-покупателя;
                * сумма сделки;
                * название компании, которую купили;
                * сумма инвестиций, вложенных в купленную компанию;
                * доля, которая отображает, во сколько раз сумма покупки превысила сумму вложенных в компанию инвестиций, округлённая до ближайшего целого числа.
Не учитывайте те сделки, в которых сумма покупки равна нулю. Если сумма инвестиций в компанию равна нулю, исключите такую компанию из таблицы. 
Отсортируйте таблицу по сумме сделки от большей к меньшей, а затем по названию купленной компании в лексикографическом порядке. Ограничьте таблицу первыми десятью записями.*/

SELECT acquiring.name,
       acquisition.price_amount,
       acquired.name,
       acquired.funding_total,
       ROUND(acquisition.price_amount/acquired.funding_total)
FROM acquisition
LEFT JOIN company AS acquiring ON acquisition.acquiring_company_id = acquiring.id
LEFT JOIN company AS acquired ON acquisition.acquired_company_id = acquired.id
WHERE acquisition.price_amount > 0 AND acquired.funding_total > 0
ORDER BY acquisition.price_amount DESC, acquired.name
LIMIT 10;

/*Задание 21. Выгрузите таблицу, в которую войдут названия компаний из категории social, получившие финансирование с 2010 по 2013 год включительно. Проверьте, что сумма инвестиций не равна нулю. Выведите также номер месяца, в котором проходил раунд финансирования.*/

SELECT c.name,
       EXTRACT(MONTH FROM CAST(fr.funded_at AS date))
FROM company AS c
LEFT JOIN funding_round AS fr ON c.id = fr.company_id
WHERE c.category_code LIKE 'social'
AND EXTRACT(YEAR FROM CAST(fr.funded_at AS date)) BETWEEN 2010 AND 2013
AND fr.raised_amount > 0;

/*Задание 22. Отберите данные по месяцам с 2010 по 2013 год, когда проходили инвестиционные раунды. Сгруппируйте данные по номеру месяца и получите таблицу, в которой будут поля:
                    * номер месяца, в котором проходили раунды;
                    * количество уникальных названий фондов из США, которые инвестировали в этом месяце;
                    * количество компаний, купленных за этот месяц;
                    * общая сумма сделок по покупкам в этом месяце.*/

WITH
fund AS (
    SELECT EXTRACT(MONTH FROM CAST(fr.funded_at AS date)) AS month,
           COUNT(DISTINCT(f.name)) AS funds
    FROM funding_round AS fr
    INNER JOIN investment AS i ON fr.id = i.funding_round_id
    INNER JOIN fund AS f ON i.fund_id = f.id
    WHERE f.country_code LIKE 'USA'
    AND EXTRACT(YEAR FROM CAST(fr.funded_at AS date)) BETWEEN 2010 AND 2013
    GROUP BY month
),

aqui AS (
    SELECT EXTRACT(MONTH FROM CAST(a.acquired_at AS date)) AS month,
           COUNT(a.acquired_company_id) AS count,
           SUM(a.price_amount) AS sum
    FROM acquisition AS a
    WHERE EXTRACT(YEAR FROM CAST(a.acquired_at AS date)) BETWEEN 2010 AND 2013
    GROUP BY month
)

SELECT f.month, f.funds, a.count, a.sum
FROM aqui AS a
JOIN fund AS f ON a.month = f.month;

/*Задание 23. Составьте сводную таблицу и выведите среднюю сумму инвестиций для стран, в которых есть стартапы, зарегистрированные в 2011, 2012 и 2013 годах. Данные за каждый год должны быть в отдельном поле. Отсортируйте таблицу по среднему значению инвестиций за 2011 год от большего к меньшему.*/

WITH
inv_2011 AS (
     SELECT country_code AS country,
            AVG(funding_total) AS avg2011
     FROM company
    WHERE EXTRACT(YEAR FROM CAST(founded_at AS date)) = 2011
    GROUP BY country_code
),

inv_2012 AS (
    SELECT country_code AS country,
           AVG(funding_total) AS avg2012
    FROM company
    WHERE EXTRACT(YEAR FROM CAST(founded_at AS date)) = 2012
    GROUP BY country_code
),

inv_2013 AS (
    SELECT country_code AS country,
           AVG(funding_total) AS avg2013
    FROM company
    WHERE EXTRACT(YEAR FROM CAST(founded_at AS date)) = 2013
    GROUP BY country_code
)

SELECT inv_2011.country,
       inv_2011.avg2011,
       inv_2012.avg2012,
       inv_2013.avg2013
FROM inv_2011
INNER JOIN inv_2012 ON inv_2011.country = inv_2012.country
INNER JOIN inv_2013 ON inv_2011.country = inv_2013.country
ORDER BY inv_2011.avg2011 DESC;