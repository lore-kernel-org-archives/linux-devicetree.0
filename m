From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v4] clk: si570: Add a driver for SI570 oscillators
Date: Fri, 20 Sep 2013 11:46:24 -0700
Message-ID: <5dc20100-e481-47f8-b9db-9d0fa9475245@VA3EHSMHS026.ehs.local>
References: <1379698757-25232-1-git-send-email-soren.brinkmann@xilinx.com>
 <20130920181529.GA31173@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130920181529.GA31173@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2013 at 11:15:29AM -0700, Guenter Roeck wrote:
> On Fri, Sep 20, 2013 at 10:39:17AM -0700, Soren Brinkmann wrote:
> > Add a driver for SILabs 570, 571, 598, 599 programmable oscillators=
=2E
> > The devices generate low-jitter clock signals and are reprogrammabl=
e via
> > an I2C interface.
> >=20
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> > v4:
> >  - actually check and handle error on clk_set_rate() call
> >=20
> > v3:
> >  - add delay in the path for small frequency changes, which can tak=
e up
> >    to 100us according to the data sheet
> >  - use real range for usleep_range() argument
> >  - use dev_err() over dev_warn() in set_rate()
> >  - add list of applicable devices for 7ppm DT prop
> >  - remove comments regarding platform data
> >  - ignore 7ppm DT prop for incompatible devices
> >  - replace raw numbers with #defines
> >  - convert DT prop 'temperature-stability' from boolean to u32
> >  - make 'temperature-stability' DT prop required (actually not full=
y
> >    true, for 59x it is ignored and the driver does not require its
> >    presence)
> >=20
> > v2:
> >  - document clock-output-names in bindings documentation
> >  - don't use wildcards in compatibility string
> >  - change Kconfig entry to "... 570 and compatible devices"
> >  - change some indentation flaws
> >  - use 10000 as MIN and MAX value in usleep_range
> >  - fail probe() if 'factory-fout' is not provided in DT
> >    - default factory fout #defines removed
> >  - use i2c driver_data instead of OF data
> >    - remove some related structs and data
> >  - rename DT property 'initial-fout' =3D> 'clock-frequency' (like s=
i5351
> >    driver)
> >  - add some more details regarding the 'factory-fout' DT property
> > ---
> >  .../devicetree/bindings/clock/silabs,si570.txt     |  39 ++
> >  drivers/clk/Kconfig                                |  10 +
> >  drivers/clk/Makefile                               |   1 +
> >  drivers/clk/clk-si570.c                            | 536 +++++++++=
++++++++++++
> >  4 files changed, 586 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/silabs,=
si570.txt
> >  create mode 100644 drivers/clk/clk-si570.c
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/silabs,si570.t=
xt b/Documentation/devicetree/bindings/clock/silabs,si570.txt
> > new file mode 100644
> > index 0000000..26aab5c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/silabs,si570.txt
> > @@ -0,0 +1,39 @@
> > +Binding for Silicon Labs 570, 571, 598 and 599 programmable
> > +I2C clock generators.
> > +
> > +Reference
> > +This binding uses the common clock binding[1]. Details about the d=
evices can be
> > +found in the data sheets[2][3].
> > +
> > +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +[2] Si570/571 Data Sheet
> > +    http://www.silabs.com/Support%20Documents/TechnicalDocs/si570.=
pdf
> > +[3] Si598/599 Data Sheet
> > +    http://www.silabs.com/Support%20Documents/TechnicalDocs/si598-=
99.pdf
> > +
> > +Required properties:
> > + - compatible: Shall be one of "silabs,si570", "silabs,si571",
> > +			       "silabs,si598", "silabs,si599"
> > + - reg: I2C device address.
> > + - #clock-cells: From common clock bindings: Shall be 0.
> > + - factory-fout: Factory set default frequency. This frequency is =
part specific.
> > +		 The correct frequency for the part used has to be provided in
> > +		 order to generate the correct output frequencies. For more
> > +		 details, please refer to the data sheet.
> > + - temperature-stability: Temperature stability of the device. Sho=
uld be one of:
> > +			  7, 20, 50 or 100.
> > +
> It might make sense to specify that this is in microseconds.
ppm, but yes giving the unit is a good idea.

>=20
> > +Optional properties:
> > + - clock-output-names: From common clock bindings. Recommended to =
be "si570".
> > + - clock-frequency: Output frequency to generate. This defines the=
 output
> > +		    frequency set during boot. It can be reprogrammed during
> > +		    runtime through the common clock framework.
> > +
> > +Example:
> > +	si570: clock-generator@5d {
> > +		#clock-cells =3D <0>;
> > +		compatible =3D "silabs,si570";
> > +		temperatur-stability =3D <50>;
>=20
> temperature
damn typos.

>=20
> > +		reg =3D <0x5d>;
> > +		factory-fout =3D <156250000>;
> > +	};
[...]
> > diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
> > new file mode 100644
> > index 0000000..13c2091
> > --- /dev/null
> > +++ b/drivers/clk/clk-si570.c
[...]
> > +static int si570_probe(struct i2c_client *client,
> > +		const struct i2c_device_id *id)
> > +{
> > +	struct clk_si570 *data;
> > +	struct clk_init_data init;
> > +	struct clk *clk;
> > +	u32 initial_fout, factory_fout, stability;
> > +	int err;
> > +	enum clk_si570_variant variant =3D id->driver_data;
> > +
> > +	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	init.ops =3D &si570_clk_ops;
> > +	init.flags =3D CLK_IS_ROOT;
> > +	init.num_parents =3D 0;
> > +	data->hw.init =3D &init;
> > +	data->i2c_client =3D client;
> > +
> > +	if (variant =3D=3D si57x) {
> > +		err =3D of_property_read_u32(client->dev.of_node,
> > +				"temperature-stability", &stability);
> > +		if (err) {
> > +			dev_err(&client->dev,
> > +				  "'temperature-stability' property missing\n");
> > +			return err;
> > +		}
> > +		/* adjust register offsets for 7ppm devices */
> > +		if (stability =3D=3D 7)
> > +			data->div_offset =3D SI570_DIV_OFFSET_7PPM;
> > +
> > +		data->max_freq =3D SI570_MAX_FREQ;
> > +	} else {
> > +		data->max_freq =3D SI598_MAX_FREQ;
> > +	}
> > +
> > +	if (of_property_read_string(client->dev.of_node, "clock-output-na=
mes",
> > +			&init.name))
> > +		init.name =3D client->dev.of_node->name;
> > +
> > +	err =3D of_property_read_u32(client->dev.of_node, "factory-fout",
> > +			&factory_fout);
> > +	if (err) {
> > +		dev_err(&client->dev, "'factory-fout' property missing\n");
> > +		return err;
> > +	}
> > +
> > +	data->regmap =3D devm_regmap_init_i2c(client, &si570_regmap_confi=
g);
> > +	if (IS_ERR(data->regmap)) {
> > +		dev_err(&client->dev, "failed to allocate register map\n");
> > +		return PTR_ERR(data->regmap);
> > +	}
> > +
> > +	i2c_set_clientdata(client, data);
> > +	err =3D si570_get_defaults(data, factory_fout);
> > +	if (err)
> > +		return err;
> > +
> > +	clk =3D devm_clk_register(&client->dev, &data->hw);
> > +	if (IS_ERR(clk)) {
> > +		dev_err(&client->dev, "clock registration failed\n");
> > +		return PTR_ERR(clk);
> > +	}
> > +	err =3D of_clk_add_provider(client->dev.of_node, of_clk_src_simpl=
e_get,
> > +			clk);
> > +	if (err) {
> > +		dev_err(&client->dev, "unable to add clk provider\n");
> > +		return err;
> > +	}
> > +
> > +	/* Read the requested initial output frequency from device tree *=
/
> > +	if (!of_property_read_u32(client->dev.of_node, "clock-frequency",
> > +				&initial_fout)) {
> > +		err =3D clk_set_rate(clk, initial_fout);
> > +		if (err) {
> > +			of_clk_del_provider(client->dev.of_node);
> > +			clk_unregister(data->hw.clk);
>=20
> Is that needed ? I would have thought it isn't because you use a devm=
_ function
> to register it.
>=20
> Not that I understand the clk code, but getting clk from the registra=
tion
> function and unregistering hw.clk (without seting it) sems a bit odd.
> Is it well defined that you have to unregister hw.clk ?
I have to double check. I thought the managed interface is only saving
you a call to clk_put() but I may be wrong.

	S=C3=B6ren


