From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RESEND v5 4/5] clk: imx: add imx composite clock
Date: Wed, 22 Aug 2018 13:17:40 +0000
Message-ID: <20180822131739.a2qoweu5vnakhjg6@fsr-ub1664-175>
References: <1534749367-31085-1-git-send-email-abel.vesa@nxp.com>
 <1534749367-31085-5-git-send-email-abel.vesa@nxp.com>
 <20180821065830.x5illrgyqct6h3nf@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180821065830.x5illrgyqct6h3nf@pengutronix.de>
Content-Language: en-US
Content-ID: <AA3089E295398B40801E30BCAF8CD622@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 21, 2018 at 08:58:30AM +0200, Sascha Hauer wrote:
> On Mon, Aug 20, 2018 at 10:16:06AM +0300, Abel Vesa wrote:
> > +
> > +	val |=3D (u32)value << divider->shift;
> > +	val |=3D (u32)value << PCG_DIV_SHIFT;
> > +	clk_writel(val, divider->reg);
> > +
> > +	spin_unlock_irqrestore(divider->lock, flags);
> > +
> > +	return 0;
> > +}
>=20
> Have you tested this works? I thought those are two cascaded dividers
> and you program both to the same value. Normally you would have to
> calculate individual values for each divider which together give you the
> desired output rate.
>

My bad. Haven't properly tested it since there is no actual driver that cal=
ls
set_rate on any of those clocks at this point. Sorry about that. I'll send
another version today, where I've implemented it as I should've done from t=
he
start and I've tested it by explicitly calling the set_rate and read the va=
lue
with clk_get_rate to make sure it's fine.
=20
> Sascha
>=20
> --=20
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 | https://emea01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.pengutronix.de%2F&amp;data=3D02=
%7C01%7Cabel.vesa%40nxp.com%7C722eb3cdb15849a9d19608d6073382e4%7C686ea1d3bc=
2b4c6fa92cd99c5c301635%7C0%7C0%7C636704315167487036&amp;sdata=3DQ29pmTcLbqN=
PjotCFjZ%2BldD%2FBlbYpm6fN%2BzguHixwfA%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|

-- =
