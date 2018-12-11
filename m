From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 0/6] Add basic support for i.MX8MQ SoC and i.MX8MQ EVK
 board
Date: Tue, 11 Dec 2018 16:09:29 +0800
Message-ID: <20181211080854.GZ3987@dragon>
References: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 09, 2018 at 02:26:05PM +0000, Abel Vesa wrote:
> Took this from Lucas since he's busy with some other work for the moment and
> I thought we might be able to get this ready for the merge window.
> 
> Basically is just a respin with a minor fix for a comment from Rob.
> 
> Lucas, thanks for all the effort with this.

When you handle patches from someone else, you should have your SoB
added.  Fixed for you.

> 
> Changes since v5:
>  * replaced the name of the node peripherals with soc in dts file
> 
> Baruch Siach (2):
>   arm64: dts: imx8mq: add watchdog devices
>   arm64: dts: imx8mq-evk: enable watchdog
> 
> Lucas Stach (4):
>   arm64: add basic Kconfig symbols for i.MX8
>   arm64: add basic DTS for i.MX8MQ
>   arm64: add support for i.MX8M EVK board
>   MAINTAINERS: add i.MX8 DT path to i.MX architecture
> 
>  Documentation/devicetree/bindings/arm/fsl.txt  |   8 +

This file will be removed in v4.21-rc1 as we are moving to json-schema.
So I dropped the changes on fsl.txt and will patch fsl.yaml for the new
compatible strings.

Series is applied.

Shawn

>  MAINTAINERS                                    |   1 +
>  arch/arm64/Kconfig.platforms                   |  14 +
>  arch/arm64/boot/dts/freescale/Makefile         |   2 +
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts   | 303 ++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h | 623 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi      | 416 +++++++++++++++++
>  7 files changed, 1367 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-evk.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq.dtsi
> 
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
