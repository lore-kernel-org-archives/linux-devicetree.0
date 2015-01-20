From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Tue, 20 Jan 2015 22:09:13 +0100
Message-ID: <20150120210913.GA21891@lunn.ch>
References: <1421687701-5667-1-git-send-email-kaloz@openwrt.org>
 <20150119182113.GH32663@lunn.ch>
 <op.xsrcplz12s3iss@ecaz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <op.xsrcplz12s3iss@ecaz>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> >
> >It would be nice to document the jumper and pinout here.
> >
> >>+			serial@12000 {
> >>+				status = "okay";
> >>+			};
> 
> Do you mean serial console pinout?

Yes. Looking at

https://github.com/Chadster766/McWRT/wiki/Linksys-WRT1900AC-Serial-Port

it seems to be jumper JP10. 

1 - GND
2 - RX
4 - TX

What i don't know is, is Rx and Rx from the perspective of the board
or the host?
 
> >>+			nand@d0000 {
> >>+				status = "okay";
> >>+				num-cs = <1>;
> >>+				marvell,nand-keep-config;
> >>+				marvell,nand-enable-arbiter;
> >>+				nand-on-flash-bbt;
> >>+				nand-ecc-strength = <4>;
> >>+				nand-ecc-step-size = <512>;
> >>+
> >>+				partition@0 {
> >>+					label = "u-boot";
> >>+					reg = <0x0000000 0x100000>;  /* 1MB */
> >>+					read-only;
> >>+				};
> >>+
> >>+				partition@100000 {
> >>+					label = "u_env";
> >>+					reg = <0x100000 0x40000>;    /* 256KB */
> >>+				};
> >>+
> >>+				partition@140000 {
> >>+					label = "s_env";
> >>+					reg = <0x140000 0x40000>;    /* 256KB */
> >>+				};
> >
> >So there is a big gap here? 768KB of unused space before the
> >devinfo section?

... 
 
> The gap and the overlapping partitions (pretty much the whole
> layout) are straight from the official firmware. The overlap is used
> to flash a single file which contains the rootfs, too.

We could put a partition in the gap, to make it usable. You could for
example place the DT blob there. I've not actually checked the version
of uboot used actually supports this though.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
