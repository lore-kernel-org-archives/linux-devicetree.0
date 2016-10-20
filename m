From: Andy Duan <fugang.duan@nxp.com>
Subject: RE: Handling of enet_out on i.MX28
Date: Thu, 20 Oct 2016 12:29:44 +0000
Message-ID: <AM4PR0401MB22607753FB012789493C9C2EFFD50@AM4PR0401MB2260.eurprd04.prod.outlook.com>
References: <20161020091126.jdoexu6iuu3jjzsm@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161020091126.jdoexu6iuu3jjzsm@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Fabio Estevam Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> Sent: Thursday, O=
ctober 20, 2016 5:11 PM
> To: Andy Duan <fugang.duan@nxp.com>; Fabio Estevam Estevam
> <fabio.estevam@nxp.com>; Shawn Guo <shawnguo@kernel.org>;
> devicetree@vger.kernel.org
> Cc: kernel@pengutronix.de; linux-arm-kernel@lists.infradead.org
> Subject: Handling of enet_out on i.MX28
> =

> Hello,
> =

> The i.MX28 reference manual specifies for HW_CLKCTRL_ENET.CLK_OUT_EN:
> "NOTE: This bit must be configured before ENET PLL is enabled.".
> =

> Currently this is not implemented: ENET PLL (aka pll2) is the parent of
> enet_out and so common clk enables the PLL first and only then sets
> HW_CLKCTRL_ENET.CLK_OUT_EN.
> =

> For now this is a theoretical problem because I don't see any issues. I o=
nly
> notice the discrepancy between manual and reality.
> =

> Do you think this is a problem?
> =

I don't know the history. But I think this is a problem. Maybe it bring som=
e clock glitch that may cause PHY (with RMII)  abnormal.

> Apart from that I'm not happy with the handling of this clk. IMHO it shou=
ld
> better be called "enet-ref" or similar (for the fec). imx28.dtsi specifie=
s that
> the clk is in use[1] and if my machine doesn't I have to
> do:
> =

> 	&mac0 {
> 		...
> 		/* overwrite clocks and clock-names to remove enet_out */
> 		clocks =3D <&clks 57>, <&clks 57>;
> 		clock-names =3D "ipg", "ahb";
> 		...
> 	};
> =

> in my board.dts. This is ugly because I have to repeat stuff that is alre=
ady in
> imx28.dtsi and it's not understandable without the comment.
> =

> It would be nice if dtc allowed to modify an array, then we could do:
> =

> 	clocks +=3D <&clks 64>;
> 	clock-names =3D +=3D "enet_out";
> =

> (assuming the included dtsi doesn't specify this clock).
> =

> I first though it would be a good idea to specify the enet-ref clk as
> follows:
> =

> 	&mac0 {
> 		...
> 		mdio {
> 			clocks =3D <&clks 64>;
> 			clock-names =3D "enet-ref";
> 			...
> 		};
> 	};
>
In RMII mode,  this clock is for phy and MAC reference clock.
It is better to specify this clock as "enet_clk_ref" and "enet_out" that is=
 easy to understand.
In dtsi file, we can just define ipg and ahb clock.
clocks =3D <&clks 57>, <&clks 57>;
clock-names =3D "ipg","ahb";
In dts file, different boards may have design mode like RMII/MII, RMII mode=
 needs to define enet_out and enet_clk_ref,  MII mode doesn't need this clo=
cks.
So it depends on board design, we can overwrite the clock in dts board file=
.   =

Like in RMII mode: =

clocks =3D <&clks 57>, <&clks 57>, <&clks 64>, <&clks 64>;
clock-names =3D "ipg","ahb", "enet_clk_ref","enet_out";
In MII mode: no necessary to overwrite them. =


> but while this makes it easier for the board.dts to add (or remove) it, i=
t's not
> really right this way because the reference clock is needed for data RX a=
nd TX,
> not the mdio bus. Technically these are two different buses even though t=
he
> "passengers" are often the same. (Even if two MACs are in use, the enet-r=
ef
> signal is shared.)
> =

> What do you think?
> =

> Best regards
> Uwe
> =

> [1] clocks =3D <&clks 57>, <&clks 57>, <&clks 64>; clock-names =3D "ipg",
>     "ahb", "enet_out"; in &mac0.
> =

> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
