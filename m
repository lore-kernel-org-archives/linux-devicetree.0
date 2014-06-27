From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V7 1/6] power: reset: Add generic SYSCON register mapped reset
Date: Fri, 27 Jun 2014 09:23:32 +0200
Message-ID: <12435553.7pqAlNHzh1@wuerfel>
References: <1403737406-6474-1-git-send-email-fkan@apm.com> <CAGb2v65mGXDGb8Y045kehKufpMZWnfBm4dBJarJeOa8j-3g0RQ@mail.gmail.com> <CAL85gmCOzaT+dJf9e8Uj-w3v1nq8Qjg-EXfWDN5kdrU2k=kHJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL85gmCOzaT+dJf9e8Uj-w3v1nq8Qjg-EXfWDN5kdrU2k=kHJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dbaryshkov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, dwmw2 <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 26 June 2014 09:51:14 Feng Kan wrote:
> >> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> >> index bdcf517..7035236 100644
> >> --- a/drivers/power/reset/Kconfig
> >> +++ b/drivers/power/reset/Kconfig
> >> @@ -80,3 +80,9 @@ config POWER_RESET_KEYSTONE
> >>         help
> >>           Reboot support for the KEYSTONE SoCs.
> >>
> >> +config POWER_RESET_SYSCON
> >> +       bool "Generic SYSCON regmap reset driver"
> >> +       depends on ARCH_XGENE
> >
> > If this is supposed to be generic, why are you depending on
> > a certain platform?
> 
> Yes, the problem was that it was breaking the x86 build.

You probably need to list the exact dependencies then, at least make
it depend on MFD_SYSCON and OF. We generally want all drivers to
build without warnings on all architectures. You can limit it to
(ARM || ARM64 || COMPILE_TEST) if you don't want it to show up on
x86 by default, but it should still be possible to build it when
COMPILE_TEST is set.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
