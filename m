From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] leds: leds-pca963x: workaround group blink scaling issue
Date: Fri, 14 Oct 2016 08:36:23 +0200
Message-ID: <924a896d-b3f2-5fed-62ba-a731e79e1567@samsung.com>
References: <CGME20161013131622eucas1p2e419c58b25f2c61da22d390f2adfacfd@eucas1p2.samsung.com>
 <1476364572-26849-1-git-send-email-matt@ranostay.consulting>
 <ac8bb319-8ad2-65fe-e8bb-6fd9af61f046@samsung.com>
 <CAKzfze_d5rQ-MaNL1BbGXrdHG+UDNa=us68eoH_AJ-EKLnzCvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAKzfze_d5rQ-MaNL1BbGXrdHG+UDNa=us68eoH_AJ-EKLnzCvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/13/2016 04:20 PM, Matt Ranostay wrote:
> On Thu, Oct 13, 2016 at 4:05 PM, Jacek Anaszewski
> <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Hi Matt,
>>
>> On 10/13/2016 03:16 PM, Matt Ranostay wrote:
>>>
>>> PCA9632TK part seems to incorrectly blink at ~1.3x of the programmed
>>> rate. This patchset add a nxp,period-scale devicetree property to
>>> adjust for this misconfiguration.
>>>
>>> Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/leds/pca963x.txt |  3 +++
>>>  drivers/leds/leds-pca963x.c                        | 18
>>> +++++++++++++++---
>>>  2 files changed, 18 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt
>>> b/Documentation/devicetree/bindings/leds/pca963x.txt
>>> index dafbe9931c2b..dfbdb123a9bf 100644
>>> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
>>> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
>>> @@ -7,6 +7,9 @@ Optional properties:
>>>  - nxp,totem-pole : use totem pole (push-pull) instead of open-drain
>>> (pca9632 defaults
>>>    to open-drain, newer chips to totem pole)
>>>  - nxp,hw-blink : use hardware blinking instead of software blinking
>>> +- nxp,period-scale : In some configurations, the chip blinks faster than
>>> expected.
>>> +                    This parameter provides a scaling ratio (fixed point,
>>> decimal divided
>>> +                    by 1000) to compensate, e.g. 1300=1.3x and 750=0.75x.
>>
>>
>> Why DT property? Is it somehow dependent on the board configuration?
>> How this period-scale value is calculated? Is it inferred empirically?
>>
>
> We empirically discovered and verified this with an logic analyzer on
> multiple batches of this part.
> Reason for the DT entry is we aren't 100% sure that it is always going
> to be the same with different board revs.
>
> Could be that parts clock acts differently with supply voltage.   This
> has been calculated by setting it an expected value, and measuring the
> actual result with the logic analyzer.

I'd like to have DT maintainer's ack for this.

Cc Rob and Mark.

>>>  Each led is represented as a sub-node of the nxp,pca963x device.
>>>
>>> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
>>> index 407eba11e187..b6ce1f2ec33e 100644
>>> --- a/drivers/leds/leds-pca963x.c
>>> +++ b/drivers/leds/leds-pca963x.c
>>> @@ -59,6 +59,7 @@ struct pca963x_chipdef {
>>>         u8                      grpfreq;
>>>         u8                      ledout_base;
>>>         int                     n_leds;
>>> +       unsigned int            scaling;
>>>  };
>>>
>>>  static struct pca963x_chipdef pca963x_chipdefs[] = {
>>> @@ -189,6 +190,14 @@ static int pca963x_led_set(struct led_classdev
>>> *led_cdev,
>>>         return pca963x_brightness(pca963x, value);
>>>  }
>>>
>>> +static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
>>> +       unsigned int val)
>>> +{
>>> +       unsigned int scaling = pca963x->chip->chipdef->scaling;
>>> +
>>> +       return scaling ? DIV_ROUND_CLOSEST(val * scaling, 1000) : val;
>>> +}
>>> +
>>>  static int pca963x_blink_set(struct led_classdev *led_cdev,
>>>                 unsigned long *delay_on, unsigned long *delay_off)
>>>  {
>>> @@ -207,14 +216,14 @@ static int pca963x_blink_set(struct led_classdev
>>> *led_cdev,
>>>                 time_off = 500;
>>>         }
>>>
>>> -       period = time_on + time_off;
>>> +       period = pca963x_period_scale(pca963x, time_on + time_off);
>>>
>>>         /* If period not supported by hardware, default to someting sane.
>>> */
>>>         if ((period < PCA963X_BLINK_PERIOD_MIN) ||
>>>             (period > PCA963X_BLINK_PERIOD_MAX)) {
>>>                 time_on = 500;
>>>                 time_off = 500;
>>> -               period = time_on + time_off;
>>> +               period = pca963x_period_scale(pca963x, 1000);
>>>         }
>>>
>>>         /*
>>> @@ -222,7 +231,7 @@ static int pca963x_blink_set(struct led_classdev
>>> *led_cdev,
>>>          *      (time_on / period) = (GDC / 256) ->
>>>          *              GDC = ((time_on * 256) / period)
>>>          */
>>> -       gdc = (time_on * 256) / period;
>>> +       gdc = (pca963x_period_scale(pca963x, time_on) * 256) / period;
>>>
>>>         /*
>>>          * From manual: period = ((GFRQ + 1) / 24) in seconds.
>>> @@ -294,6 +303,9 @@ pca963x_dt_init(struct i2c_client *client, struct
>>> pca963x_chipdef *chip)
>>>         else
>>>                 pdata->blink_type = PCA963X_SW_BLINK;
>>>
>>> +       if (of_property_read_u32(np, "nxp,period-scale", &chip->scaling))
>>> +               chip->scaling = 1000;
>>> +
>>>         return pdata;
>>>  }
>>>
>>>
>>
>>
>> --
>> Best regards,
>> Jacek Anaszewski
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
