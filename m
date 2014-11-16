From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv1 2/3] arm: mvebu: add .dts file for Synology DS213j
Date: Sun, 16 Nov 2014 03:31:59 +0100
Message-ID: <20141116023159.GF15870@lunn.ch>
References: <cover.1416095841.git.arno@natisbad.org>
 <1eb26f8c1946622910a7e2318c895a7082fea7e5.1416095841.git.arno@natisbad.org>
 <20141116020024.GC15870@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141116020024.GC15870-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +				pmx_uart0: pmx-uart0 {
> > +					marvell,pins = "mpp0", "mpp1";
> > +					marvell,function = "uart0";
> > +				};
> 
> This however does not seem to be in armada-370.dtsi. This is probably
> because there are a few options:
> 
>            MPP_FUNCTION(0x0, "gpio", NULL),
>            MPP_FUNCTION(0x1, "uart0", "rxd")),
>         MPP_MODE(1,
>            MPP_FUNCTION(0x0, "gpo", NULL),
>            MPP_FUNCTION(0x1, "uart0", "txd")),
>         MPP_MODE(2,
>            MPP_FUNCTION(0x0, "gpio", NULL),
>            MPP_FUNCTION(0x1, "i2c0", "sck"),
>            MPP_FUNCTION(0x2, "uart0", "txd")),
>         MPP_MODE(3,
>            MPP_FUNCTION(0x0, "gpio", NULL),
>            MPP_FUNCTION(0x1, "i2c0", "sda"),
>            MPP_FUNCTION(0x2, "uart0", "rxd")),
> 
> What we found with Kirkwood, is that everybody picks the
> same. Probably because of Marvell's RDK and U-boot etc.  It is not
> clear from the current 370 boards what is being used. I should go look
> at Mirabox and 370 RD. If they are all mpp0 & mpp1, i suggest we put
> this into armada-370.dtsi

So i went and checked. Both Mirabox and 370 RD use mpp0 and mmp1. So i
suggest you add these to armada-370.dtsi.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
