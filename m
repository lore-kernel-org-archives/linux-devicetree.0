From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC] net: stmmac: socfpga: dt binding
Date: Thu, 13 Aug 2015 21:41:05 +0200
Message-ID: <20150813194105.GC9841@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

I'm in the middle of getting the IEEE1588/PTP features of the GMAC up and
running. The problem I have is with the current binding however.

The documentation says:

Example:

gmac0: ethernet@ff700000 {
	compatible = "altr,socfpga-stmmac", "snps,dwmac-3.70a", "snps,dwmac";
	altr,sysmgr-syscon = <&sysmgr 0x60 0>;
	status = "disabled";
	reg = <0xff700000 0x2000>;
	interrupts = <0 115 4>;
	interrupt-names = "macirq";
	mac-address = [00 00 00 00 00 00];/* Filled in by U-Boot */
	clocks = <&emac_0_clk>;
	clock-names = "stmmaceth";
};

The problem is with the "altr,sysmgr-syscon" property. It was invented,
because the Arria10 and the Arria5/CycloneV have different register
offsets and shifts. This information is however not enough to describe all
properties of the hardware, but more of a crutch IMHO.
The shifts are for the PHYSEL bits. Of course now I need some
different shifts AND I need to access an additional register with different
shifts on Arria10 and CycloneV in the sysmgr.

So, the standard way of handling this is with a new compatible for each
type and getting rid of the register offset and shift in the property,
I guess. And test the DT and print a deprecation warning if the property
is still there.

Do you see any other/better way of fixing this?

As a side note: Is it reasonable to use the "clk_ptp_ref" property of the
stmmac to decide if the PTP features should be enabled or not?
As the hardware needs to be configured to use this clock, I think the
presence of this property is a good enough indicator.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
