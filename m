From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] clk: si570: Add a driver for SI570 oscillators
Date: Thu, 19 Sep 2013 09:44:38 -0700
Message-ID: <20130919164438.GA7461@roeck-us.net>
References: <1379544219-23579-1-git-send-email-soren.brinkmann@xilinx.com>
 <20130919131712.GB24088@roeck-us.net>
 <6401b71c-8c18-4735-8b40-9692cd788336@VA3EHSMHS037.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6401b71c-8c18-4735-8b40-9692cd788336@VA3EHSMHS037.ehs.local>
Sender: linux-doc-owner@vger.kernel.org
To: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2013 at 09:01:01AM -0700, S=F6ren Brinkmann wrote:
> On Thu, Sep 19, 2013 at 06:17:12AM -0700, Guenter Roeck wrote:
> > On Wed, Sep 18, 2013 at 03:43:38PM -0700, Soren Brinkmann wrote:
> > > Add a driver for SILabs 570, 571, 598, 599 programmable oscillato=
rs.
> > > The devices generate low-jitter clock signals and are reprogramma=
ble via
> > > an I2C interface.
> > >=20

[...]
> > > +static unsigned long si570_recalc_rate(struct clk_hw *hw,
> > > +		unsigned long parent_rate)
> > > +{
> > > +	int err;
> > > +	u64 rfreq, rate;
> > > +	unsigned int n1, hs_div;
> > > +	struct clk_si570 *data =3D to_clk_si570(hw);
> > > +
> > > +	err =3D si570_get_divs(data, &rfreq, &n1, &hs_div);
> > > +	if (err) {
> > > +		dev_err(&data->i2c_client->dev, "unable to recalc rate\n");
> >=20
> > [ Not really helpful that you can not return an error here ]
> IIUC, the CCF does not really support error reporting for this functi=
on. I
> think a return value of recalc_rate is always interpreted as frequenc=
y.
> Hence, I decided to take the last point of certainty and return the l=
ast
> known frequency.
>=20
Yes, I wasn't complaining about you, but about the clock infrastructure=
=2E

[...]

> > > +static int si570_probe(struct i2c_client *client,
> > > +		const struct i2c_device_id *id)
> > > +{
> > > +	struct clk_si570 *data;
> > > +	struct clk_init_data init;
> > > +	struct clk *clk;
> > > +	u32 initial_fout, factory_fout;
> > > +	int err;
> > > +
> > > +	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return -ENOMEM;
> > > +
> > > +	init.ops =3D &si570_clk_ops;
> > > +	init.flags =3D CLK_IS_ROOT;
> > > +	init.num_parents =3D 0;
> > > +	data->hw.init =3D &init;
> > > +	data->max_freq =3D id->driver_data;
> > > +	data->i2c_client =3D client;
> > > +
> > > +	if (of_property_read_bool(client->dev.of_node,
> > > +				"temperature-stability-7ppm"))
> > > +		data->div_offset =3D SI570_DIV_OFFSET_7PPM;
> > > +
> > Just noticed that you dropped platform data support. Doesn't matter=
 much for me
> > right now, but in my previous company we used the chip on an x86 sy=
stem which
> > does not support devicetree. Would be nice to keep it and derive pl=
atform data
> > from devicetree data if provided, like other drivers do it.
> I'll look into this. The issue I have with that is, I can hardly test=
 it
> since we only use this on Zynq which uses DT. So, I'd rather prefer t=
o
> not include it unless somebody volunteers to test it.
>=20
=46air enough. I can not test it myself anymore, and my previous employ=
er
now has a strict non-contributions-to-linux policy, so I guess they won=
't
test it either or at least not publish any test results. Leave it out.

> > The 7ppm option is only relevant for si570/si751 and not supported =
on
> > si598/si599. You should mention that in the bindings document and c=
heck for it.
> Right, I'll add a note in the doc. And ignore it for devices this doe=
s
> not apply.
>=20
I would bail out, but that is your call.

> > Even better would be if it can be auto-detected; in that case you w=
ould not need
> > the property at all. Unfortunately I don't have access to a chip, s=
o I have
> > no idea if that is possible and can not check it myself either.
> I didn't see any way to detect this during runtime. And we don't have
> such a device either.
>=20
Check what the registers return when reading. But yes, you would need a=
ccess to
the various devices to be sure that the detection works. Wonder if SiLa=
bs
provides samples ... this one would be really nice to have, because it =
would
enable us to drop the extra property.

> >=20
> > > +	if (of_property_read_string(client->dev.of_node, "clock-output-=
names",
> > > +			&init.name))
> > > +		init.name =3D client->dev.of_node->name;
> > > +
> > > +	err =3D of_property_read_u32(client->dev.of_node, "factory-fout=
",
> > > +			&factory_fout);
> > > +	if (err) {
> > > +		dev_err(&client->dev, "'factory-fout' property missing\n");
> > > +		return err;
> > > +	}
> > > +
> > > +	data->regmap =3D devm_regmap_init_i2c(client, &si570_regmap_con=
fig);
> > > +	if (IS_ERR(data->regmap)) {
> > > +		dev_err(&client->dev, "failed to allocate register map\n");
> > > +		return PTR_ERR(data->regmap);
> > > +	}
> > > +
> > > +	i2c_set_clientdata(client, data);
> > > +	err =3D si570_get_defaults(data, factory_fout);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	clk =3D devm_clk_register(&client->dev, &data->hw);
> > > +	if (IS_ERR(clk)) {
> > > +		dev_err(&client->dev, "clock registration failed\n");
> > > +		return PTR_ERR(clk);
> > > +	}
> > > +	err =3D of_clk_add_provider(client->dev.of_node, of_clk_src_sim=
ple_get,
> > > +			clk);
> > > +	if (err) {
> > > +		dev_err(&client->dev, "unable to add clk provider\n");
> > > +		return err;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Read the requested initial fout from either platform data or=
 the
> > > +	 * device tree
> > > +	 */
> >=20
> > But you don't do anything with platform data.
> copy&paste error. I'll remove it.
>=20
> >=20
> > > +	if (!of_property_read_u32(client->dev.of_node, "clock-frequency=
",
> > > +				&initial_fout)) {
> > > +		err =3D clk_set_rate(clk, initial_fout);
> > > +		if (err)
> > > +			dev_warn(&client->dev,
> > > +					"unable to set initial output frequency %u: %d\n",
> > > +					initial_fout, err);
> >=20
> > No bailout ?
> >=20
> > Also it seems that this generates two error messages, once in the c=
ode which
> > experiences the error and once here.
> I remove the message here.
>=20
> >=20
> > Maybe it would be better to just bail out and return the error.
> > After all, something is seriously wrong and the system won't operat=
e
> > as specified.
> I do more think of a spurious error (typo in DT prop giving an f out =
of
> range,...)  and a driver actually controlling this clock generator la=
ter.
> In that case later calls to clk_set_rate() might succeed and everythi=
ng's
> fine or the driver can handle the error. In case of using this device=
 as
> a fixed clock, bailing out here might make more sense though. I'd pre=
fer
> leaving it like this.
>=20
A typo in dt data isn't really a spurious error, and it would be easy t=
o fix.
I would suggest to bail out; this ensures that the devicetree data is c=
orrect.

Guenter
