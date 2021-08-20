String data;

int In1 = 8;
int In2 = 9;
int In3 = 10;
int In4 = 11;

void setup()
{
    Serial.begin(9600);
    pinMode(In1, OUTPUT);
    pinMode(In2, OUTPUT);
    pinMode(In3, OUTPUT);
    pinMode(In4, OUTPUT);
    Serial.setTimeout(10);
}

void loop()
{
    if (Serial.available() > 0)
    {
        data = Serial.readString();

        if (data == "FORWARD")
        {
            digitalWrite(In1, HIGH);
            digitalWrite(In2, LOW);
            digitalWrite(In3, HIGH);
            digitalWrite(In4, LOW);
        }
        else if (data == "BACK")
        {
            digitalWrite(In1, LOW);
            digitalWrite(In2, HIGH);
            digitalWrite(In3, LOW);
            digitalWrite(In4, HIGH);
        }
        else if (data == "LEFT")
        {
            digitalWrite(In1, HIGH);
            digitalWrite(In2, LOW);
            digitalWrite(In3, LOW);
            digitalWrite(In4, HIGH);
        }
        else if (data == "RIGHT")
        {
            digitalWrite(In1, LOW);
            digitalWrite(In2, HIGH);
            digitalWrite(In3, HIGH);
            digitalWrite(In4, LOW);
        }
        else if (data == "STOP")
        {
            digitalWrite(In1, LOW);
            digitalWrite(In2, LOW);
            digitalWrite(In3, LOW);
            digitalWrite(In4, LOW);
        }
    }
}
