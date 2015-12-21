From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx7d: cl-som-imx7: add basic module support
Date: Mon, 21 Dec 2015 14:36:50 +0800
Message-ID: <20151221063608.GB4703@tiger>
References: <20151208151401.GA20042@rob-hp-laptop>
 <1449756097-2921-1-git-send-email-grinberg@compulab.co.il>
 <20151214024315.GC25756@tiger>
 <56716EA4.2080107@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56716EA4.2080107-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 16, 2015 at 04:01:08PM +0200, Igor Grinberg wrote:
> Hi Shawn,
> 
> On 12/14/15 04:43, Shawn Guo wrote:
> > On Thu, Dec 10, 2015 at 04:01:37PM +0200, Igor Grinberg wrote:
> >> From: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> 
> [...]
> 
> >> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> >> index 34c88b0..30b0ba1 100644
> >> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> >> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> >> @@ -53,6 +53,10 @@ i.MX6 Quad SABRE Automotive Board
> >>  Required root node properties:
> >>      - compatible = "fsl,imx6q-sabreauto", "fsl,imx6q";
> >>  
> >> +i.MX7D CL-SOM-iMX7 Board
> >> +Required root node properties:
> >> +    - compatible = "compulab,cl-som-imx7", "fsl,imx7d";
> >> +
> > 
> > This is not a board produced by FSL, so it should be documented in
> > fsl.txt.
> 
> You mean _should not_ be documented in fsl.txt, right?

Right.  Sorry.

> Ok, I have no problem with that, we've just used the same approach OMAP
> takes - all the OMAP based boards are documented in the same file:
> Documentation/devicetree/bindings/arm/omap/omap.txt

omap.txt is probably fine, as it's not ti.txt.

> 
> Do you think we should document it in:
> Documentation/devicetree/bindings/arm/compulab-boards.txt
> (this file should already exist in arm-soc/next/dt)?

Yeah, if the file already exist, it's the best option.  But, as it
doesn't exist on my tree, I can not apply this change.

> 
> > 
> >>  Generic i.MX boards
> >>  -------------------
> >>  
> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> index 30bbc37..83ed521 100644
> >> --- a/arch/arm/boot/dts/Makefile
> >> +++ b/arch/arm/boot/dts/Makefile
> >> @@ -350,6 +350,7 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
> >>  dtb-$(CONFIG_SOC_IMX6UL) += \
> >>  	imx6ul-14x14-evk.dtb
> >>  dtb-$(CONFIG_SOC_IMX7D) += \
> >> +	imx7d-cl-som-imx7.dtb \
> >>  	imx7d-sdb.dtb
> >>  dtb-$(CONFIG_SOC_LS1021A) += \
> >>  	ls1021a-qds.dtb \
> >> diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> >> new file mode 100644
> >> index 0000000..ba05198
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> >> @@ -0,0 +1,150 @@
> >> +/*
> >> + * Support for CompuLab CL-SOM-iMX7 System-on-Module
> >> + *
> >> + * Copyright (C) 2015 CompuLab Ltd. - http://www.compulab.co.il/
> >> + * Author: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify it
> >> + * under the terms of the GNU General Public License version 2 as published by
> >> + * the Free Software Foundation.
> >> + */
> > 
> > GPL/X11 dual licence is generally suggested for newly added dts files,
> > as it will let non-Linux OS use them.
> 
> I don't remember we've used this one before...
> Can you please point to an example?

The following command will give you a plenty of examples.

$ git grep X11 arch/arm/boot/dts

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
