From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v6 0/5] add mailbox support for i.MX7D
Date: Sun, 22 Jul 2018 10:44:31 +0000
Message-ID: <AM0PR04MB4211B82FD69B41B27465F5E580570@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180722063923.30222-1-o.rempel@pengutronix.de>
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
To: Oleksij Rempel <o.rempel@pengutronix.de>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Oleksij,

Thanks for the work.

Hi Jassi,
Do you think if we can have your tag and let those patches go through
Shawn's tree as the later QXP support patches depends on them?

Regards
Dong Aisheng

> -----Original Message-----
> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> Sent: Sunday, July 22, 2018 2:39 PM
> To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>;
> Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-linux-
> imx <linux-imx@nxp.com>
> Subject: [PATCH v6 0/5] add mailbox support for i.MX7D
> 
> 20180622 changes v6:
> - include one more patch provided by Aisheng
> - DT: add fall back compatible fsl,imx6sx-mu
> - imx-mailbox: for now, use only fsl,imx6sx-mu
> 
> 20180621 changes v5:
> - DT: revert most of the changes from previous version
> - imx-mailbox: remove struct imx_mu_cfg
> - imx-mailbox: remove !! from imx_mu_last_tx_done()
> 
> 20180618 changes v4:
> - DT: change fsl,mu-side-a to fsl,mu-side-b
> - DT: split the patches.
> - DT: add all currently known SoCs.
> - imx-mailbox: free allocated irq name on channel shutdown
> - imx-mailbox: rename *_imx7 functions to *_generic
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
> - imx-mailbox: depend on ARCH_MXC instead of SOX_IMX7
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
> Dong Aisheng (2):
>   dt-bindings: mailbox: allow mbox-cells to be equal to 0
>   dt-bindings: arm: fsl: add mu binding doc
> 
> Oleksij Rempel (3):
>   dt-bindings: mailbox: imx-mu: add generic MU channel support
>   ARM: dts: imx7s: add i.MX7 messaging unit support
>   mailbox: Add support for i.MX7D messaging unit
> 
>  .../devicetree/bindings/mailbox/fsl,mu.txt    |  41 +++
>  .../devicetree/bindings/mailbox/mailbox.txt   |   3 +-
>  arch/arm/boot/dts/imx7s.dtsi                  |  19 ++
>  drivers/mailbox/Kconfig                       |   6 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/imx-mailbox.c                 | 273 ++++++++++++++++++
>  6 files changed, 342 insertions(+), 2 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>  create mode 100644 drivers/mailbox/imx-mailbox.c
> 
> --
> 2.18.0
