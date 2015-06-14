From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] iio: adc: vf610: implement configurable conversion
 modes
Date: Sun, 14 Jun 2015 12:12:04 +0100
Message-ID: <557D6184.90105@kernel.org>
References: <1432730872-14325-1-git-send-email-stefan@agner.ch> <1432730872-14325-2-git-send-email-stefan@agner.ch> <CAL_JsqK0YxgJ-k8kSs6XQj9n3FSg4QBd-GdFEfcafH7Cm4NreQ@mail.gmail.com> <14d469dedae9de1ce519fe90401e526e@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <14d469dedae9de1ce519fe90401e526e-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/06/15 21:07, Stefan Agner wrote:
> On 2015-06-08 19:49, Rob Herring wrote:
>> On Wed, May 27, 2015 at 7:47 AM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>>> Support configurable conversion mode through sysfs. So far, the
>>> mode used was low-power, which is enabled by default now. Beside
>>> that, the modes normal and high-speed are selectable as well.
>>>
>>> Use the new device tree property which specifies the maximum ADC
>>> conversion clock frequencies. Depending on the mode used, the
>>> available resulting conversion frequency are calculated
>>> dynamically.
>>>
>>> Acked-by: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>>> ---
>>>  Documentation/ABI/testing/sysfs-bus-iio-vf610      |   7 +
>>>  .../devicetree/bindings/iio/adc/vf610-adc.txt      |   9 ++
>>>  drivers/iio/adc/vf610_adc.c                        | 146 +++++++++++++++------
>>>  3 files changed, 120 insertions(+), 42 deletions(-)
>>>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-vf610
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-vf610 b/Documentation/ABI/testing/sysfs-bus-iio-vf610
>>> new file mode 100644
>>> index 0000000..ecbc1f4
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-bus-iio-vf610
>>> @@ -0,0 +1,7 @@
>>> +What:          /sys/bus/iio/devices/iio:deviceX/conversion_mode
>>> +KernelVersion: 4.2
>>> +Contact:       linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> +Description:
>>> +               Specifies the hardware conversion mode used. The three
>>> +               available modes are "normal", "high-speed" and "low-power",
>>> +               where the last is the default mode.
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
>>> index 1a4a43d..3eb40e2 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
>>> +++ b/Documentation/devicetree/bindings/iio/adc/vf610-adc.txt
>>> @@ -11,6 +11,13 @@ Required properties:
>>>  - clock-names: Must contain "adc", matching entry in the clocks property.
>>>  - vref-supply: The regulator supply ADC reference voltage.
>>>
>>> +Recommended properties:
>>> +- fsl,adck-max-frequency: Maximum frequencies according to datasheets operating
>>> +  requirements. Three values are required, depending on conversion mode:
>>> +  - Frequency in normal mode (ADLPC=0, ADHSC=0)
>>> +  - Frequency in high-speed mode (ADLPC=0, ADHSC=1)
>>> +  - Frequency in low-power mode (ADLPC=1, ADHSC=0)
>>
>> Why is this "adck" rather than "adc"?
> 
> That is the name of the clock according to the reference manual and data
> sheet.
> 
>> How is this related to today's patch adding min-sample-time?
> 
> It is related in that this clock is the base to calculate the sampling
> time, but otherwise not really related. Afaik, not respecting the
> maximum clock frequency is probably more a issue for the SAR part of the
> ADC.
Rob, are you happy with Stefan's responses?
> 
> --
> Stefan
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
