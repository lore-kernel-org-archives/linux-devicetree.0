From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/4] iio: lps331ap: Add support for DT
Date: Fri, 19 Jul 2013 15:43:13 +0200
Message-ID: <51E94271.4020206@samsung.com>
References: <1372767338-13179-1-git-send-email-l.czerwinski@samsung.com> <1372767338-13179-5-git-send-email-l.czerwinski@samsung.com> <20130716132204.GG3125@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130716132204.GG3125@lukather>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/16/2013 03:22 PM, Maxime Ripard wrote:

Hi Maxime,

> Hi Jacek,
>
> I find myself needing these bindings as well, so I'm definitely
> interested by your patches.
>
> On Tue, Jul 02, 2013 at 02:15:38PM +0200, Lukasz Czerwinski wrote:
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
>> +  - reg : the I2C address of the barometer
>> +
>> +Optional properties:
>> +
>> +  - drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
>> +  - interrupt-parent : phandle to the interrupt map subnode
>> +  - interrupts : interrupt mapping for LPS331AP interrupt sources:
>> +		2 sources: 0 - INT1, 1 - INT2
>
> Maybe you could use interrupts-names here, instead of requiring to
> hardcode the interrupt index.

 From what I've figured out in order to obtain the interrupt id
by name the function

platform_get_irq_by_name(struct platform_device *dev, const char *name)

has to be exploited. Unfortunately required platform_device structure
is not available in the struct i2c_client that is passed to the
probe function of an i2c driver. The interrupt-names property would be 
indeed neater here, if only it was usable from i2c driver.

> Plus, I guess that it's assuming that you
> can only use INT2 when you already use INT1?

As I see now the binding documentation file I submitted is confusing.
I fixed it in the second version of the patch. Currently description
of the interrupt map elements is as follows:

0 - data ready interrupt
1 - threshold interrupt

which means that you can use INT2 even though you don't use INT1.
This is the case I have on my board - I have only INT2 pin of
lps331ap device routed to the CPU. I define interrupt map
with only one element with index 0 (which means that I want
it to act as a data ready interrupt) and I assign 2 to the
drdy-int-pin property which instructs the driver to configure
data ready interrupt on the INT2 pin.

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
> I don't really get why it's needed. Isn't that redundant with the
> interrupt parent and the interrupt number already defined by
> interrupt-parent and interrupts in the top node?

I'm aware that this adds much noise but I couldn't have found
other solution which would allow to define more than one interrupts
for the i2c device.

Thanks,
Jacek
