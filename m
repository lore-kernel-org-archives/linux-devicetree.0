From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Documentation: DT: Add bmi160 imu binding
Date: Fri, 30 Dec 2016 10:40:05 +0000
Message-ID: <c708eb02-585e-8463-c717-3d20da05495b@kernel.org>
References: <20161208142259.26230-1-m.niestroj@grinn-global.com>
 <20161208142259.26230-4-m.niestroj@grinn-global.com>
 <20161212171500.7w67evyvicdpfkfc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161212171500.7w67evyvicdpfkfc@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/12/16 17:15, Rob Herring wrote:
> On Thu, Dec 08, 2016 at 03:22:56PM +0100, Marcin Niestroj wrote:
>> This adds documentation for Bosch BMI160 Inertial Measurement Unit
>> device-tree bindings.
>>
>> Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
>> ---
>> Changes v1 -> v2 (suggested by Rob):
>>  * remove "gpio" keyword from interrupts property description
>>  * describe "INT1" and "INT2" cases for interrupt-names property
>>
>>  .../devicetree/bindings/iio/imu/bmi160.txt         | 36 ++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/imu/bmi160.txt
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out as testing for
the autobuilders to completely ignore this patch.

Thanks,

Jonathan
> 
>>
>> diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
>> new file mode 100644
>> index 0000000..ae0112c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
>> @@ -0,0 +1,36 @@
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
>> + - interrupts : interrupt mapping for IRQ, must be IRQ_TYPE_LEVEL_LOW
>> + - interrupt-names : set to "INT1" if INT1 pin should be used as interrupt
>> +   input, set to "INT2" if INT2 pin should be used instead
>> +
>> +Examples:
>> +
>> +bmi160@68 {
>> +	compatible = "bosch,bmi160";
>> +	reg = <0x68>;
>> +
>> +	interrupt-parent = <&gpio4>;
>> +	interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
>> +	interrupt-names = "INT1";
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
>> -- 
>> 2.10.2
>>
