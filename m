From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] Adding Skyworks SKY81452 MFD driver
Date: Wed, 27 Aug 2014 13:06:29 +0900
Message-ID: <20140827040629.GA3401@jack-ThinkPad-T520>
References: <1407488899-31065-1-git-send-email-jack.yoo@skyworksinc.com>
 <20140821094502.GV4266@lee--X1>
 <20140825070608.GA6230@jack-ThinkPad-T520>
 <20140826082258.GC9574@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140826082258.GC9574@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 26, 2014 at 09:22:58AM +0100, Lee Jones wrote:
> On Mon, 25 Aug 2014, Gyungoh Yoo wrote:
> > On Thu, Aug 21, 2014 at 10:45:02AM +0100, Lee Jones wrote:
> > > When you send patch-sets, you should send them connected to one
> > > another AKA threaded.  That way, when we're reviewing we can look=
 at
> > > the other patches in the set for reference.  See the man page for=
 `git
> > > send-email` for details.
> > >=20
> > > <commit log>
> > >=20
> > > > Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> > > > ---
>=20
> [...]
>=20
> > > > +static int sky81452_register_devices(struct device *dev,
> > > > +		const struct sky81452_platform_data *pdata)
> > > > +{
> > > > +	struct mfd_cell cells[] =3D {
> > > > +		{
> > > > +			.name =3D "sky81452-bl",
> > > > +			.platform_data =3D pdata->bl_pdata,
> > > > +			.pdata_size =3D sizeof(*pdata->bl_pdata),
> > >=20
> > > Have you tested this with DT?
> > >=20
> > > You're not passing the compatible string and not using
> > > of_platform_populate() so I'm struggling to see how it would work
> > > properly.
> >=20
> > sky81452-bl and regulator-sky81452 is parsing the information
> > in regulator node of its parent node. So I thought these 2 drivers
> > don't need compatible attribute. That is what it didn't have
> > compatible string.
> > Is is mandatory that all drivers should have compatible attribute?
>=20
> How do they obtain their DT nodes?

The backlight driver which is one of the child driver is obtain its DT =
node like this

np =3D of_get_child_by_name(dev->parent->of_node, "backlight");

>=20
> [...]
>=20
> > > > +	return mfd_add_devices(dev, -1, cells, ARRAY_SIZE(cells),
> > > > +			NULL, 0, NULL);
> > >=20
> > > This doesn't really need to be in a function of its own.  Please =
put
> > > it in .probe().  Also check for the return value and present the =
user
> > > with an error message if it fails.
> >=20
> > I think this need to be, in case of !CONFIG_OF.
> > Can you please explain more in details?
>=20
> Then how to you obtain the shared register map you created?

regmap is stored in driver data in MFD.

i2c_set_clientdata(client, regmap);

The child drivers obain the regmap from the parent.

struct regmap *regmap =3D dev_get_drvdata(dev->parent);

>=20
> [...]
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
