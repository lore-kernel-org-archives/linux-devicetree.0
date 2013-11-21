From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/5] mfd: max14577: Add max14577 MFD driver core
Date: Thu, 21 Nov 2013 12:20:11 +0000
Message-ID: <20131121122011.GD23067@lee--X1>
References: <1384956732-19526-1-git-send-email-k.kozlowski@samsung.com>
 <1384956732-19526-2-git-send-email-k.kozlowski@samsung.com>
 <20131121103408.GA22536@lee--X1>
 <1385034199.748.21.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385034199.748.21.camel@AMDC1943>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

> Thanks for pointing these out however after using regmap_irq_chip who=
le
> file won't be needed anymore.

That's fine.

> > > +static int max14577_i2c_probe(struct i2c_client *i2c,
> > > +			      const struct i2c_device_id *id)
> > > +{
> > > +	struct max14577 *max14577;
> > > +	struct max14577_platform_data *pdata =3D dev_get_platdata(&i2c-=
>dev);
> > > +	u8 reg_data;
> > > +	int ret =3D 0;
> > > +
> > > +	if (i2c->dev.of_node) {
> >=20
> > Can you pull this out. It looks neater as the top as:
> >   struct device_node *np =3D i2c->dev.of_node;
>=20
> I am not sure if I understand you correctly. You would like to change
> this to:
> -------------------------
> static int max14577_i2c_probe(struct i2c_client *i2c,
>                               const struct i2c_device_id *id)
> {
>         struct max14577 *max14577;
>         struct max14577_platform_data *pdata =3D
> dev_get_platdata(&i2c->dev);
>         struct device_node *np =3D i2c->dev.of_node;
>         u8 reg_data;
>         int ret =3D 0;
>=20
>         if (np) {
>                 pdata =3D devm_kzalloc(&i2c->dev,
>                                 sizeof(struct max14577_platform_data)=
,
>                                 GFP_KERNEL);
> -------------------------
> The variable 'np' would be used only once.

I know, but it's more in keeping with the rest of the subsystem.

> > > +
> > > +	ret =3D mfd_add_devices(max14577->dev, -1, max14577_devs,
> > > +			ARRAY_SIZE(max14577_devs), NULL, 0, NULL);
> >=20
> > You should be passing the irqdomain as the final parameter here.
>=20
> I replaced the IRQ handling with regmap_irq_chip so this would look l=
ike
> this:
> -------------------------
>         ret =3D mfd_add_devices(max14577->dev, -1, max14577_devs,
>                         ARRAY_SIZE(max14577_devs), NULL, 0,
>                         regmap_irq_get_domain(max14577->irq_data));
> -------------------------
> Am I correct?

if regmap_irq_get_domain() returns an irqdomain, then yes.

> > > +	return i2c_add_driver(&max14577_i2c_driver);
> > > +}
> > > +subsys_initcall(max14577_i2c_init);
> > > +
> > > +static void __exit max14577_i2c_exit(void)
> > > +{
> > > +	i2c_del_driver(&max14577_i2c_driver);
> > > +}
> > > +module_exit(max14577_i2c_exit);
> >=20
> > >>>>>>>>>>>>>>>>>>>>>>
> >=20
> > Remove all this and replace with:
> >   module_i2c_driver(max14577_i2c_driver);
>=20
> The subsys_initcall is needed. Marek Szyprowski replied to this here:
> http://thread.gmane.org/gmane.linux.drivers.devicetree/51903/focus=3D=
1594651

Okay, but this will need to be changed when USB Gadget starts to
support -EPROBE_DEFER

> > > +struct max14577_regulator_platform_data {
> > > +	int id;
> > > +	struct regulator_init_data *initdata;
> > > +	struct device_node *of_node;
> >=20
> > Do you ever set this? What's the point of it is it's set in the dev=
ice?
>=20
> Do you mean the whole struct max14577_regulator_platform_data or only
> some member of it (of_node?)?

Initially only the of_node. Usually MFD children are able to call back
into their parent to fetch these details. Also mfd_add_device() goes
out of its way to fill in the child's own of_node.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
