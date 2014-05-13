From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: Add of_platform_depopulate() helper
Date: Tue, 13 May 2014 17:08:44 +0100
Message-ID: <1399997324.3657.35.camel@hornet>
References: <1399981836-24837-1-git-send-email-pawel.moll@arm.com>
	 <CAL_JsqLj5Jy1-fvtDYm=CH8J5R-okKyKxP4X-htONuzQWreVRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLj5Jy1-fvtDYm=CH8J5R-okKyKxP4X-htONuzQWreVRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-05-13 at 14:19 +0100, Rob Herring wrote:
> On Tue, May 13, 2014 at 6:50 AM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrot=
e:
> > Drivers can us of_platform_populate() to create
> > platform devices for children of the device
> > main node (this can particularly happen in case
> > of MFD devices). Unfortunately, there was no
> > standard way of removing such sub-devices when
> > the main one is being removed.
> >
> > This patch adds of_platform_depopulate() as
> > a complementary operation for the _populate()
> > one. It removes all platform and amba devices
> > that have been created from the Device Tree,
> > but leaves all other ones untouched (returning
> > -EBUSY in such case).
> >
> > Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  drivers/of/platform.c       | 52 +++++++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/of_platform.h |  5 +++++
> >  2 files changed, 57 insertions(+)
> >
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 2d0c8b7..b5c49c3 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -495,4 +495,56 @@ int of_platform_populate(struct device_node *r=
oot,
> >         return rc;
> >  }
> >  EXPORT_SYMBOL_GPL(of_platform_populate);
> > +
> > +static int of_platform_device_destroy(struct device *dev, void *da=
ta)
> > +{
> > +       int *parents_children_left =3D data;
>=20
> You are not really tracking how many children are left, so this can
> just be a bool.

That's true.

> > +       int my_children_left =3D 0;
> > +
> > +       /* Do not touch devices not populated from the device tree =
*/
> > +       if (!dev->of_node || !of_node_check_flag(dev->of_node, OF_P=
OPULATED)) {
> > +               (*parents_children_left)++;
> > +               return 0;
> > +       }
> > +
> > +       device_for_each_child(dev, &my_children_left,
> > +                       of_platform_device_destroy);
>=20
> Can't you call of_platform_depopulate here?

=2E.. and check its result instead of ? I guess I could. Will have a lo=
ok
how it looks like.

Pawe=C5=82

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
