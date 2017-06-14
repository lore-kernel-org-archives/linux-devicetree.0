From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 0/3] ARM: dts: imx7: add NAND support
Date: Wed, 14 Jun 2017 23:11:47 +0800
Message-ID: <20170614151146.GC30112@dragon>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, sboyd@codeaurora.org, aisheng.dong@nxp.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, han.xu@nxp.com, fabio.estevam@freescale.com, LW@KARO-electronics.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 08, 2017 at 03:34:46PM -0700, Stefan Agner wrote:
> Stefan Agner (3):
>   clk: imx7d: create clocks behind rawnand clock gate
>   ARM: dts: imx7: add GPMI NAND and APBH DMA
>   ARM: dts: imx7-colibri: add NAND support

Both dts patches look good to me.  Please ping me after the clk patch
lands on mainline.

Shawn
