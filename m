From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Handling of enet_out on i.MX28
Date: Thu, 20 Oct 2016 11:11:26 +0200
Message-ID: <20161020091126.jdoexu6iuu3jjzsm@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fugang Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

The i.MX28 reference manual specifies for HW_CLKCTRL_ENET.CLK_OUT_EN:
"NOTE: This bit must be configured before ENET PLL is enabled.".

Currently this is not implemented: ENET PLL (aka pll2) is the parent of
enet_out and so common clk enables the PLL first and only then sets
HW_CLKCTRL_ENET.CLK_OUT_EN.

For now this is a theoretical problem because I don't see any issues. I
only notice the discrepancy between manual and reality.

Do you think this is a problem?

Apart from that I'm not happy with the handling of this clk. IMHO it
should better be called "enet-ref" or similar (for the fec). imx28.dtsi
specifies that the clk is in use[1] and if my machine doesn't I have to
do:

	&mac0 {
		...
		/* overwrite clocks and clock-names to remove enet_out */
		clocks = <&clks 57>, <&clks 57>;
		clock-names = "ipg", "ahb";
		...
	};

in my board.dts. This is ugly because I have to repeat stuff that is
already in imx28.dtsi and it's not understandable without the comment.

It would be nice if dtc allowed to modify an array, then we could do:

	clocks += <&clks 64>;
	clock-names = += "enet_out";

(assuming the included dtsi doesn't specify this clock).

I first though it would be a good idea to specify the enet-ref clk as
follows:

	&mac0 {
		...
		mdio {
			clocks = <&clks 64>;
			clock-names = "enet-ref";
			...
		};
	};

but while this makes it easier for the board.dts to add (or remove) it,
it's not really right this way because the reference clock is needed for
data RX and TX, not the mdio bus. Technically these are two different
buses even though the "passengers" are often the same. (Even if two
MACs are in use, the enet-ref signal is shared.)

What do you think?

Best regards
Uwe

[1] clocks = <&clks 57>, <&clks 57>, <&clks 64>; clock-names = "ipg",
    "ahb", "enet_out"; in &mac0.

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
