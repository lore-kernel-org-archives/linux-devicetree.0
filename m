From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2] clk: si570: Add a driver for SI570 oscillators
Date: Thu, 19 Sep 2013 09:01:01 -0700
Message-ID: <6401b71c-8c18-4735-8b40-9692cd788336@VA3EHSMHS037.ehs.local>
References: <1379544219-23579-1-git-send-email-soren.brinkmann@xilinx.com>
 <20130919131712.GB24088@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130919131712.GB24088@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2013 at 06:17:12AM -0700, Guenter Roeck wrote:
> On Wed, Sep 18, 2013 at 03:43:38PM -0700, Soren Brinkmann wrote:
> > Add a driver for SILabs 570, 571, 598, 599 programmable oscillators=
=2E
> > The devices generate low-jitter clock signals and are reprogrammabl=
e via
> > an I2C interface.
> >=20
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
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
> >=20
> >  .../devicetree/bindings/clock/silabs,si570.txt     |  38 ++
> >  drivers/clk/Kconfig                                |  10 +
> >  drivers/clk/Makefile                               |   1 +
> >  drivers/clk/clk-si570.c                            | 517 +++++++++=
++++++++++++
> >  4 files changed, 566 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/silabs,=
si570.txt
> >  create mode 100644 drivers/clk/clk-si570.c
> >=20
[...]
> > diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
> > new file mode 100644
> > index 0000000..c20dfce
> > --- /dev/null
> > +++ b/drivers/clk/clk-si570.c
[...]
> > +static unsigned long si570_recalc_rate(struct clk_hw *hw,
> > +		unsigned long parent_rate)
> > +{
> > +	int err;
> > +	u64 rfreq, rate;
> > +	unsigned int n1, hs_div;
> > +	struct clk_si570 *data =3D to_clk_si570(hw);
> > +
> > +	err =3D si570_get_divs(data, &rfreq, &n1, &hs_div);
> > +	if (err) {
> > +		dev_err(&data->i2c_client->dev, "unable to recalc rate\n");
>=20
> [ Not really helpful that you can not return an error here ]
IIUC, the CCF does not really support error reporting for this function=
=2E I
think a return value of recalc_rate is always interpreted as frequency.
Hence, I decided to take the last point of certainty and return the las=
t
known frequency.

>=20
> > +		return data->frequency;
> > +	}
> > +
> > +	rfreq =3D div_u64(rfreq, hs_div * n1);
> > +	rate =3D (data->fxtal * rfreq) >> 28;
> > +
> > +	return rate;
> > +}
[...]
> > +static int si570_set_rate(struct clk_hw *hw, unsigned long rate,
> > +		unsigned long parent_rate)
> > +{
> > +	struct clk_si570 *data =3D to_clk_si570(hw);
> > +	struct i2c_client *client =3D data->i2c_client;
> > +	int err;
> > +
> > +	if (rate < SI570_MIN_FREQ || rate > data->max_freq) {
> > +		dev_warn(&client->dev,
> > +			"requested frequency %lu Hz is out of range\n", rate);
>=20
> Shouldn't this be dev_err ?
You're probably right. I'll change this.

>=20
> > +		return -EINVAL;
> > +	}
[...]
> > +static int si570_probe(struct i2c_client *client,
> > +		const struct i2c_device_id *id)
> > +{
> > +	struct clk_si570 *data;
> > +	struct clk_init_data init;
> > +	struct clk *clk;
> > +	u32 initial_fout, factory_fout;
> > +	int err;
> > +
> > +	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	init.ops =3D &si570_clk_ops;
> > +	init.flags =3D CLK_IS_ROOT;
> > +	init.num_parents =3D 0;
> > +	data->hw.init =3D &init;
> > +	data->max_freq =3D id->driver_data;
> > +	data->i2c_client =3D client;
> > +
> > +	if (of_property_read_bool(client->dev.of_node,
> > +				"temperature-stability-7ppm"))
> > +		data->div_offset =3D SI570_DIV_OFFSET_7PPM;
> > +
> Just noticed that you dropped platform data support. Doesn't matter m=
uch for me
> right now, but in my previous company we used the chip on an x86 syst=
em which
> does not support devicetree. Would be nice to keep it and derive plat=
form data
> from devicetree data if provided, like other drivers do it.
I'll look into this. The issue I have with that is, I can hardly test i=
t
since we only use this on Zynq which uses DT. So, I'd rather prefer to
not include it unless somebody volunteers to test it.

> The 7ppm option is only relevant for si570/si751 and not supported on
> si598/si599. You should mention that in the bindings document and che=
ck for it.
Right, I'll add a note in the doc. And ignore it for devices this does
not apply.

> Even better would be if it can be auto-detected; in that case you wou=
ld not need
> the property at all. Unfortunately I don't have access to a chip, so =
I have
> no idea if that is possible and can not check it myself either.
I didn't see any way to detect this during runtime. And we don't have
such a device either.

>=20
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
> > +	/*
> > +	 * Read the requested initial fout from either platform data or t=
he
> > +	 * device tree
> > +	 */
>=20
> But you don't do anything with platform data.
copy&paste error. I'll remove it.

>=20
> > +	if (!of_property_read_u32(client->dev.of_node, "clock-frequency",
> > +				&initial_fout)) {
> > +		err =3D clk_set_rate(clk, initial_fout);
> > +		if (err)
> > +			dev_warn(&client->dev,
> > +					"unable to set initial output frequency %u: %d\n",
> > +					initial_fout, err);
>=20
> No bailout ?
>=20
> Also it seems that this generates two error messages, once in the cod=
e which
> experiences the error and once here.
I remove the message here.

>=20
> Maybe it would be better to just bail out and return the error.
> After all, something is seriously wrong and the system won't operate
> as specified.
I do more think of a spurious error (typo in DT prop giving an f out of
range,...)  and a driver actually controlling this clock generator late=
r.
In that case later calls to clk_set_rate() might succeed and everything=
's
fine or the driver can handle the error. In case of using this device a=
s
a fixed clock, bailing out here might make more sense though. I'd prefe=
r
leaving it like this.


	Thanks,
	S=C3=B6ren


