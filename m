From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v2] mfd: sm501: Add device property
Date: Fri, 1 Jul 2016 09:59:11 +0100
Message-ID: <20160701085911.GJ1707@dell>
References: <1467219419-22901-1-git-send-email-ysato@users.sourceforge.jp>
 <20160630074800.GE1707@dell>
 <87wpl6d60k.wl-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87wpl6d60k.wl-ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 01 Jul 2016, Yoshinori Sato wrote:

> On Thu, 30 Jun 2016 16:48:00 +0900,
> Lee Jones wrote:
> >=20
> > On Thu, 30 Jun 2016, Yoshinori Sato wrote:
> >=20
> > > Signed-off-by: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/sm501.txt | 45 +++++++++++=
++++++++++++++
> > >  drivers/mfd/sm501.c                             |  9 +++++
> > >  2 files changed, 54 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/sm501.t=
xt

[...]

> > > diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> > > index 65cd0d2..e2e3f9b 100644
> > > --- a/drivers/mfd/sm501.c
> > > +++ b/drivers/mfd/sm501.c

[...]

> > > @@ -1377,6 +1378,8 @@ static int sm501_plat_probe(struct platform=
_device *dev)
> > >  {
> > >  	struct sm501_devdata *sm;
> > >  	int ret;
> > > +	struct sm501_platdata private_platdata;
> > > +	struct sm501_initdata private_initdata;
> > > =20
> > >  	sm =3D kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
> > >  	if (sm =3D=3D NULL) {
> > > @@ -1388,6 +1391,12 @@ static int sm501_plat_probe(struct platfor=
m_device *dev)
> > >  	sm->dev =3D &dev->dev;
> > >  	sm->pdev_id =3D dev->id;
> > >  	sm->platdata =3D dev_get_platdata(&dev->dev);
> > > +	if (!sm->platdata) {
> > > +		of_property_read_u32(dev->dev.of_node, "smi,devices",
> > > +				     (u32 *)&private_initdata.devices);
> > > +		private_platdata.init =3D &private_initdata;
> > > +		sm->platdata =3D &private_platdata;
> > > +	}
> >=20
> > I've asked about this 3 times now.
> >=20
> > What consumes this platform data?
> >=20
> > It also looks ugly and fragile.
>=20
> It's appropriate to use dev.of_node, isn't it?
> If it's misunderstood, I'm sorry.

Yes, that's acceptable.

I'm talking about the whole process of allocating an entire platform
structure (on the stack, which will most likely be wiped when we
return from probe()) just to populate this one, undocumented
property.

Hold up ... I've just taken a look at the driver myself.  What a
mess.  It appears this driver pre-dates the MFD API and does
everything I hate.

=46irst step is to see if the Device Tree guys like your new property.
Please document it in bindings/display/sm501fb.txt, as suggested by
Rob, so they can review it.  Don't forget to CC me too.

We can look at the C code changes later.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
