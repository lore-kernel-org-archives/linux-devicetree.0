From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from devicetree
 in cpuinfo
Date: Mon, 27 Apr 2015 10:20:17 -0500
Message-ID: <CAL_Jsq+x5vXTmzxFW8+YSKntRgNVr7AzAS+xAkuBGx1Nmfeaaw@mail.gmail.com>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
 <1429351135-11842-2-git-send-email-contact@paulk.fr> <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog@mail.gmail.com>
 <1430145747.3081.5.camel@collins>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430145747.3081.5.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 27, 2015 at 9:42 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> w=
rote:
> Le lundi 27 avril 2015 =C3=A0 08:48 -0500, Rob Herring a =C3=A9crit :
>> On Sat, Apr 18, 2015 at 4:58 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org=
> wrote:
>> > This grabs the serial number shown in cpuinfo from the serial-numb=
er devicetree
>> > property in priority. When booting with ATAGs (and without device-=
tree), the
>> > provided number is still shown instead.
>> >
>> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>>
>> One comment below, otherwise:
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> > ---
>> >  arch/arm/include/asm/system_info.h |  1 +
>> >  arch/arm/kernel/setup.c            | 27 +++++++++++++++++++++++++=
--
>> >  2 files changed, 26 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/arm/include/asm/system_info.h b/arch/arm/include=
/asm/system_info.h
>> > index 720ea03..3860cbd40 100644
>> > --- a/arch/arm/include/asm/system_info.h
>> > +++ b/arch/arm/include/asm/system_info.h
>> > @@ -17,6 +17,7 @@
>> >
>> >  /* information about the system we're running on */
>> >  extern unsigned int system_rev;
>> > +extern const char *system_serial;
>> >  extern unsigned int system_serial_low;
>> >  extern unsigned int system_serial_high;
>> >  extern unsigned int mem_fclk_21285;
>> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
>> > index 1d60beb..349790f 100644
>> > --- a/arch/arm/kernel/setup.c
>> > +++ b/arch/arm/kernel/setup.c
>> > @@ -93,6 +93,9 @@ unsigned int __atags_pointer __initdata;
>> >  unsigned int system_rev;
>> >  EXPORT_SYMBOL(system_rev);
>> >
>> > +const char *system_serial;
>> > +EXPORT_SYMBOL(system_serial);
>> > +
>> >  unsigned int system_serial_low;
>> >  EXPORT_SYMBOL(system_serial_low);
>> >
>> > @@ -821,8 +824,29 @@ arch_initcall(customize_machine);
>> >
>> >  static int __init init_machine_late(void)
>> >  {
>> > +#ifdef CONFIG_OF
>> > +       struct device_node *root;
>> > +       int ret;
>> > +#endif
>> > +
>> >         if (machine_desc->init_late)
>> >                 machine_desc->init_late();
>> > +
>> > +#ifdef CONFIG_OF
>>
>> These ifdefs should not be necessary, but please double check.
>
> Well, of_property_read_string is only defined when CONFIG_OF is set
> (base.c is always built in drivers/of but the directory is only inclu=
ded
> when CONFIG_OF is set).

Look at include/linux/of.h. There are an empty versions of both functio=
ns.

> Of course, on ARM, we now expect that it is the case, but it seems li=
ke
> good practice to check for it, since it could theoretically be disabl=
ed.

We still (and will continue to) have non-OF platforms.

> This is also being done a few lines above in customize_machine.

True, but that doesn't mean we want more.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
