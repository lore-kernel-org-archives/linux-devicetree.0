From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] iio:as3935: Add DT binding docs for AS3935 driver
Date: Wed, 05 Feb 2014 10:58:18 +0000
Message-ID: <2072f753-6b83-4983-8434-709e35dded3b@email.android.com>
References: <1391570096-2932-1-git-send-email-mranostay@gmail.com> <20140205044335.GA2172@beef> <634e62ea-d33f-42f3-8500-6331d4de495d@email.android.com> <CAKzfze8d7uzwmTByJD-jmZszeD7fr=1k0y0jdCLU92wNOD=NMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKzfze8d7uzwmTByJD-jmZszeD7fr=1k0y0jdCLU92wNOD=NMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On February 5, 2014 10:22:24 AM GMT+00:00, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>On Tue, Feb 4, 2014 at 11:24 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>wrote:
>>
>>
>> On February 5, 2014 4:43:35 AM GMT+00:00, Matt Porter
><mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>On Tue, Feb 04, 2014 at 07:14:55PM -0800, Matt Ranostay Matt Ranostay
>>>wrote:
>>>> Document compatible string, required and optional DT properties for
>>>> AS3935 chipset driver.
>>>>
>>>> Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/iio/proximity/as3935.txt   | 25
>>>++++++++++++++++++++++
>>>>  1 file changed, 25 insertions(+)
>>>>  create mode 100644
>>>Documentation/devicetree/bindings/iio/proximity/as3935.txt
>>>>
>>>> diff --git
>>>a/Documentation/devicetree/bindings/iio/proximity/as3935.txt
>>>b/Documentation/devicetree/bindings/iio/proximity/as3935.txt
>>>> new file mode 100644
>>>> index 0000000..7e117cd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/iio/proximity/as3935.txt
>>>> @@ -0,0 +1,25 @@
>>>> +Austrian Microsystems AS3935 Franklin lightning sensor device
>driver
>>>> +
>>>> +Required properties:
>>>> +    - compatible: must be "ams,as3935"
>>>
>>>Change this to "amstaos,as3935"
>>>
>>>amstaos (AMS bought Taos) is already a registered vendor prefix in
>>>vendor-prefixes.txt
>>
>> It is but has a rather separate presence and is not where people
>expect to find non light
>>  sensor stuff from ams. I personally would go for a new vendor prefix
>and stick with ams.
>>
>
>So should I add to vendor-prefixes.txt as well? or not?
Yes. All vendor prefixes should be in there
>
>>>
>>>> +    - reg: SPI chip select number for the device
>>>> +    - spi-cpha: SPI Mode 1
>>>
>>>When using generic binding properties, please reference the binding
>>>being used. Like:
>>>
>>>       - spi-cpha: SPI Mode 1. Refer to spi/spi-bus.txt for generic
>SPI
>>>         slave node bindings.
>>>
>>>> +    - interrupt-parent : should be the phandle for the interrupt
>>>controller
>>>> +    - interrupts : interrupt mapping for GPIO IRQ
>>>
>>>       Refer to interrupt-controller/interrupts.txt for generic
>>>       interrupt client node bindings.
>>>
>>>> +
>>>> +Optional properties:
>>>> +    - ams,tune-cap: Calibration tuning capacitor stepping value 0
>- 15.
>>>> +      Range of 0 to 120 pF, 8pF steps. This will require using the
>>>> +      calibration data from the manufacturer.
>>>> +
>>>> +
>>>> +Example:
>>>> +
>>>> +as3935@0 {
>>>> +    compatible = "ams,as3935";
>>>> +    reg = <0>;
>>>> +    spi-cpha;
>>>> +    interrupt-parent = <&gpio1>;
>>>> +    interrupts = <16 1>;
>>>> +    ams,tune-cap = /bits/ 8 <10>;
>>>
>>>What is this? Why not just ams,tune-cap = <10>; ?
>>>
>>>It's a value between 0-15, right?
>>>
>>>-Matt
>>>--
>>>To unsubscribe from this list: send the line "unsubscribe linux-iio"
>in
>>>the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>> --
>> Sent from my Android phone with K-9 Mail. Please excuse my brevity.
>--
>To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
