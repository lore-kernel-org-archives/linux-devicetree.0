From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] RFC: let gpiod_get_optional et all return NULL when
 GPIOLIB is not enabled
Date: Tue, 28 Apr 2015 08:45:24 +0200
Message-ID: <20150428064524.GV19431@pengutronix.de>
References: <1423731809-4800-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdb6KcZx3WfTqUKemhQ0_OsqxBGQb_P5cXXZvgc3riakdA@mail.gmail.com>
 <20150306085957.GC10717@pengutronix.de>
 <CACRpkdYq70V8SG4XOPBCGWs__J4ehknZSucpO5OdXpMDj8GPKA@mail.gmail.com>
 <CAAVeFu+0bWSAUSaDGTUmPyj9JxEJn4yxF_hzab4CHp8YV1MuoA@mail.gmail.com>
 <20150427152153.GN19431@pengutronix.de>
 <CAAVeFuKMiHhT8o1PCETNTys8EATcVdy7xfy+P+o_2r6BwAXEgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuKMiHhT8o1PCETNTys8EATcVdy7xfy+P+o_2r6BwAXEgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, Apr 28, 2015 at 12:31:37PM +0900, Alexandre Courbot wrote:
> On Tue, Apr 28, 2015 at 12:21 AM, Uwe Kleine-K=F6nig
> <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > On Thu, Apr 09, 2015 at 11:20:55AM +0900, Alexandre Courbot wrote:
> >> Having GPIO disabled means there is no GPIO support, including the
> >> ability to look for GPIOs. -ENOSYS is a well-documented error-code
> >> which meaning also applies to the gpio_*_optional functions (we do=
n't
> >> have support for the operation you requested). If a driver or
> >> architecture really, really needs GPIO support they can require or
> >> depend on CONFIG_GPIOLIB, and the problem goes away. If they can w=
ork
> >> with and without gpiolib, then they should check for -ENOSYS when =
they
> >> request GPIOs and behave accordingly.
> > What whould be the right behaviour in your eyes? I hope it's not
> >
> >         if (ret !=3D -ENOSYS)
> >                 return ret;
> >
> >         /* continue and ignore error */
>=20
> If a consumer absolutely needs a GPIO (most of the drivers out there =
I
> believe), then -ENOSYS can be handled like any other error. If it
> doesn't, and the driver is fine without GPIO support as well (meaning
> that it can somehow work even if a GPIO is declared, but GPIO support
> is not compiled in), then it will need to explicitly handle that
> particular error. That case should be rare though - most drivers will
> want to propagate -ENOSYS.
Ack.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
