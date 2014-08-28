From: Gyungoh Yoo <gyungoh@gmail.com>
Subject: Re: [PATCH 1/3] Adding Skyworks SKY81452 MFD driver
Date: Thu, 28 Aug 2014 10:29:26 +0900
Message-ID: <20140828012926.GA2650@jack-ThinkPad-T520>
References: <1407488899-31065-1-git-send-email-jack.yoo@skyworksinc.com>
 <20140821094502.GV4266@lee--X1>
 <20140825070608.GA6230@jack-ThinkPad-T520>
 <20140826082258.GC9574@lee--X1>
 <20140827040629.GA3401@jack-ThinkPad-T520>
 <20140827083921.GB26707@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140827083921.GB26707@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, sameo@linux.intel.com, jack.yoo@skyworksinc.com, jason@lakedaemon.net, heiko.stuebner@bqreaders.com, florian.vaussard@epfl.ch, thierry.reding@gmail.com, andrew@lunn.ch, silvio.fricke@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 09:39:21AM +0100, Lee Jones wrote:
> On Wed, 27 Aug 2014, Gyungoh Yoo wrote:
> > On Tue, Aug 26, 2014 at 09:22:58AM +0100, Lee Jones wrote:
> > > On Mon, 25 Aug 2014, Gyungoh Yoo wrote:
> > > > On Thu, Aug 21, 2014 at 10:45:02AM +0100, Lee Jones wrote:
> > > > > When you send patch-sets, you should send them connected to o=
ne
> > > > > another AKA threaded.  That way, when we're reviewing we can =
look at
> > > > > the other patches in the set for reference.  See the man page=
 for `git
> > > > > send-email` for details.
> > > > >=20
> > > > > <commit log>
> > > > >=20
> > > > > > Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> > > > > > ---
> > >=20
> > > [...]
> > >=20
> > > > > > +static int sky81452_register_devices(struct device *dev,
> > > > > > +		const struct sky81452_platform_data *pdata)
> > > > > > +{
> > > > > > +	struct mfd_cell cells[] =3D {
> > > > > > +		{
> > > > > > +			.name =3D "sky81452-bl",
> > > > > > +			.platform_data =3D pdata->bl_pdata,
> > > > > > +			.pdata_size =3D sizeof(*pdata->bl_pdata),
> > > > >=20
> > > > > Have you tested this with DT?
> > > > >=20
> > > > > You're not passing the compatible string and not using
> > > > > of_platform_populate() so I'm struggling to see how it would =
work
> > > > > properly.
> > > >=20
> > > > sky81452-bl and regulator-sky81452 is parsing the information
> > > > in regulator node of its parent node. So I thought these 2 driv=
ers
> > > > don't need compatible attribute. That is what it didn't have
> > > > compatible string.
> > > > Is is mandatory that all drivers should have compatible attribu=
te?
> > >=20
> > > How do they obtain their DT nodes?
> >=20
> > The backlight driver which is one of the child driver is obtain its=
 DT node like this
> >=20
> > np =3D of_get_child_by_name(dev->parent->of_node, "backlight");
>=20
> The MFD core provides infrastructure so you don't have to do this.
>=20
> Just place the compatible string in 'struct mfd_cell cells[]' and the
> core will match and populate dev->of_node for you.

I see. Thank you.

>=20
> > > [...]
> > >=20
> > > > > > +	return mfd_add_devices(dev, -1, cells, ARRAY_SIZE(cells),
> > > > > > +			NULL, 0, NULL);
> > > > >=20
> > > > > This doesn't really need to be in a function of its own.  Ple=
ase put
> > > > > it in .probe().  Also check for the return value and present =
the user
> > > > > with an error message if it fails.
> > > >=20
> > > > I think this need to be, in case of !CONFIG_OF.
> > > > Can you please explain more in details?
> > >=20
> > > Then how to you obtain the shared register map you created?
> >=20
> > regmap is stored in driver data in MFD.
> >=20
> > i2c_set_clientdata(client, regmap);
> >=20
> > The child drivers obain the regmap from the parent.
> >=20
> > struct regmap *regmap =3D dev_get_drvdata(dev->parent);
>=20
> Ah yes, of course you do.  Silly of me to miss this.
>=20
> I also just noticed that you're also manually populating the
> chlidren's platform data.  It's easier if you do this from the child
> device drivers:
>=20
>   const struct sky81452_platform_data ppdata =3D dev_get_platdata(dev=
->parent);
>   const struct sky81452_bl_platform_data =3D pdata =3D ppdata->bl_pda=
ta;

I think it could be a good way for this. Thank you.

>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
