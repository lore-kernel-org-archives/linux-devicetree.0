From: Robin Gong <b38343@freescale.com>
Subject: Re: [PATCH v2] regulator: pfuze100: add pfuze100 regulator driver
Date: Mon, 15 Jul 2013 14:40:39 +0800
Message-ID: <20130715064037.GA4722@Robin-OptiPlex-780>
References: <1373604855-17714-1-git-send-email-b38343@freescale.com>
 <20130715012233.GA2730@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130715012233.GA2730@S2101-09.ap.freescale.net>
Sender: linux-doc-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, lgirdwood@gmail.com, broonie@kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, rob@landley.net
List-Id: devicetree@vger.kernel.org

Shawn, Thanks for your carefully review and I will correct it and send the patch again. some comments below:
> > +
> > +struct pfuze_regulator {
> > +	struct regulator_desc desc;
> > +	unsigned char stby_reg;
> > +	unsigned char stby_mask;
> > +};
> > +
> > +enum pfuze_id {
> > +	PFUZE_ID_PFUZE100,
> > +	PFUZE_ID_INVALID,
> > +};
> 
> Have a blank line here.
> 
> Is there any other valid ID other than PFUZE_ID_PFUZE100?  If not, we
> may not need this pfuze_id at all.  All the use of it is in
> pfuze_identify() for dev_info output.
> 
Yes, Now there is only one chip PFUZE100 here, but I'm told before there will be a series of pfuze family such as PFUZE101,PFUZE102..etc, so I keep the place for future.
> > +struct pfuze_chip {
> > +	struct pfuze_regulator *regulators_desc;
> > +	int num_regulators;
> > +	struct regmap *regmap;
> > +	struct device *dev;
> > +	enum pfuze_id chip;	/*chip type*/
> 
> /* comment */
> 
> Also I do not see much necessity of this member.  It's only used in
> function pfuze_identify(), from what I can see.
> 
Ditto
> > +	struct regulator_dev *regulators[];
> > +};
> > +
> > +static struct regulator_ops pfuze100_ldo_regulator_ops;
> > +static struct regulator_ops pfuze100_fixed_regulator_ops;
> > +static struct regulator_ops pfuze100_sw_regulator_ops;
> > +static struct regulator_ops pfuze100_swb_regulator_ops;
> > +
> > +static const int pfuze100_swbst[] = {
> > +	5000000, 5050000, 5100000, 5150000,
> > +};
> > +
> > +static const int pfuze100_vsnvs[] = {
> > +	1000000, 1100000, 1200000, 1300000, 1500000, 1800000, 3000000,
> > +};
> > +
> > +static const struct i2c_device_id pfuze_device_id[] = {
> > +	{.name = "pfuze100", .driver_data = PFUZE_ID_PFUZE100},
> 
> You do not use .driver_data in the driver at all, and can just drop it.
> 
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(i2c, pfuze_device_id);
> > +
> > +
> 
> Drop one blank line.
> 
> > +static const struct of_device_id pfuze_dt_ids[] = {
> > +	{ .compatible = "fsl,pfuze100", .data = (void *)PFUZE_ID_PFUZE100},
> 
> You do not use .data in the driver at all, and can just drop it.
>
good catch. .driver_data  of i2c_device_id and .data of of_device_id are two different ways to let driver know which chip used now by DTS or not. I should use them to know which chip used now ,although I can know by reading chipid register. 


