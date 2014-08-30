From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: adc: ti_am335x_adc: make sample delay, open
 delay, averaging DT parameters
Date: Sat, 30 Aug 2014 10:34:10 +0100
Message-ID: <54019A92.9010907@kernel.org>
References: <1409141990-29627-1-git-send-email-vigneshr@ti.com> <1409141990-29627-2-git-send-email-vigneshr@ti.com> <20140827135635.GH6364@lee--X1> <53FEBA43.2000607@ti.com> <20140828071123.GE24579@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140828071123.GE24579@lee--X1>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28/08/14 08:11, Lee Jones wrote:
> On Thu, 28 Aug 2014, Vignesh R wrote:
>> On Wednesday 27 August 2014 07:26 PM, Lee Jones wrote:
>>> On Wed, 27 Aug 2014, Vignesh R wrote:
>>>
>>>> Number of averaging, open delay, sample delay are made DT parameters.
>>>> By decreasing averaging and delays more samples can be obtained per
>>>> second increasing performance of ADC. Previously the number of
>>>> averages per step was fixed to 16. Making these parameters
>>>> configurable will help in balancing speed vs accuracy.
>>>> For each ADC step provide DT based paramters to set open delay,
>>>> sample delay and number of averaging. One configurable step is
>>>> used per ADC channel. Since there can be atmost 8 ADC channels,
>>>> steps 16 to 8 are used for ADC.
>>>>
>>>> Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
>>>> ---
>>>>  .../bindings/input/touchscreen/ti-tsc-adc.txt      |   18 +++++++
>>>>  drivers/iio/adc/ti_am335x_adc.c                    |   49 +++++++++++++++++---
>>>>  include/linux/mfd/ti_am335x_tscadc.h               |    3 ++
>>>>  3 files changed, 63 insertions(+), 7 deletions(-)
>>>
>>> [...]
>>>
>>>> diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
>>>> index fb96c84..26d3e84 100644
>>>> --- a/include/linux/mfd/ti_am335x_tscadc.h
>>>> +++ b/include/linux/mfd/ti_am335x_tscadc.h
>>>> @@ -82,14 +82,17 @@
>>>
>>> There are so many different formats at play here, it's difficult to
>>> see what's happening where!
>>
>> I did not understand "different formats". Please explain.
> 
> My complaint is with the existing layout, rather than your patch:
> 
>> #define STEPCONFIG_INP_AN4     STEPCONFIG_INP(4)
>> #define STEPCONFIG_INP_ADCREFM STEPCONFIG_INP(8)
>> #define STEPCONFIG_FIFO1       BIT(26)
> 
> Base10 MACROS.
> 
> #define STEPCONFIG_AVG_MAX     16
> 
> Base10 int.
> 
>> /* Delay register */
>> #define STEPDELAY_OPEN_MASK    (0x3FFFF << 0)
> 
> Base16 shift.
> 
>> #define STEPDELAY_OPEN(val)    ((val) << 0)
> 
> MACRO shift.
> 
>> #define STEPCONFIG_OPENDLY     STEPDELAY_OPEN(0x098)
> 
> Base16 MACRO.
> 
>> #define STEPDELAY_OPEN_MAX     0x3FFFF
> 
> Base16 int.
> 
>> #define STEPDELAY_SAMPLE_MASK  (0xFF << 24)
> 
> Base16 shift.
> 
>> #define STEPDELAY_SAMPLE(val)  ((val) << 24)
> 
> MACRO shift.
> 
>> #define STEPCONFIG_SAMPLEDLY   STEPDELAY_SAMPLE(0)
> 
> 24 shift of 0 (still zero?).
> 
>> #define STEPDELAY_SAMPLE_MAX   0xFF
> 
> Base16 int.
> 
> There is no consistency here, it's just a bunch of 'stuff', which
> makes making sense of them all difficult.
> 
>>>>  #define STEPCONFIG_INP_AN4	STEPCONFIG_INP(4)
>>>>  #define STEPCONFIG_INP_ADCREFM	STEPCONFIG_INP(8)
>>>>  #define STEPCONFIG_FIFO1	BIT(26)
>>>> +#define STEPCONFIG_AVG_MAX	16
>>>>  
>>>>  /* Delay register */
>>>>  #define STEPDELAY_OPEN_MASK	(0x3FFFF << 0)
>>>>  #define STEPDELAY_OPEN(val)	((val) << 0)
>>>
>>> What's the point in shifting by zero?
>>
>> I agree. But my patch did not add these lines. I can remove them. Do you
>> want me to do this change as part of current patch or as a separate
>> cleanup patch?
> 
> That's up to Jonathan.
I'm always happy to take sane cleanups like this.  Separate cleanup patch please.
That way it's easy to verify that there are no functional changes without it
getting in the way of the 'interesting' patch.

Thanks,

Jonathan
> 
