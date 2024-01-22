# Портфолио проектов
В репозитории содержатся проекты с курса Аналитик данных буткемп с платформы [Я Практикум](https://practicum.yandex.ru/.) и курса Open Machine Learning course с платформы [open data science](https://ods.ai/).

В папке [yandex_practicum_data_analyst_bootcamp](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp) содержатся решения аналитических кейсов на реальных наборах данных. Ссылок на данные и самих данных к проектам этого курса нет, в соответствии с правилами платформы, на которой проходило обучение.

В папке [open_machine_learning_course](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course) содержаться решения кейсов с применением классических методов машинного обучения, таких как линейная регрессия, логистическая регрессия, дерево решений, случайный лес, bagging и gradient boosting. Так как курс является англоязычным, проекты в нём выполнялись на английском языке. 

## Проекты с курса "Аналитик данных"
| № | Проект    | Задачи проекта   | Описание проекта                                                   | Навыки и инструменты  |
|---|-----------|------------------|--------------------------------------------------------------------|-----------------------|
|1|[Исследование пользователей сервиса Яндекс Музыка](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp/Исследование%20пользователей%20сервиса%20Яндекс%20Музыка)|На реальных данных Яндекс.Музыки c помощью библиотеки Pandas и её возможностей проверить данные и сравнить поведение и предпочтения пользователей двух столиц — Москвы и Санкт-Петербурга.|Сравниваем, что и в каком режиме слушают жители. Исследуем предпочтения и поведение пользователей Яндекс.Музыки.|Pandas, Python. Обработка данных, дубликаты, пропуски, логическая индексация, группировка, сортировка|
|2|[Исследование надёжности заёмщика](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp/Исследование%20надёжности%20заёмщика)|На основе статистики о платёжеспособности клиентов исследовать влияет ли семейное положение и количество детей клиента на факт возврата кредита в срок.|Разбираемся, влияет ли семейное положение и количество детей клиента на факт погашения кредита в срок. Входные данные от банка — статистика о платёжеспособности клиентов.|Pandas, Python, предобработка данных. Обработка данных, дубликаты, пропуски, категоризация, декомпозиция|
|3|[Исследование объявлений о продаже квартир](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp/Исследование%20объявлений%20о%20продаже%20квартир)|Используя данные сервиса Яндекс.Недвижимость, определить рыночную стоимость объектов недвижимости и типичные параметры квартир.|На основе данных сервиса Яндекс.Недвижимость определена рыночная стоимость объектов недвижимости разного типа, типичные параметры квартир, в зависимости от удаленности от центра. Проведена предобработка данных. Добавлены новые данные.|Matplotlib, Pandas, Python, визуализация данных, исследовательский анализ данных, предобработка данных. Обработка данных, histogram, boxplot, scattermatrix, категоризация|
|4|[Анализ сервиса аренды самокатов](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp/Анализ%20сервиса%20аренды%20самокатов)|Необходимо проанализировать данные и проверьте некоторые гипотезы, которые могут помочь бизнесу вырасти.|У нас есть информация о тарифах компании сервиса аренды электросамокатов и о их пользователях. Провели подготовку данных, разделили данные. Сравнили пользователей с подпиской и без. Проверили гипотизы: кто из пользователей тратит больше денег, проверили является ли среднее растояние поездок оптимальным, сравнили выручку от разных пользователей, сравнили колличество обращений в тех поддержку после обновления.|Matplotlib, NumPy, Pandas, Python, SciPy, описательная статистика, проверка статистических гипотез. Обработка данных, histogram, boxplot, статистический тест|
|5|[Анализ игровой индустрии](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp/Анализ%20игровой%20индустрии)|Используя исторические данные о продажах компьютерных игр, оценки пользователей и экспертов, жанры и платформы, выявить закономерности, определяющие успешность игры|Выявляем определяющие успешность игры закономерности. Это позволит сделать ставку на потенциально популярный продукт и спланировать рекламные кампании|Matplotlib, NumPy, Pandas, Python, исследовательский анализ данных, описательная статистика, предобработка данных, проверка статистических гипотез. Обработка данных, histogram, boxplot, статистический тест, критерий Стьюдента, piechart|
|6|[Исследование данных об инвестиции венчурных фондов в компании-стартапы](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp/Исследование%20данных%20об%20инвестиции%20венчурных%20фондов%20в%20компании-стартапы)|Проанализировать данные о фондах и инвестициях и произвести различные выгрузки данных и ответить на вопросы с помощью SQL.|В данном проекте осуществляется работа с базой данных, которая хранит информацию о венчурных фондах и инвестициях в компании-стартапы. Целью работы является написание запросов на языке SQL, удовлетворяющих условию конкретной задачи.|SQL, PostgreSQL|
|7|[Анализ бизнес-показателей приложения Procrastinate Pro+](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/yandex_practicum_data_analyst_bootcamp/Анализ%20бизнес-показателей)|Несмотря на огромные вложения в рекламу, последние несколько месяцев компания терпит убытки. Необходимо разобраться в причинах и помочь компании выйти в плюс.|Проведен анализ данных от ProcrastinatePRO+. Рассчитаны различные метрики, использован когортный анализ: LTV, CAC, Retention rate, DAU, WAU, MAU и т.д. Использованы уже написанные ранее функции расчёта метрик. Сделаны выводы по полученным данным.|Matplotlib, Pandas, Python, Seaborn, когортный анализ, продуктовые метрики, юнит-экономика. Обработка данных, статистический тест, LTV, CAC, когортный анализ|


## Проекты с курса "Open Machine Learning course"
| № | Проект    | Задачи проекта   | Описание проекта                                                   | Навыки и инструменты  |
|---|-----------|------------------|--------------------------------------------------------------------|-----------------------|
|1|[Предварительный анализ данных с помощью Pandas](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment01_exploratory_data_analysis_with_pandas)|Изучить библиотеку Pandas и провести первичный анализ данных.|В ходе выполнения были изучены и применены некоторые функции Pandas.|Pandas, Numpy, Python, Обработка данных,|
|2|[Анализ данных о сердечно-сосудистых заболеваниях](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment02_analyzing_cardiovascular_disease_data)|Спрогнозировать наличие или отсутствие сердечно-сосудистых заболеваний (ССЗ), используя результаты обследования пациента.|Используя данные опроса пациентов и результаты обследования, провели визуальный анализ данных, предварительно их очистив. Построена корреляционная матрица. Проанализированы зависимости риска ССЗ от некоторых параметров.|Корреляционная матрица, Pandas, Numpy, seaborn, matplotlib|
|3|[Деревья решений с набором данных UCI](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment03_decision_trees_with_a_toy_task_and_the_UCI_adult_dataset)|Изучить как работают деревья решений. Решить задачу бинарной классификации, определить по демографическим данным уровень дохода.|В ходе проекта изучен принцип работы деревьев решений. Проведена очистка и подготовка данных. Для набора демографических данных составлены модели предсказания уровня дохода, используя дерево решений и случайный лес без настройки и с настройкой параметров.|sklearn, энтропия, дерево решений, случайный лес, предобработка данных|
|4|[Исследование OLS, Лассо и случайного леса в задаче регрессии](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment04_exploring_OLS_lasso_and_random_forest_in_a_regression_task)|Используя набор данных с параметрами вина, проанализировать зависимость его качества от различных параметров, составить модель предсказания категории качества.|Проведено разделение данных на тренировочный и тестовый набор. Обучены модели линейной регрессии, регрессии лассо и случайного леса. Составлена таблица ранжирования значимости параметров.|разделение набора на выборки, линейная регрессия, регрессия лассо, случайный лес, ранжирование|
|5|[Логистическая регрессия и случайный лес в задаче кредитного скоринга](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment05_logistic_regression_and_random_forest_in_the_credit_scoring_problem)|Спрогнозировать, погасит ли клиент свой кредит в течение 90 дней.|Проведена подготовка и нормализация данных о клиентах. Построены модели логистической регрессии, случайного леса и bagging-а. Найдены значимости функций для целевой переменной. Проведено сравнение разных моделей.|регрессия, случайный лес, bagging, нормализация, оценка ROC AUC, ранжирование|
|6|[Идентификация пользователя в сети Интернет](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment06_identification_of_a_user_on_the_Internet)|Для каждой сессии нужно предсказать, принадлежит ли сессия Alice (метка «1»), или нет (метка «0»). Целевая метрика – ROC AUC. Конкурс [kagle](https://www.kaggle.com/c/catch-me-if-you-can-intruder-detection-through-webpage-session-tracking2)|Проведена подготовка данных. Изменено разделение данных. Преобразуем данные с помощью CountVectorizer. Обучена логистической регрессии.|CountVectorizer, логистическая регрессия|
|7|[Обучение без учителя](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment07_unsupervised_learning)|Провести кластеризацию набора данных и классифицировать кластеры.|Используется набор данных об активности пользователей на основе данных [Samsung Human Activity Recognition](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) Провели масштабирование выборки с использованием StandardScaler параметров по умолчанию. Сократили количество измерений. Найдено минимальное количество основных компонентов, необходимых для покрытия 90% дисперсии исходных (масштабированных) данных. Выполнена кластеризация для не размеченного набора данных. Применён алгоритм агломеративной кластеризации|кластеризация, агломеративная кластеризация, Метод главных компонент, перекрёсная проверка|
|8|[Линейная регрессия и стохастический градиентный спуск](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment08_implement_sgd_regressor)|Реализовать собственный класс SGDRegressor|Написали собственный класс SGDRegressor и протестировали его на наборе данных о росте / весе. Проведена оценка среднеквадратичной ошибки|LinearRegression, стахастический градиентный спуск|
|9|[Анализ временных рядов](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment09_time_series_analysis)|Используя Prophet и ARIMA провести анализ количества просмотров [страницы](https://en.wikipedia.org/wiki/Machine_learning) Википедии, посвященной машинному обучению.|Спрогнозировано количество просмотров страницы на определенную дату. Применены модели предсказания FB Prophet, ARIMA и SARIMAX. Проведен подбор параметров.|Проверка стационарности, FB Prophet, ARIMA, SARIMAX|
|10|[Градиентный бустинг](https://github.com/KostyaScrylyov/educational_projects_skrylev_konstantin/tree/main/open_machine_learning_course/assignment10_flight_delays_kaggle)|Решить задачу [Kaggle Inclass competition](https://www.kaggle.com/c/flight-delays-spring-2018)|Обучена модель XGBoost для предсказания, будет ли рейс задержан более чем на 15 минут.|XGBoost|
