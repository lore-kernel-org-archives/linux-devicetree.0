From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 6/9] watchdog: st_wdt: Add new driver for ST's LPC
 Watchdog
Date: Mon, 2 Mar 2015 07:49:44 +0000
Message-ID: <20150302074944.GD12821@x1>
References: <1424872349-4155-1-git-send-email-lee.jones@linaro.org>
 <1424872349-4155-7-git-send-email-lee.jones@linaro.org>
 <1425137789.24292.44.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425137789.24292.44.camel@x220>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, david.paris-qxv4g6HH51o@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 28 Feb 2015, Paul Bolle wrote:
> On Wed, 2015-02-25 at 13:52 +0000, Lee Jones wrote:
> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > Signed-off-by: David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/watchdog/Kconfig      |  13 ++
> >  drivers/watchdog/Makefile     |   1 +
> >  drivers/watchdog/st_lpc_wdt.c | 333 ++++++++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 347 insertions(+)
> >  create mode 100644 drivers/watchdog/st_lpc_wdt.c
>=20
> A few nits follow.

Thanks Paul, will fix.

[...]

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
