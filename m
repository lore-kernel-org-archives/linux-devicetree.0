From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: fsl: Build the Librem5 devkit devicetree
Date: Tue, 12 Mar 2019 08:24:00 +0200
Message-ID: <CAEnQRZDhvmWCjWXU_P66OTL2QngM8MKxDmAq1nTSZ8HK2Gm2AQ@mail.gmail.com>
References: <20190311234655.30357-1-angus@akkea.ca> <20190311234655.30357-3-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311234655.30357-3-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, agx@sigxcpu.org, dl-linux-imx <linux-imx@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2019 at 1:48 AM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> Compile the Librem5 devkit device tree
>
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  arch/arm64/boot/dts/freescale/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 13604e558dc1..95526ee3c27a 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -22,3 +22,4 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
This should be in alphabetical order. So move this immediately
after imx8mq-evk.dtb

> --
> 2.17.1
>
