// подключаем мотор к 8му пину
int servo1_pin = 8; 
void setup() 
{
  pinMode(servo1_pin, OUTPUT);   
} 
 
void loop() 
{
    // http://www.aviafly.com.ua/stati-i-obzoryi/elektronika/sozdaem-servotester-na-baze-mikrokontrollera-atmega.html
    // генериуем управляющий сигнал в виде прямоугольного импульса,
    // 1 импульс каждые 20 мс (миллисикунд) = 50Гц - частота сигнала (ШИМ):
    // ширина импульса 0,9...1 мс - крайнее левое положение (0 градусов)
    // ширина импульса 2 мс - срединное положение (90 градусов)
    // ширина импульса 3...3,1 мс - крайнее правое положение (180 градусов)
    // все остальные значения - промежуточные микросекунды (мкс - например 1,5 мс = 1500 мкс - 45 градусов).
    
    // Сгененируем импульсы нужной длины и частоты при помощи простых вызовов digitalWrite и delay.
    // Т.к. функция delay оперирует только миллисекундами (мс - 1/1000 секунды), 
    // промежуточные значения в микросекундах (мкс - 1/1000000 секунды) этим способом задавать не сможем - 
    // только крайние левое (1 мс), среднее (2 мс) и крайнее правое (3 мс) положения.
    
    // 100 итераций по 20 мс = 2000 мс = 2 секунды
    for(int i = 0; i < 100; i++) {
        // положение ~0 градусов
        digitalWrite(servo1_pin, 1);
        delay(1);
        digitalWrite(servo1_pin, 0);
        delay(19);
    }
    
    // 100 итераций по 20 мс = 2000 мс = 2 секунды
    for(int i = 0; i < 100; i++) {
        // положение ~90 градусов
        digitalWrite(servo1_pin, 1);
        delay(2);
        digitalWrite(servo1_pin, 0);
        delay(18);
    }
    
    // 100 итераций по 20 мс = 2000 мс = 2 секунды
    for(int i = 0; i < 100; i++) {
        // положение ~180 градусов
        digitalWrite(servo1_pin, 1);
        delay(3);
        digitalWrite(servo1_pin, 0);
        delay(17);
    }
}

