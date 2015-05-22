From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Linaro-acpi] [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Fri, 22 May 2015 17:24:01 +0200
Message-ID: <10437443.BChumWu5Uk@wuerfel>
References: <=fu.wei@linaro.org> <20150522150145.GA2930@roeck-us.net> <555F48BD.4010605@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555F48BD.4010605-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, corbet-T1hC0tSOHrs@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 22 May 2015 23:18:21 Hanjun Guo wrote:
> On 2015=E5=B9=B405=E6=9C=8822=E6=97=A5 23:01, Guenter Roeck wrote:
> > On Fri, May 22, 2015 at 04:55:04PM +0200, Arnd Bergmann wrote:
> >> On Friday 22 May 2015 22:50:30 Hanjun Guo wrote:
> >>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> >>>> index e5e7c55..25a0df1 100644
> >>>> --- a/drivers/watchdog/Kconfig
> >>>> +++ b/drivers/watchdog/Kconfig
> >>>> @@ -152,6 +152,18 @@ config ARM_SP805_WATCHDOG
> >>>>          ARM Primecell SP805 Watchdog timer. This will reboot yo=
ur system when
> >>>>          the timeout is reached.
> >>>>
> >>>> +config ARM_SBSA_WATCHDOG
> >>>> +     tristate "ARM SBSA Generic Watchdog"
> >>>> +     depends on ARM || ARM64 || COMPILE_TEST
> >>>
> >>> SBSA is for ARMv8-A based (64-bit) servers, no need to depends on=
 ARM,
> >>> and why we depends on COMPILE_TEST?
> >>>
> >>
> >> I think it's a reasonable assumption that someone will sooner or l=
ater
> >> put that hardware into an ARM32 machine, or run a 32-bit kernel on
> >> a chip that has it.
> >>
> >> While SBSA requires this watchdog device, nothing prevents SoC
> >> manufacturers from using the same design in something that is not
> >> a server.
>=20
>  From this point of view, I agree that SBSA watchdog design may used
> in other ARM SoCs in the future, but how about add it back when this
> kind of hardware showing up?

If it builds on ARM32, I'd rather leave the option in, it doesn't hurt.

> > Tricky, though. Since teh driver uses arm specific clock functions,
> > I don't think this can compile on a non-arm machine.
>=20
> Since it depends on ARM64/ARM, we can temporary release from that now=
=20

We have to drop the '|| COMPILE_TEST' though as a result, or fix the
driver to look up the clock in DT and call 'clk_get_rate'.

That will break the ACPI case, but ACPI could use platform_data to
pass the clock rate into the driver, to make it independent of
low-level APIs.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
