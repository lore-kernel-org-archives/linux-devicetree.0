From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 7/7] ARM: dts: add suspend voltage setting for RK808
Date: Wed, 29 Oct 2014 09:51:32 -0700
Message-ID: <CAD=FV=VtKdLH51tDvHsRfMYah9cUNcNRfbVJ1rfroxwsZZLTsA@mail.gmail.com>
References: <1414583525-17395-1-git-send-email-zyw@rock-chips.com>
	<1414583525-17395-8-git-send-email-zyw@rock-chips.com>
	<CAD=FV=XeGj63_MEPL5i1ihUORuHnwD1ktEjJN5x=B-tkHV088w@mail.gmail.com>
	<545115DF.9070008@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545115DF.9070008-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Javier,

On Wed, Oct 29, 2014 at 9:29 AM, Javier Martinez Canillas
<javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
>>> @@ -76,6 +80,7 @@
>>>                                 regulator-min-microvolt = <3300000>;
>>>                                 regulator-max-microvolt = <3300000>;
>>>                                 regulator-name = "vccio_pmu";
>>> +                               regulator-suspend-mem-microvolt = <3300000>;
>>
>> Similarly this property isn't upstream.  You can see Javier's work on
>> this in <https://patchwork.kernel.org/patch/5106351/> and I think
>> you'll need an rk808-specific patch just like he needs an max77802
>> patch.  You probably want to wait for him to spin it first, though,
>> since Mark had feedback on his last patch.
>>
>
> I'm working on adding support to configure the regulator mode on startup
> and when the system enters in a suspend state.
>
> As Doug said I've to re-spin since Mark wanted things to be more integrated
> with the core. So I'm doing some refactoring to pass the static regulator
> descriptor to the function extracting the regulator initial data so drivers
> should only define a function handler that does the modes translation.
> I believe this is the more sensible place to add the mapping function since
> the modes translation should be a non-varying property of the regulator.
>
> Having said that, I see a different use case here. You want to set a voltage
> on system suspend. But the value is the same that is set to your fixed
> regulator so I wonder if what you want here is to enable the regulator on
> suspend instead?
>
> In other words, do you want the core to call rk808_set_suspend_voltage() or
> rk808_set_suspend_enable()? If the later then you can use Chanwoo's bindings:
>
> regulator-state-mem {
>    regulator-on-in-suspend;
> };

The rk808 has a separate register for storing the sleep voltage,
though.  ...so just using "regulator-on-in-suspend" without any
changes to the rk808 driver won't get us this "for free".  I'd expect
to need

 regulator-state-mem {
    regulator-on-in-suspend;
    regulator-suspend-microvolts = <3300000>;
 };

IMHO it wouldn't be insane to say that if someone has
"regulator-on-in-suspend" but no suspend voltage defined that it
should carry forward the runtime voltage.  I actually argued for that
earlier and Mark Brown said "no" at
<http://marc.info/?l=linux-kernel&m=141277262106368&w=2>.  More at
<http://marc.info/?l=linux-kernel&m=141279245027919&w=2>.  It's
entirely possible I wasn't making myself clear, though.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
