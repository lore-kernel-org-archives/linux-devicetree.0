From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: ARM: dts: imx6ul: add more functionality to i.MX6UL
Date: Wed, 30 Mar 2016 19:43:14 +0800
Message-ID: <20160330114313.GE28207@tiger>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
 <1457095043-14115-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457095043-14115-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2016 at 01:37:21PM +0100, Lothar Wa=DFmann wrote:
> [PATCHv3 1/2] ARM: dts: imx6ul: add support for Ka-Ro electronics TXU=
L modules
> [PATCHv3 2/2] ARM: dts: imx6ul: add support for Ka-Ro electronics TXU=
L mainboard

Applied both, thanks.

>=20
> This patchset adds more functionality to the i.MX6UL machines.
>=20
> Changes vs. v1:
> - added patch to implement KPP clock for i.MX6UL to prevent conflicts
>   when this patch would go via a different tree.
> - added board support for Ka-Ro electronics TX6UL module for the same
>   reason
> - added imx6ul specific compatibles as requested by Lucas Stach
>=20
> Changes vs. v2:
> - dropped patches which have already been applied in the meantime
> - addressed comments by Shawn Guo
>=20
>=20
