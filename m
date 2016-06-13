From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v16 6/6] ARM: socfpga: fpga bridge driver support
Date: Mon, 13 Jun 2016 14:35:01 -0500
Message-ID: <alpine.DEB.2.02.1606131356270.19713@linuxheads99>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>  <1454707803-27947-7-git-send-email-atull@opensource.altera.com> <1465525089.15779.203.camel@rtred1test09.kymeta.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465525089.15779.203.camel@rtred1test09.kymeta.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@kymetacorp.com>
Cc: Rob Herring <robh+dt@kernel.org>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "delicious.quinoa@gmail.com" <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, Matthew Gerlach <mgerlach@altera.com>
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jun 2016, Trent Piepho wrote:

> On Fri, 2016-02-05 at 15:30 -0600, atull@opensource.altera.com wrote:
> > Supports Altera SOCFPGA bridges:
> >  * fpga2sdram
> >  * fpga2hps
> >  * hps2fpga
> >  * lwhps2fpga
> > 
> > Allows enabling/disabling the bridges through the FPGA
> > Bridge Framework API functions.
> 
> I'm replying to v16 because it exists on gmane, while v17 appears not
> to.  lkml.org's forward feature appears to be broken so I can't reply to
> that message (no way to get message-id).  But v17 of this patch should
> be the same.  If a v18 was posted, I've not been able to find it.

Hi Trent,

Yes, we're up to v17. V18 will be soon, but v16 is good enough for
the purposes of this review.

> > +
> > +#define ALT_L3_REMAP_OFST			0x0
> > +#define ALT_L3_REMAP_MPUZERO_MSK		0x00000001
> > +#define ALT_L3_REMAP_H2F_MSK			0x00000008
> > +#define ALT_L3_REMAP_LWH2F_MSK			0x00000010
> > +
> > +#define HPS2FPGA_BRIDGE_NAME			"hps2fpga"
> > +#define LWHPS2FPGA_BRIDGE_NAME			"lwhps2fpga"
> > +#define FPGA2HPS_BRIDGE_NAME			"fpga2hps"
> > +
> > +struct altera_hps2fpga_data {
> > +	const char *name;
> > +	struct reset_control *bridge_reset;
> > +	struct regmap *l3reg;
> > +	/* The L3 REMAP register is write only, so keep a cached value. */
> > +	unsigned int l3_remap_value;
> > +	unsigned int remap_mask;
> > +	struct clk *clk;
> > +};
> > +
> > +static int alt_hps2fpga_enable_show(struct fpga_bridge *bridge)
> > +{
> > +	struct altera_hps2fpga_data *priv = bridge->priv;
> > +
> > +	return reset_control_status(priv->bridge_reset);
> > +}
> > +
> > +static int _alt_hps2fpga_enable_set(struct altera_hps2fpga_data *priv,
> > +				    bool enable)
> > +{
> > +	int ret;
> > +
> > +	/* bring bridge out of reset */
> > +	if (enable)
> > +		ret = reset_control_deassert(priv->bridge_reset);
> > +	else
> > +		ret = reset_control_assert(priv->bridge_reset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Allow bridge to be visible to L3 masters or not */
> > +	if (priv->remap_mask) {
> > +		priv->l3_remap_value |= ALT_L3_REMAP_MPUZERO_MSK;
> 
> Doesn't seem like this belongs here.  I realize the write-only register
> is a problem.  Maybe the syscon driver should be initializing this
> value?
> 
> > +
> > +		if (enable)
> > +			priv->l3_remap_value |= priv->remap_mask;
> > +		else
> > +			priv->l3_remap_value &= ~priv->remap_mask;
> > +
> > +		ret = regmap_write(priv->l3reg, ALT_L3_REMAP_OFST,
> > +				   priv->l3_remap_value);
> 
> This isn't going work if more than one bridge is used.  Each bridge has
> its own priv and thus priv->l3_remap_value.  Each bridge's priv will
> have just the bit for it's own remap set.  The 2nd bridge to be enabled
> will turn off the 1st bridge when it re-write the l3 register.
> 
> If all the bridges shared a static global to cache the reg, then this
> problem would be a replaced by a race, since nothing would be managing
> concurrent access to that global from the independent bridge devices.
> 
> How about using the already existing regmap cache ability take care of
> this?  Use regmap_update_bits() to update just the desired bit and let
> remap take care of keeping track caching the register and protecting
> access from multiple users.  It should support that and it should
> support write-only registers, with the creator of the regmap (the syscon
> driver in this case) supplying the initial value of the write-only reg.
> Which is where ALT_L3_REMAP_MPUZERO_MSK could go in.

Please correct me if I'm wrong, but I think that regmap supports
the features you are talking about, but not syscon.

One simple solution would be to take l3_remap_value out of the priv
and let it be shared by all h2f bridges.  That involves the least
amount of change.

> 
> 
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int alt_hps2fpga_enable_set(struct fpga_bridge *bridge, bool enable)
> > +{
> > +	return _alt_hps2fpga_enable_set(bridge->priv, enable);
> > +}
> > +
> > +static const struct fpga_bridge_ops altera_hps2fpga_br_ops = {
> > +	.enable_set = alt_hps2fpga_enable_set,
> > +	.enable_show = alt_hps2fpga_enable_show,
> > +};
> > +
> > +static struct altera_hps2fpga_data hps2fpga_data  = {
> > +	.name = HPS2FPGA_BRIDGE_NAME,
> > +	.remap_mask = ALT_L3_REMAP_H2F_MSK,
> > +};
> 
> Each of these data structs also includes space for all the private data
> field of the drivers' state.  Seems a bit inefficient if only two of
> them are configuration data.  It also means only one device of each type
> can exists.  If one creates two bridges of the same type they'll
> (silently) share a priv data struct and randomly break.  And the config
> data structs can't be const.

Our hardware doesn't contain two devices of any of these three types.

> 
> What if these structs were a different altera_hps_config struct, which
> the private data struct could then copy or point to?
> 
> struct altera_hpsbridge_config {
> 	const char *name;
> 	uint32_t remap_mask;
> };
> 
> struct altera_hpsbridge_data {
> 	const struct altera_hpsbridge_config *config;
> 	...;
> 	struct clk *clk;
> };

Yes, that sounds good and sensible.  I'll do that in v18.

> 
> 
> > +
> > +static struct altera_hps2fpga_data lwhps2fpga_data  = {
> > +	.name = LWHPS2FPGA_BRIDGE_NAME,
> > +	.remap_mask = ALT_L3_REMAP_LWH2F_MSK,
> > +};
> > +
> > +static struct altera_hps2fpga_data fpga2hps_data  = {
> > +	.name = FPGA2HPS_BRIDGE_NAME,
> > +};
> > +
> > +static const struct of_device_id altera_fpga_of_match[] = {
> > +	{ .compatible = "altr,socfpga-hps2fpga-bridge",
> > +	  .data = &hps2fpga_data },
> > +	{ .compatible = "altr,socfpga-lwhps2fpga-bridge",
> > +	  .data = &lwhps2fpga_data },
> > +	{ .compatible = "altr,socfpga-fpga2hps-bridge",
> > +	  .data = &fpga2hps_data },
> > +	{},
> > +};
> > +
> > +static int alt_fpga_bridge_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct altera_hps2fpga_data *priv;
> > +	const struct of_device_id *of_id;
> > +	u32 enable;
> > +	int ret;
> > +
> > +	of_id = of_match_device(altera_fpga_of_match, dev);
> > +	priv = (struct altera_hps2fpga_data *)of_id->data;
> > +
> > +	priv->bridge_reset = devm_reset_control_get(dev, priv->name);
> > +	if (IS_ERR(priv->bridge_reset)) {
> > +		dev_err(dev, "Could not get %s reset control\n", priv->name);
> > +		return PTR_ERR(priv->bridge_reset);
> > +	}
> > +
> 
> 
> > +	priv->l3reg = syscon_regmap_lookup_by_compatible("altr,l3regs");
> > +	if (IS_ERR(priv->l3reg)) {
> > +		dev_err(dev, "regmap for altr,l3regs lookup failed\n");
> > +		return PTR_ERR(priv->l3reg);
> > +	}
> 
> Perhaps this could be wrapped in if(priv->remap_mask) { }.  The fpga2hps
> bridge has no bits in the l3 remap register, so why should it need a
> phandle to the l3 syscon?  This also prevents this driver from working
> on Arria10, since it has no l3remap register at all, for any of the
> bridges, so there's nothing for the phandle to point to.

Agreed.

> 
> > +
> > +	priv->clk = of_clk_get(dev->of_node, 0);
> > +	if (IS_ERR(priv->clk)) {
> > +		dev_err(dev, "no clock specified\n");
> > +		return PTR_ERR(priv->clk);
> > +	}
> 
> devm_clk_get(dev, NULL); should get the 1st clock in the OF node, but
> use the dev resource manager, so it doesn't need to be put.

Yes

> 
> > +
> > +	ret = clk_prepare_enable(priv->clk);
> > +	if (ret) {
> > +		dev_err(dev, "could not enable clock\n");
> > +		return -EBUSY;
> 
> clk_put() on clk missing here and also the other error returns.

I'll use devm_clk_get() so that won't be needed.

> 
> > +	}
> > +
> > +	ret = fpga_bridge_register(dev, priv->name, &altera_hps2fpga_br_ops,
> > +				   priv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!of_property_read_u32(dev->of_node, "bridge-enable", &enable)) {
> > +		if (enable > 1) {
> > +			dev_warn(dev, "invalid bridge-enable %u > 1\n", enable);
> > +		} else {
> > +			dev_info(dev, "%s bridge\n",
> > +				 (enable ? "enabling" : "disabling"));
> > +
> > +			ret = _alt_hps2fpga_enable_set(priv, enable);
> 
> Should this go through the bridge api, e.g. fpga_bridge_enable()?  Since
> the bridge has already been registered.  Or is the bridge framework
> supposed to be able to support bridges that might be enabled or disabled
> behind its back?  If so, then isn't there a race here with
> _alt_hps2fpga_enable_set() possible being called at the same time as
> other operations on this bridge triggered by the code in fpga-bridge.c?
> 
> Alternatively, could the bridge be enabled or disabled before being
> registered?

I'll do the enabling/disabling before registering the driver.

Thanks for your code review!

Alan
