From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/6] of: add function to check against a list of compatible strings
Date: Tue, 15 Oct 2013 14:44:34 +0200
Message-ID: <201310151444.35011.heiko@sntech.de>
References: <201310151246.49402.heiko@sntech.de> <201310151247.50408.heiko@sntech.de> <20131015111145.GE19196@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131015111145.GE19196-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 15. Oktober 2013, 13:11:46 schrieb Mark Rutland:
> Hi Heiko,
>=20
> On Tue, Oct 15, 2013 at 11:47:50AM +0100, Heiko St=C3=BCbner wrote:
> > The basic of functions already provide a of_device_is_compatible to=
 check
> > if a device's compatible property contains a specific one. But some=
times
> > it's also necessary to check if the device is compatible to one out=
 of a
> > list of compatible devices.
> >=20
> > Therefore add of_device_is_any_of that reuses the compatible check =
of
> > of_device_is_compatible but checks against a list of compatible str=
ings
> > without the locking overhead of calling of_device_is_compatible mul=
tiple
> > times.
>=20
> I don't think we need this -- we already have of_match_node, and you =
can
> use it to achieve the same result.

You are right of course, of_match_node does exactly what needed.


Thanks
Heiko


> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> >=20
> >  drivers/of/base.c  |   21 +++++++++++++++++++++
> >  include/linux/of.h |    2 ++
> >  2 files changed, 23 insertions(+)
> >=20
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 865d3f6..589f43e 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -366,6 +366,27 @@ int of_device_is_compatible(const struct devic=
e_node
> > *device,
> >=20
> >  EXPORT_SYMBOL(of_device_is_compatible);
> > =20
> >  /**
> >=20
> > + * Checks if any of the given "compat" strings matches one of the
> > strings + * in the device's "compatible" property.
> > + */
> > +int of_device_is_any_of(const struct device_node *device,
> > +			const char * const *compat, int num) {
> > +	unsigned long flags;
> > +	int res =3D 0, i;
> > +
> > +	raw_spin_lock_irqsave(&devtree_lock, flags);
> > +	for (i =3D 0; i < num; i++) {
> > +		if (__of_device_is_compatible(device, compat[i])) {
> > +			res =3D 1;
> > +			break;
> > +		}
> > +	}
> > +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> > +	return res;
> > +}
> > +EXPORT_SYMBOL(of_device_is_any_of);
> > +
> > +/**
> >=20
> >   * of_machine_is_compatible - Test root of device tree for a given
> >   compatible value * @compat: compatible string to look for in root
> >   node's compatible property. *
> >=20
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index f95aee3..5bf7c9a 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -262,6 +262,8 @@ extern int of_property_count_strings(struct
> > device_node *np,
> >=20
> >  				     const char *propname);
> > =20
> >  extern int of_device_is_compatible(const struct device_node *devic=
e,
> > =20
> >  				   const char *);
> >=20
> > +extern int of_device_is_any_of(const struct device_node *device,
> > +			       const char * const *compat, int num);
> >=20
> >  extern int of_device_is_available(const struct device_node *device=
);
> >  extern const void *of_get_property(const struct device_node *node,
> > =20
> >  				const char *name,

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
