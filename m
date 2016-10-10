From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv2 1/8] dt-bindings: mfd: Add Altera Arria10 System
 Resource Chip bindings
Date: Mon, 10 Oct 2016 12:05:30 -0500
Message-ID: <282f05ff-05d8-2f93-88bb-84808812e603@opensource.altera.com>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
 <1464889948-28793-2-git-send-email-tthayer@opensource.altera.com>
 <20160610144748.GG1537@dell>
Reply-To: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160610144748.GG1537@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 06/10/2016 09:47 AM, Lee Jones wrote:
> On Thu, 02 Jun 2016, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>
>> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> The Altera Arria10 Devkit System Resource chip is a Multi-Function
>> Device with a GPIO expander.
>>
>> This patch adds documentation for the Altera A10-SR DT bindings.
>>
>> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> ---
>> v2  Addition of IRQ controller bindings.
>>     Removal of hw_mon sub-device.
>> ---
>>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   46 ++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>
> Applied, thanks.

For some reason, I'm not seeing this in the 4.8 tree with the other mfd 
additions. Do I need to submit it to a different tree?

Thanks,

Thor
>
>> diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>> new file mode 100644
>> index 0000000..ea151f2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>> @@ -0,0 +1,46 @@
>> +* Altera Arria10 Development Kit System Resource Chip
>> +
>> +Required parent device properties:
>> +- compatible		: "altr,a10sr"
>> +- spi-max-frequency	: Maximum SPI frequency.
>> +- reg			: The SPI Chip Select address for the Arria10
>> +			  System Resource chip
>> +- interrupt-parent	: The parent interrupt controller.
>> +- interrupts		: The interrupt line the device is connected to.
>> +- interrupt-controller	: Marks the device node as an interrupt controller.
>> +- #interrupt-cells	: The number of cells to describe an IRQ, should be 2.
>> +			    The first cell is the IRQ number.
>> +			    The second cell is the flags, encoded as trigger
>> +			    masks from ../interrupt-controller/interrupts.txt.
>> +
>> +The A10SR consists of these sub-devices:
>> +
>> +Device                   Description
>> +------                   ----------
>> +a10sr_gpio               GPIO Controller
>> +
>> +Arria10 GPIO
>> +Required Properties:
>> +- compatible        : Should be "altr,a10sr-gpio"
>> +- gpio-controller   : Marks the device node as a GPIO Controller.
>> +- #gpio-cells       : Should be two.  The first cell is the pin number and
>> +                      the second cell is used to specify flags.
>> +                      See ../gpio/gpio.txt for more information.
>> +
>> +Example:
>> +
>> +        resource-manager@0 {
>> +		compatible = "altr,a10sr";
>> +		reg = <0>;
>> +		spi-max-frequency = <100000>;
>> +		interrupt-parent = <&portb>;
>> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +
>> +		a10sr_gpio: gpio-controller {
>> +			compatible = "altr,a10sr-gpio";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +		};
>> +	};
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
