From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 01/11] MAINTAINERS: Add entry for X-Powers
 AXP family PMIC drivers
Date: Wed, 3 Feb 2016 12:30:36 +1100
Message-ID: <CAGRGNgXf-dvWWmyRMjgbVdnprg+fzDhbMeX7-6nZ-+LQ1J+ghA@mail.gmail.com>
References: <1454408864-24112-1-git-send-email-wens@csie.org>
 <1454408864-24112-2-git-send-email-wens@csie.org> <CAGRGNgVxan9RCsLFW9hHWcdW+Rd_SgVG95H-yQg213g-YeE6Ug@mail.gmail.com>
 <1454462910.7291.53.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454462910.7291.53.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Todd Brandt <todd.e.brandt-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joe,

On Wed, Feb 3, 2016 at 12:28 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Wed, 2016-02-03 at 11:19 +1100, Julian Calaby wrote:
>> On Tue, Feb 2, 2016 at 9:27 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>> > Add an entry for X-Powers AXP family PMIC drivers and list myself
>> > as maintainer.
> []
>> > diff --git a/MAINTAINERS b/MAINTAINERS
> []
>> > @@ -11941,6 +11941,12 @@ F:     include/linux/workqueue.h
>> >  F:     kernel/workqueue.c
>> >  F:     Documentation/workqueue.txt
>> >
>> > +X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS
>> > +M:     Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> > +L:     linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> > +S:     Maintained
>> > +N:     axp[128]
>>
>> Should you list the files maintained and this list also?
>
> This "N:" pattern is kind of a wildcard.
>
> The difference between F: and N: is that git history
> is also used by default for files that match.
>
> There are no files in -next today that match "*axp8*"
> Dunno if this patchset added any.
>
> This matches:
>
>     $ git ls-files | grep "axp[128]"
>     Documentation/devicetree/bindings/mfd/axp20x.txt
>     Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt
>     arch/arm/boot/dts/axp152.dtsi
>     arch/arm/boot/dts/axp209.dtsi
>     arch/arm/boot/dts/axp22x.dtsi
>     drivers/extcon/extcon-axp288.c
>     drivers/iio/adc/axp288_adc.c
>     drivers/input/misc/axp20x-pek.c
>     drivers/mfd/axp20x.c
>     drivers/power/axp20x_usb_power.c
>     drivers/power/axp288_charger.c
>     drivers/power/axp288_fuel_gauge.c
>     drivers/regulator/axp20x-regulator.c
>     include/linux/mfd/axp20x.h
>
> Are all these files appropriate?
>

I didn't know about the "N:" tag, and consequently I retract my comment.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
