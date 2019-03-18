Return-Path: <SRS0=u0Q6=RV=linaro.org=rui.silva@kernel.org>
References: <20190313184002.2501-1-rui.silva@linaro.org> <20190313184002.2501-2-rui.silva@linaro.org> <20190314190943.GB23693@arch>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v3 1/6] iio: gyro: add DT bindings to fxas21002c
In-reply-to: <20190314190943.GB23693@arch>
Date: Mon, 18 Mar 2019 08:28:40 +0000
Message-ID: <m38sxcwpqf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Tomasz,
On Thu 14 Mar 2019 at 19:09, Tomasz Duszynski wrote:
> On Wed, Mar 13, 2019 at 06:39:57PM +0000, Rui Miguel Silva 
> wrote:
>> Add device tree bindings for the FXAS21002C gyroscope.
>>
>> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> ---
>>  .../bindings/iio/gyroscope/nxp,fxas21002c.txt | 26 
>>  +++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 
>>  Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt 
>> b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
>> new file mode 100644
>> index 000000000000..68b4cd283d1d
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
>> @@ -0,0 +1,26 @@
>> +* NXP FXAS21002C Gyroscope device tree bindings
>> +
>> +http://www.nxp.com/products/sensors/gyroscopes/3-axis-digital-gyroscope:FXAS21002C
>> +
>> +Required properties:
>> +  - compatible : should be "nxp,fxas21002c"
>> +  - reg : the I2C address of the sensor or SPI chip select 
>> number for the
>> +          device.
>> +  - vdd-supply: phandle to the regulator that provides power 
>> to the sensor.
>> +  - vddio-supply: phandle to the regulator that provides power 
>> to the bus.
>> +
>> +Optional properties:
>> +  - reset-gpios : gpio used to reset the device, see 
>> gpio/gpio.txt
>> +  - interrupts : device support 2 interrupts, INT1 and INT2.
>> +                 See interrupt-controller/interrupts.txt
>
> Mentioning supported irq flags seems to be fairy common across 
> driver
> bindings. At least one does not need to scan driver sources to 
> find what is
> supported.
>
> One more thing. Your are using drive-open-drain property. 
> Perhaps it's
> worth mentioning it in this binding.

Yeah, Thanks for the reviews, I will take them in account in v4.

---
Cheers,
	Rui

>
>> +  - interrupt-names: should contain "INT1" or "INT2", the 
>> gyroscope interrupt
>> +                     line in use.
>> +
>> +Example:
>> +
>> +gyroscope@20 {
>> +	compatible = "nxp,fxas21002c";
>> +	reg = <0x20>;
>> +	vdd-supply = <&reg_peri_3p15v>;
>> +	vddio-supply = <&reg_peri_3p15v>;
>> +};
>> --
>> 2.20.1
>>
