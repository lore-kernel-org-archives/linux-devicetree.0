From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 3/6] arm64: add support for i.MX8M EVK board
Date: Sun, 16 Dec 2018 17:17:19 +0800
Message-ID: <20181216091718.GL13243@dragon>
References: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
 <1544365552-30270-4-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544365552-30270-4-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 09, 2018 at 02:26:08PM +0000, Abel Vesa wrote:
...
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 7748e6d..0001361 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -18,3 +18,5 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
> +
> +dtb-$(CONFIG_SOC_IMX8MQ) += imx8mq-evk.dtb

I changed the line as below to drop use of SOC_IMX8MQ.

   dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb

Shawn
