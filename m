From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] IO voltage domain support for rk3188 and rk3288
Date: Thu, 4 Sep 2014 18:51:47 +0200
Message-ID: <CACRpkda-XS0XLSkAZ-16=JvD8FbRJNuN4UVL4dMyV71bfU5T2A@mail.gmail.com>
References: <1409254565-10677-1-git-send-email-dianders@chromium.org>
	<53FF9E93.3040601@ti.com>
	<CAD=FV=Vcj+tAno92c38Prviyi-v2CmuGSzak1ppETL033KAF4w@mail.gmail.com>
	<1450179.xJuMFg9Vvn@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450179.xJuMFg9Vvn@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry
List-Id: devicetree@vger.kernel.org

On Sat, Aug 30, 2014 at 1:27 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Am Freitag, 29. August 2014, 21:51:46 schrieb Doug Anderson:
>> On Thu, Aug 28, 2014 at 2:26 PM, Santosh Shilimkar
>>
>> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>> > On Thursday 28 August 2014 03:36 PM, Doug Anderson wrote:
>> >> These two patches add support for automatically configuring the I=
O
>> >> voltage domains on rk3188 and rk3288 SoCs.  The first patch adds =
some
>> >> new notification types to the regulator code.  It's used by the s=
econd
>> >> patch which actually implements the IO voltage domain driver.
>> >>
>> >> These two patches were co-developed by Heiko St=C3=BCbner and Dou=
g Anderson
>> >> (proof of concept patches were written by Heiko).  They were test=
ed in
>> >> a private branch on an rk3288 board using rk808 instead of mainli=
ne
>> >> since rk808 support isn't finalized in mainline yet.
>> >>
>> >> (sorry if you got this series twice; my mailer seems unhappy with=
 me)
>> >>
>> >> Heiko St=C3=BCbner (2):
>> >>   regulator: core: Add REGULATOR_EVENT_PRE_VOLTAGE_CHANGE (and AB=
ORT)
>> >>   soc/rockchip: io-domain: add driver handling io domains
>> >
>> > Sorry to shot down but your IO domains are nothing but voltage dom=
ains
>> > and you should really build something in the drivers/power/*
>>
>> If everyone agrees that this belongs in drivers/power that's totally
>> OK.  Neither Heiko nor I was confident that it should be in
>> drivers/soc.  I had even though that the code wouldn't be totally ou=
t
>> of place in the Rockchip pinctrl driver (adding Linus W since I thin=
k
>> some SoCs did add code to handle 3.3V vs. 1.8V in pinctrl).
>
> a bit of context for Linus ...
>
> This is essentially the continuation of  the thread "io-domain voltag=
es as
> regulators?" from the beginning of august. After more discussions we =
found out
> that the io voltage selection I asked about is not an independent sup=
ply, but
> instead has to reflect the voltage of the real supplying regulator.
>
> And setting the io-voltage setting to 1.8V while the regulator is sup=
plying
> 3.3V for example may actually damage the chip.
>
>
> So in our current approach here, we added a driver that tracks voltag=
e changes
> of the supplying regulator via a notifier and sets the register bits
> accordingly.

I feel I'm not smart enough for this. You need the PM people to look
at this stuff, like Rafael Wysocki, Kevin Hilman and Ulf Hansson.

Since it is also MMC/SD UHS-related, Ulf should know better than
most what is needed, plus he's working on generic power domains
right now.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
