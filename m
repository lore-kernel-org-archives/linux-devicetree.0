From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/4] iio: lps331ap: Add support for DT
Date: Tue, 02 Jul 2013 17:28:47 +0200
Message-ID: <51D2F1AF.2040809@samsung.com>
References: <1372767338-13179-1-git-send-email-l.czerwinski@samsung.com> <1372767338-13179-5-git-send-email-l.czerwinski@samsung.com> <51D2CE03.2070704@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51D2CE03.2070704-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/02/2013 02:56 PM, Lars-Peter Clausen wrote:
> On 07/02/2013 02:15 PM, Lukasz Czerwinski wrote:
>> From: Jacek Anaszewski<j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> This patch adds DT support for the lps331ap barometer
>> sensor.
>>
>> Signed-off-by: Jacek Anaszewski<j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park<kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   .../bindings/iio/pressure/st_pressure.txt          |   41 ++++++++++++++++++++
>>   drivers/iio/pressure/st_pressure_i2c.c             |    9 +++++
>>   drivers/iio/pressure/st_pressure_spi.c             |    9 +++++
>>   3 files changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/pressure/st_pressure.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt b/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt
>> new file mode 100644
>> index 0000000..73a4b7d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt
>> @@ -0,0 +1,41 @@
>> +* STMicroelectronics LPS331AP barometer sensor
>> +
>> +Required properties:
>> +
>> +  - compatible : should be "lps331ap"
>
> Needs the vendor prefix.
>
>> +  - reg : the I2C address of the barometer
>> +
>> +Optional properties:
>> +
>> +  - drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
>> +  - interrupt-parent : phandle to the interrupt map subnode
>> +  - interrupts : interrupt mapping for LPS331AP interrupt sources:
>> +		2 sources: 0 - INT1, 1 - INT2
>> +  - irq-map : irq sub-node defining interrupt map
>> +	      (all properties listed below are required):
>> +      - #interrupt-cells : should be 1
>> +      - #address-cells : should be 0
>> +      - #size-cells : should be 0
>> +      - interrupt-map : table of entries consisting of three child elements:
>> +	  - unit_interrupt_specifier - 0 : INT1, 1 : INT2
>> +	  - interrupt parent phandle
>> +	  - parent unit interrupt specifier consisiting of two elements:
>> +	      - index of the interrupt within the controller
>> +	      - flags : should be 0
>
> While this works I wonder why you choose such a complicated example for setting
> up the IRQ? Why not just reference the IRQ directly using the interrupts property?

Hi Lars,

I will try to clarify the reasons why the interrupt map was exploited:

1) The device exposes two interrupt pins: INT1 and INT2.
2) Both of them can be configured either to generate data ready
    interrupts or event interrupts.
3) drdy-int-pin property conveys the information about the interrupt
    pin routed to the CPU and allows the driver to configure
    the device to generate data ready interrupts on the connected pin.
4) The lps331ap barometer sensor handles only data ready interrupts
    but it depends on the st_sensors library which expects interrupt map
    in the device tree node.
5) Because of the support for events added to the library in this
    series it should be possible to pass two irq's to the driver. From
    what I know it can't be accomplished with interrupts property if
    the interrupts originate from different interrupt parents (which is
    the case I deal with, where device int sources are routed to the
    GPIOs in different banks).
6) I agree that map filled with only one element may confuse the reader
    but it is required for the st_common library to successfully parse
    the node.

If you know better solution please let me know.
Of course I agree with your remaining remarks.

Thanks,
Jacek
