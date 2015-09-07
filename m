From: Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/2] devicetree: Add documentation for UPISEMI us5182d
 ALS and Proximity sensor
Date: Mon, 07 Sep 2015 16:59:58 +0300
Message-ID: <55ED985E.8070806@intel.com>
References: <1440065534-8601-1-git-send-email-adriana.reus@intel.com> <1440065534-8601-3-git-send-email-adriana.reus@intel.com> <55DF71A5.1010705@kernel.org> <CAL_Jsq+uvhaE77yXqKGXF_p6gAV5F+rPwnT547ym-o23=3fR+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+uvhaE77yXqKGXF_p6gAV5F+rPwnT547ym-o23=3fR+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for your feedback, some comments inline.

On 31.08.2015 18:38, Rob Herring wrote:
> On Thu, Aug 27, 2015 at 3:23 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On 20/08/15 11:12, Adriana Reus wrote:
>>> Added entries in i2c/vendor-prefixes for the us5182d als and proximity sensor.
>>> Also added a documentation file for this sensor's properties.
>>>
>>> Signed-off-by: Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> This isn't that trivial so I'd like some device tree maintainer
>> input if possible.
>
> It seems fairly reasonable to me. Would other ALS or proximity sensors
> need similar properties?
The "glass-coef" is intended to compensate for the material (glass) that 
may be covering the sensor if it's integrated in a phone, tablet etc. I 
chose 1000 as resolution for this scaling factor (i'll add a more 
detailed description). So possibly similar properties could be used for 
other als sensors as well.

The last 3 tuning parameters are specific to this particular sensor.
>
>> For now I've backed out the driver from my tree (given timing we have
>> loads of time to sort this out!)
>>
>> Anyhow, anyone device tree related able to take a look at this.
>>
>> Adriana, btw these should be cc'd to the device tree maintainers in
>> the first place (now added).
>>
>> Jonathan
>>> ---
>>>   .../devicetree/bindings/iio/light/us5182d.txt      | 23 ++++++++++++++++++++++
>>>   .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>>>   2 files changed, 24 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/iio/light/us5182d.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/light/us5182d.txt b/Documentation/devicetree/bindings/iio/light/us5182d.txt
>>> new file mode 100644
>>> index 0000000..7785c56
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/light/us5182d.txt
>>> @@ -0,0 +1,23 @@
>>> +* UPISEMI us5182d I2C ALS and Proximity sensor
>>> +
>>> +Required properties:
>>> +- compatible: must be "upisemi,usd5182"
>>> +- reg: the I2C address of the device
>>> +
>>> +Optional properties:
>
> Do you expect certain defaults if not present? Some description of how
> all these values are determined would be useful.
Yes, if not present they will fall back to default values - the values 
in the example.
- the glass-coef one is 1000 by default - so no glass compensation by 
default (lux = lux * 1000/1000)
- the others were determined experimentally - by fine tuning starting 
from the default values in those registers).
>
>
>>> +- upisemi,glass-coef: glass attenuation factor
>>> +- upisemi,dark-ths: array of thresholds (adc counts) corresponding to every scale
>
> What is the size of the array and valid range of values?
>
> Be specific this is 16-bit property.
Ok, I'll add this info in a following patch set.
>
>>> +- upisemi,upper-dark-gain: tuning factor(4 int and 4 fractional bits - Q4.4) applied when light > threshold
>>> +- upisemi,lower-dark-gain: tuning factor(4 int and 4 fractional bits - Q4.4) applied when light < threshold
>
> Be specific this is an 8-bit property.
ok
>
>>> +
>>> +Example:
>>> +
>>> +    usd5182@39 {
>>> +                compatible = "upisemi,usd5182";
>>> +                reg = <0x39>;
>>> +                upisemi,glass-coef = < 1000 >;
>>> +                upisemi,dark-ths = /bits/ 16 <170 200 512 512 800 2000 4000 8000>;
>>> +                upisemi,upper-dark-gain = /bits/ 8 <0x00>;
>>> +                upisemi,lower-dark-gain = /bits/ 8 <0x16>;
>>> +    };
>>> +
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> index d444757..5b40bab 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> @@ -211,6 +211,7 @@ toshiba   Toshiba Corporation
>>>   toumaz       Toumaz
>>>   tplink       TP-LINK Technologies Co., Ltd.
>>>   truly        Truly Semiconductors Limited
>>> +upisemi      uPI Semiconductor Corp.
>>>   usi  Universal Scientific Industrial Co., Ltd.
>>>   v3   V3 Semiconductor
>>>   variscite    Variscite Ltd.
>>>
>>
