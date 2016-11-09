From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: Re: [PATCH 2/2] Documentation: DT: Add bmi160 imu binding
Date: Wed, 9 Nov 2016 16:18:34 +0100
Message-ID: <d07474fc-e6c9-d529-6a06-0549f3dfad52@grinn-global.com>
References: <20161103112527.29623-1-m.niestroj@grinn-global.com>
 <20161103112527.29623-2-m.niestroj@grinn-global.com>
 <e46a4b5e-a347-f268-80f4-0ee1edc77aac@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e46a4b5e-a347-f268-80f4-0ee1edc77aac-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06.11.2016 13:41, Jonathan Cameron wrote:
> On 03/11/16 11:25, Marcin Niestroj wrote:
>> This adds documentation for Bosch BMI160 Inertial Measurement Unit
>> device-tree bindings.
>>
>> Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
> Unless I missed it in the previous patch we should also have of tables
> added to the i2c and spi files (which is why the various tests haven't
> been screaming at me that this device doesn't have documented bindings).

Ok, I will add them.

>
> Otherwise, the use of interrupt names to indicate which pin on the chip
> is a little unusual (if you cribbed this from somewhere I've forgotten
> about then do say so!), so will want a devicetree bindings maintainer
> input on this.

I have used interrupt names similar as in other driver. Please see [1] 
for it's DT documentation and [2] for implementation.

[1] Documentation/devicetree/bindings/iio/accel/mma8452.txt
[2] drivers/iio/accel/mma8452.c

>
> Thanks,
>
> Jonathan
>> ---
>>  .../devicetree/bindings/iio/imu/bmi160.txt         | 34 ++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/imu/bmi160.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
>> new file mode 100644
>> index 0000000..b02ef3e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
>> @@ -0,0 +1,34 @@
>> +Bosch BMI160 - Inertial Measurement Unit with Accelerometer, Gyroscope
>> +and externally connectable Magnetometer
>> +
>> +https://www.bosch-sensortec.com/bst/products/all_products/bmi160
>> +
>> +Required properties:
>> + - compatible : should be "bosch,bmi160"
>> + - reg : the I2C address or SPI chip select number of the sensor
>> + - spi-max-frequency : set maximum clock frequency (only for SPI)
>> +
>> +Optional properties:
>> + - interrupt-parent : should be the phandle of the interrupt controller
>> + - interrupts : interrupt mapping for GPIO IRQ, must be IRQ_TYPE_LEVEL_LOW
>> + - interrupt-names : set to "INT2" if using INT2 pin
>> +
>> +Examples:
>> +
>> +bmi160@68 {
>> +	compatible = "bosch,bmi160";
>> +	reg = <0x68>;
>> +
>> +	interrupt-parent = <&gpio4>;
>> +	interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
>> +};
>> +
>> +bmi160@0 {
>> +	compatible = "bosch,bmi160";
>> +	reg = <0>;
>> +	spi-max-frequency = <10000000>;
>> +
>> +	interrupt-parent = <&gpio2>;
>> +	interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
>> +	interrupt-names = "INT2";
>> +};
>>
>

-- 
Marcin Niestroj
