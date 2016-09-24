From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add bindings doc for ZTE VOU display
 controller
Date: Sat, 24 Sep 2016 22:19:46 +0800
Message-ID: <20160924141945.GD11051@tiger>
References: <1474615449-16893-1-git-send-email-shawn.guo@linaro.org>
 <20160923223043.GA30909@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160923223043.GA30909@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 05:30:43PM -0500, Rob Herring wrote:
> > +display-subsystem {
> > +	compatible = "zte,zx-display-subsystem";
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +	ranges;
> > +
> > +	vou: vou@1440000 {
> > +		compatible = "zte,zx296718-vou";
> > +		reg = <0x1440000 0x10000>;
> > +		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&topcrm VOU_ACLK>, <&topcrm VOU_PPU_WCLK>,
> > +			 <&topcrm VOU_MAIN_WCLK>, <&topcrm VOU_AUX_WCLK>;
> > +		clock-names = "aclk", "ppu_wclk",
> > +			      "main_wclk", "aux_wclk";
> > +	};
> > +
> > +	hdmi: hdmi@144c000 {
> > +		compatible = "zte,zx296718-hdmi";
> > +		reg = <0x144c000 0x4000>;
> 
> You have overlapping regions here. I'd suggest you kill off
> zte,zx-display-subsystem and make zte,zx296718-vou the top-level node 
> with hdmi and others as the child nodes.

I was trying to make device tree simple by defining those discrete
regions in kernel driver.  But honestly, I'm also unhappy about that
virtual top-level node.  Version 2 Will come soon with suggested
bindings.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
