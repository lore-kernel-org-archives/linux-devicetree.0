From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v3 0/3] add mailbox support for i.MX7D
Date: Tue, 17 Jul 2018 05:05:30 +0000
Message-ID: <AM0PR04MB42111345DF174BF8016DC071805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180716114209.25242-1-o.rempel@pengutronix.de>
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
To: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> Sent: Monday, July 16, 2018 7:42 PM
> To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-linux-
> imx <linux-imx@nxp.com>
> Subject: [PATCH v3 0/3] add mailbox support for i.MX7D
> 
> 20180615 changes v3:
> - DT: remove prosaic part of documentation. It describes software
>   or firmware specific usage and not relevant for HW description.
> - DT: use <soc>-mu instead of <soc>-mu-<mu side> and add fsl,mu-side-a
>   parameter.
> - DT: add most of know i.MX variants with MU
> - imx-mailbox: use macros instead of precalculated bit index.
> - imx-mailbox: remove warning message for clk.
> - imx-mailbox: use imx_mu_chan[%idx] for devm_request_irq.
> - imx-mailbox: depend on ARCH_MXS instead of SOX_IMX7

It's ARCH_MXC, but no affection on real patches.

Regards
Dong Aisheng

> 
> 20180615 changes v2:
> - DT: use mailbox@ instead of mu@
> - DT: change interrupts description
> - clk: use imx_clk_gate4 instead of imx_clk_gate2
> - imx-mailbox: remove last_tx_done support
> - imx-mailbox: fix module description
> 
> This patches are providing support for mailbox (Messaging Unit) for i.MX7D.
> Functionality was tested on PHYTEC phyBOARD-Zeta i.MX7D with Linux
> running on all cores: ARM Cortex-A7 and ARM Cortex-M4.
> 
> Both parts of i.MX messaging Unit are visible for all CPUs available on i.MX7D.
> Communication worked independent of MU side in combination with CPU.
> For example MU-A used on ARM Cortex-A7 and MU-B used on ARM Cortex-
> M4 or other ways around.
> 
> 
> Oleksij Rempel (3):
>   dt-bindings: arm: fsl: add mu binding doc
>   ARM: dts: imx7s: add i.MX7 messaging unit support
>   mailbox: Add support for i.MX7D messaging unit
> 
>  .../devicetree/bindings/mailbox/fsl,mu.txt    |  32 ++
>  arch/arm/boot/dts/imx7s.dtsi                  |  19 ++
>  drivers/mailbox/Kconfig                       |   6 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/imx-mailbox.c                 | 294 ++++++++++++++++++
>  5 files changed, 353 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>  create mode 100644 drivers/mailbox/imx-mailbox.c
> 
> --
> 2.18.0
