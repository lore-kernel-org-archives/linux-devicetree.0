From: Dong Aisheng <b29396@freescale.com>
Subject: Re: [PATCH 1/7] mfd: add imx syscon driver based on regmap
Date: Thu, 23 Aug 2012 15:26:30 +0800
Message-ID: <20120823072629.GG10057@shlinux2.ap.freescale.net>
References: <1345619928-15446-1-git-send-email-b29396@freescale.com>
 <1345619928-15446-2-git-send-email-b29396@freescale.com>
 <20120822160241.GR7995@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120822160241.GR7995@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "lrg@ti.com" <lrg@ti.com>, Zhao Richard-B20223 <B20223@freescale.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "paul.liu@linaro.org" <paul.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2012 at 12:02:41AM +0800, Mark Brown wrote:
> On Wed, Aug 22, 2012 at 03:18:42PM +0800, Dong Aisheng wrote:
> 
> > From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> > Add regmap based imx syscon driver.
> 
> Nice to see more regmap-mmio usage!
> 
> Reviwed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> 
> from a regmap point of view.
> 
Thanks

> > +int imx_syscon_write(struct device_node *np, u32 reg, u32 val)
> > +{
> > +	struct device *dev;
> > +	struct imx_syscon *syscon;
> > +	int ret = 0;
> > +
> > +	dev = driver_find_device(&imx_syscon_driver.driver, NULL, np,
> > +				 imx_syscon_match);
> > +	if (!dev)
> > +		return -EPROBE_DEFER;
> > +
> > +	syscon = dev_get_drvdata(dev);
> > +	ret = regmap_write(syscon->regmap, reg, val);
> 
> It'd be good to provide a way of retrieving the regmap so that drivers
> for subsystems with generic regmap code could use the framework features
> (regulator is one example that I just mentioned in my other mail).

Do you mean something like:
regmap = syscon_regmap_dev_lookup(np, "fsl,anatop");
regmap_write(regmap, reg, val);

Then drivers can use generic regmap framework features rather than depend
on what imx-syscon implemented, is that correct?

Regards
Dong Aisheng
