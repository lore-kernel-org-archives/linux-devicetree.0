From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/8] watchdog: st_wdt: Add new driver for ST's LPC
 Watchdog
Date: Thu, 18 Dec 2014 17:20:12 +0000
Message-ID: <20141218172012.GC4525@x1>
References: <1418834727-1602-1-git-send-email-lee.jones@linaro.org>
 <1418834727-1602-7-git-send-email-lee.jones@linaro.org>
 <20141217180251.GA29914@roeck-us.net>
 <20141218082652.GP13885@x1>
 <20141218160014.GA16015@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141218160014.GA16015-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 18 Dec 2014, Guenter Roeck wrote:

> On Thu, Dec 18, 2014 at 08:26:52AM +0000, Lee Jones wrote:
> > On Wed, 17 Dec 2014, Guenter Roeck wrote:
> > > On Wed, Dec 17, 2014 at 04:45:25PM +0000, Lee Jones wrote:
> > > > Signed-off-by: David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
> > > > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >=20
> > > Hi Lee and David,
> > >=20
> > > I still have a couple of comments below. Sorry I didn't catch tho=
se earlier.
> > >=20
> > > Thanks,
> > > Guenter
> > >=20
> > > > ---
> > > >  drivers/watchdog/Kconfig  |  13 ++
> > > >  drivers/watchdog/Makefile |   1 +
> > > >  drivers/watchdog/st_wdt.c | 323 ++++++++++++++++++++++++++++++=
++++++++++++++++
> > > >  3 files changed, 337 insertions(+)
> > > >  create mode 100644 drivers/watchdog/st_wdt.c
> >=20
> > Chopping all the crud.
> >=20
> > [...]
> >=20
> > > > +static struct of_device_id st_wdog_match[] =3D {
> > > > +	{
> > > > +		.compatible =3D "st,stih407-lpc",
> > > > +		.data =3D (void *)&stih407_syscfg,
> > >=20
> > > Nitpick: typecast to and from void * is not necessary.
> >=20
> > Actually that's not true, but it is superfluous in this case.
> >=20
> Point taken. Would you agree to a more detailed "typecasting a pointe=
r
> to and from void * is not necessary" ?

Sure, why not? ;)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
