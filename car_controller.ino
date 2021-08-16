String data;

void setup()
{
    Serial.begin(9600);
    pinMode(13, OUTPUT);
}

void loop()
{
    if (Serial.available() > 0)
    {
        data = Serial.readString();

        if (data != "STOP")
        {
            digitalWrite(13, HIGH);
        }
        else
        {
            digitalWrite(13, LOW);
        }
    }
}
