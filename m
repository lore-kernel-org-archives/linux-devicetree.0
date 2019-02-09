Return-Path: <SRS0=eUQR=QQ=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com> <1549650743-27581-2-git-send-email-Frank.Li@nxp.com>
In-Reply-To: <1549650743-27581-2-git-send-email-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Feb 2019 10:21:11 -0200
Message-ID: <CAOMZO5CNhGY7bxcZ9qEDBejrtn2m-5_y44emXxstW8m1LEHvfQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx8qxp: added ddr performance monitor nodes
Content-Type: text/plain; charset="UTF-8"
To: Frank Li <frank.li@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lznuaa@gmail.com" <lznuaa@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 8, 2019 at 4:32 PM Frank Li <frank.li@nxp.com> wrote:

> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 4c3dd95..243d7b3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -79,6 +79,13 @@
>                 interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>         };
>
> +       ddr_pmu0: ddr_pmu@5c020000 {

Underscores should not be used in node names. You could use
pmu@5c020000 instead.
