Submitted required tidy dataset is stored in data.txt.
The tidy is csv containing space delimiters.

Variables:

ID:
- subject: identifier of measured person
data type: integer
range: 1-30

- indexActivity: identifier of activity during measurement
data type: text
range:
WALKING: subject was walking
WALKING_UPSTAIRS: subject was walking upstairs
WALKING_DOWNSTAIRS: subject was walking downstairs
SITTING: subject was sitting
STANDING: subject was standing
LAYING: subject was laying

Measurements:
note: all measurements are normalized in range of [-1;1]

- Accelerometer: measurement of acceleration [9.81ms-1]
- Gyroscope: measurement of movement, angle change [rad*s-1]
- Magnitude: three dimensional changes, [m]

Classification in 2 dimension:
* time [TimeDomain]
* frequency [FrequencyDomain]
