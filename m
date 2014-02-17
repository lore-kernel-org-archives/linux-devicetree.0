From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] bus: imx-weim: support CS GPR configuration
Date: Mon, 17 Feb 2014 17:20:35 +0800
Message-ID: <20140217092030.GA10731@S2101-09.ap.freescale.net>
References: <1392559381-30842-1-git-send-email-shawn.guo@linaro.org>
 <20140217084843.GA23095@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140217084843.GA23095-NqYOdiUDesgPnqCj3zZnUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 17, 2014 at 09:48:43AM +0100, Philippe De Muyter wrote:
> > @@ -19,6 +24,26 @@ Required properties:
> >  
> >  			   <cs-number> 0 <physical address of mapping> <size>
> >  
> > +Optional properties:
> > +
> > + - fsl,weim-cs-gpr:	For "fsl,imx50-weim" and "fsl,imx6q-weim" type of
> > +			devices, it should be the phandle to the system General
> > +			Purpose Register controller that contains WEIM CS GPR
> > +			register, e.g. IOMUXC_GPR1 on i.MX6Q.  IOMUXC_GPR1[11:0]
> > +			should be set up as one of the following 4 possible
> > +			values depending on the CS space configuration.
> > +
> > +			IOMUXC_GPR1[11:0]    CS0    CS1    CS2    CS3
> > +			---------------------------------------------
> > +				05	    128M     0M     0M     0M
> > +				033          64M    64M     0M     0M
> > +				0113         64M    32M    32M     0M
> > +				01111        32M    32M    32M    32M
> > +
> > +			In case that the property is absent, the reset value or
> > +			what bootloader sets up in IOMUXC_GPR1[11:0] will be
> > +			used.
> > +
> >  Timing property for child nodes. It is mandatory, not optional.
> >  
> >   - fsl,weim-cs-timing:	The timing array, contains timing values for the
> 
> Could you also add the following line to the example in the same file :
> 
> 		fsl,weim-cs-gpr = <&gpr>;
> 
> It took me some time to figure it out :)

Okay.  I will wait comments from DT folks on the binding update for a
while, and then send out v5.

> 
> > diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> > index 3ef58c8..35e9529 100644
> > --- a/drivers/bus/imx-weim.c
> > +++ b/drivers/bus/imx-weim.c
> > @@ -11,6 +11,9 @@
> >  #include <linux/clk.h>
> >  #include <linux/io.h>
> >  #include <linux/of_device.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
> > +#include <linux/regmap.h>
> >  
> >  struct imx_weim_devtype {
> >  	unsigned int	cs_count;
> > @@ -56,6 +59,55 @@ static const struct of_device_id weim_id_table[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, weim_id_table);
> >  
> > +static int __init imx_weim_gpr_setup(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +	struct property *prop;
> > +	const __be32 *p;
> > +	struct regmap *gpr;
> > +	u32 gprvals[4] = {
> > +		05,	/* CS0(128M) CS1(0M)  CS2(0M)  CS3(0M) */
> > +		033,	/* CS0(64M)  CS1(64M) CS2(0M)  CS3(0M) */
> > +		0113,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> > +		01111,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> 
> 			   CS0(32M)			CS3(32M)

Sure, thanks.

Shawn

> 
> > +	};
> > +	u32 gprval = 0;
> > +	u32 val;
> > +	int cs = 0;
> > +	int i = 0;
> > +
> > +	gpr = syscon_regmap_lookup_by_phandle(np, "fsl,weim-cs-gpr");
> > +	if (IS_ERR(gpr)) {
> > +		dev_dbg(&pdev->dev, "failed to find weim-cs-gpr\n");
> > +		return 0;
> > +	}
> > +
> > +	of_property_for_each_u32(np, "ranges", prop, p, val) {
> > +		if (i % 4 == 0) {
> > +			cs = val;
> > +		} else if (i % 4 == 3 && val) {
> > +			val = (val / SZ_32M) | 1;
> > +			gprval |= val << cs * 3;
> > +		}
> > +		i++;
> > +	}
> > +
> > +	if (i == 0 || i % 4)
> > +		goto err;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(gprvals); i++) {
> > +		if (gprval == gprvals[i]) {
> > +			/* Found it. Set up IOMUXC_GPR1[11:0] with it. */
> > +			regmap_update_bits(gpr, IOMUXC_GPR1, 0xfff, gprval);
> > +			return 0;
> > +		}
> > +	}
> > +
> > +err:
> > +	dev_err(&pdev->dev, "Invalid 'ranges' configuration\n");
> > +	return -EINVAL;
> > +}
> > +
> >  /* Parse and set the timing for this device. */
> >  static int __init weim_timing_setup(struct device_node *np, void __iomem *base,
> >  				    const struct imx_weim_devtype *devtype)
> > @@ -92,6 +144,9 @@ static int __init weim_parse_dt(struct platform_device *pdev,
> >  	struct device_node *child;
> >  	int ret;
> >  
> > +	if (devtype == &imx50_weim_devtype)
> > +		imx_weim_gpr_setup(pdev);
> > +
> >  	for_each_child_of_node(pdev->dev.of_node, child) {
> >  		if (!child->name)
> >  			continue;
> > -- 
> > 1.7.9.5
> > 
> 
> -- 
> Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
