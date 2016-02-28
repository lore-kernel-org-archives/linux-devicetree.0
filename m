From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: ARM: dts: imx6ul: add more functionality to i.MX6UL
Date: Sun, 28 Feb 2016 14:49:12 +0800
Message-ID: <20160228064912.GH22051@tiger>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-clk-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 20, 2016 at 11:08:53AM +0100, Lothar Wa=DFmann wrote:
> This patchset adds more functionality to the i.MX6UL machines.
>=20
> The first three patches are cleanup patches with no functional change=
s
> intended.
> The other patches make various subsystems functional.
>=20
> ARM: dts: imx6ul: whitespace cleanup; no functional

This has been applied from another series.

> ARM: dts: imx6ul: move tsc node to appropriate place
> ARM: dts: imx6ul: move dt-bindings/input/input.h
> ARM: dts: imx6ul: specify proper clocks for GPT node
> ARM: dts: imx6ul: specify proper clocks for the PWM
> ARM: dts: imx6ul: disable PWMs by default
> ARM: dts: imx6ul: add pwm[1-4] nodes
> ARM: dts: imx6ul: add sdma support
> ARM: dts: imx6ul: add flexcan support
> ARM: dts: imx6ul: add sai support
> ARM: dts: imx6ul: add lcdif support
> ARM: dts: imx6ul: add gpmi support

Just applied the above.

> clk: imx: whitespace cleanup; no functional change
> clk: imx: add kpp clock for i.MX6UL

These two have been applied from a separate series.

> ARM: dts: imx6ul: add kpp support

It was just applied.

Shawn

> ARM: dts: imx6ul: add support for Ka-Ro electronics TX6UL module
