From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 1/3] clk: imx7d: create clocks behind rawnand clock gate
Date: Tue, 6 Jun 2017 13:33:41 -0300
Message-ID: <CAOMZO5D=M2i0SAyrtmO5s4UMY8E8Yun-QgJCfrxvEa+1Jb3Xqg@mail.gmail.com>
References: <cover.b62c3a17bd60de48d8fb2ade6dde4f2bc60aaf3c.1496730576.git-series.stefan@agner.ch>
 <df22afd249abba1ee7c9d31be1c2c8dc1a68f69a.1496730576.git-series.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <df22afd249abba1ee7c9d31be1c2c8dc1a68f69a.1496730576.git-series.stefan@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Dong Aisheng <aisheng.dong@nxp.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, han.xu@nxp.com, Fabio Estevam <fabio.estevam@freescale.com>, =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk
List-Id: devicetree@vger.kernel.org

On Tue, Jun 6, 2017 at 3:30 AM, Stefan Agner <stefan@agner.ch> wrote:
> The rawnand clock gate gates two clocks, NAND_USDHC_BUS_CLK_ROOT
> and NAND_CLK_ROOT. However, the gate has been in the chain of the
> latter only. This does not allow to use the NAND_USDHC_BUS_CLK_ROOT
> only, e.g. as required by APBH-Bridge-DMA.
>
> Add new clocks which represent the clock after the gate, and use a
> shared clock gate to correctly model the hardware.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
