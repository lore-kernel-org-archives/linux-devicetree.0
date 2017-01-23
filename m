From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v2 00/12] Add basic code support for imx6sll
Date: Mon, 23 Jan 2017 07:18:51 +0000
Message-ID: <AM3PR04MB530E1929B64CEE28B3DFCE587720@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <20170123061034.GE5662@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170123061034.GE5662@dragon>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infrad>
List-Id: devicetree@vger.kernel.org

> From: Shawn Guo [mailto:shawnguo@kernel.org]
>=20
> On Tue, Dec 27, 2016 at 05:47:38PM +0800, Bai Ping wrote:
> > The i.MX 6SoloLiteLite application processors are NXP's latest
> > additions to a growing family of multimedia-focused products offering
> > high-performance processing optimized for lowest power consumption.
> > The i.MX 6SoloLiteLite processors feature NXP's advanced
> > implementation of the ARM Cortex-A9 core, which can be interfaced with
> > LPDDR3 and LPDDR2 DRAM memory devices.
> >
> > i.MX6SLL is a new SOC of the i.MX6 family, shares many common modules,
> > so most of the MSL code can be resued from i.MX6 serious SOC.
> >
> >
> > change for V2:
> >     -  address comments in dts and dtsi from Fabio.
> >     -  split the doc update into two patch, fix typo.
> >     -  address comments in clock driver, add necessary 'const'qualifier=
.
> >
> > Bai Ping (12):
> >   ARM: imx: Add basic msl support for imx6sll
> >   driver: clocksource: add gpt timer for imx6sll
> >   Document: dt: binding: imx: update clock doc for imx6sll
> >   driver: clk: imx: Add clock driver for imx6sll
> >   Document: dt: binding: imx: update pinctrl doc for imx6sll
> >   driver: pinctrl: imx: Add pinctrl driver support for imx6sll
> >   ARM: dts: imx: Add basic dtsi for imx6sll
> >   ARM: dts: imx: Add imx6sll EVK board dts support
> >   ARM: debug: Add low level debug support for imx6sll
> >   ARM: imx: Add suspend/resume support for imx6sll
> >   ARM: imx: correct i.mx6sll dram io low power mode
> >   ARM: configs: enable imx6sll support in defconfig
>=20
> I do not think you need to necessarily put them into a series, since they=
 will go
> through different sub-system maintainers.  If there are dependencies
> between them, you should manage to get the prerequisite parts get merged
> first.

ok, got it.=20

>=20
> Shawn
