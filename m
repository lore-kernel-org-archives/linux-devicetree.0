From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/3] usb: dwc3: of-simple: add support for shared and
 pulsed reset lines
Date: Sat, 3 Feb 2018 21:00:06 +0100
Message-ID: <CAFBinCBLNOq=S6sNczCDZ6rj32euX-aD0ux4Er10MrAo9M6-kQ@mail.gmail.com>
References: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
 <20180128200333.20093-3-martin.blumenstingl@googlemail.com> <87fu6pjcx7.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fu6pjcx7.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Mon, Jan 29, 2018 at 9:18 AM, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Hi,
>
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>> Some SoCs (such as Amlogic Meson GXL for example) share the reset line
>> with other components (in case of the Meson GXL example there's a shared
>> reset line between the USB2 PHYs, USB3 PHYs and the dwc3 controller).
>> Additionally SoC implementations may prefer a reset pulse over level
>> resets.
>>
>> Add an internal per-of_device_id struct which can be used to configure
>> whether the reset lines are shared and whether they use level or pulse
>> resets.
>>
>> For now this falls back to the old defaults, which are:
>> - reset lines are exclusive
>> - level resets are being used
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  drivers/usb/dwc3/dwc3-of-simple.c | 65 ++++++++++++++++++++++++++++++++-------
>>  1 file changed, 54 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
>> index 7ae0eefc7cc7..ceb9f0cd822a 100644
>> --- a/drivers/usb/dwc3/dwc3-of-simple.c
>> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
>> @@ -22,11 +22,22 @@
>>  #include <linux/pm_runtime.h>
>>  #include <linux/reset.h>
>>
>> +/**
>> + * struct dwc3_of_simple_params - hardware specific parameters
>> + * @shared_resets: indicates that the resets are shared or exclusive
>> + * @pulse_resets: use a reset pulse instead of level based resets
>> + */
>> +struct dwc3_of_simple_params {
>> +     bool                    shared_resets;
>> +     bool                    pulse_resets;
>> +};
>> +
>>  struct dwc3_of_simple {
>>       struct device           *dev;
>>       struct clk              **clks;
>>       int                     num_clocks;
>>       struct reset_control    *resets;
>> +     const struct dwc3_of_simple_params      *params;
>
> instead, you can add these two fields here:
>
>         bool shared_resets;
>         bool pulse_resets;
>
> and ...
>
>> @@ -90,17 +101,26 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>>
>>       platform_set_drvdata(pdev, simple);
>>       simple->dev = dev;
>> +     simple->params = of_device_get_match_data(dev);
>>
>> -     simple->resets = of_reset_control_array_get_optional_exclusive(np);
>> +     simple->resets = of_reset_control_array_get(np,
>> +                                             simple->params->shared_resets,
>> +                                             true);
>
> wrap this with a of_device_is_compatible() check:
>
>         if (of_device_is_compatible(dev->of_node, "foobar")) {
>                 simple->shared_resets = true;
>                 simple->pulse_resets = true;
>         }
>
> or something like that. Then we don't need to add a new
> dwc3_of_simple_params for everybody.
sure, I can do this if that fits the coding style in the dwc3 driver better
in that case, do you still want me to keep patches #2 and #3 separate?

> Also, the why isn't the reset type (pulse vs level) handled by reset
> framework itself? Why does dwc3-of-simple need to know about it?
the Amlogic reset driver supports both, level resets and reset pulses
unfortunately the reset line is de-asserted by default, so to reset it
we would have to:
- assert it first
- then de-assert it again

however, the reset framework does not allow this for shared resets
(see reset_control_assert: it triggers a WARN_ON if we try to assert a
shared reset which has not been de-asserted yet)
together with the fact that there are reset controller hardware
implementations out there which don't support level resets I decided
to implement it as reset pulse


Regards
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
