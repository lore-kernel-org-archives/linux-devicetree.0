From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: imx8mq: add DCSS node
Date: Mon, 23 Sep 2019 09:54:42 -0700
Message-ID: <20190923165443.D1B1C20882@mail.kernel.org>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com> <1569248002-2485-6-git-send-email-laurentiu.palcu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569248002-2485-6-git-send-email-laurentiu.palcu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, linux-kernel@vger.kernel.org, Laurentiu Palcu <laurentiu.palcu@nxp.com>, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

Quoting Laurentiu Palcu (2019-09-23 07:13:19)
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi
> index 52aae34..d4aa778 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -871,6 +871,31 @@
>                                 interrupt-controller;
>                                 #interrupt-cells =3D <1>;
>                         };
> +
> +                       dcss: dcss@0x32e00000 {

Drop the 0x prefix on node names.

> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               compatible =3D "nxp,imx8mq-dcss";
> +                               reg =3D <0x32e00000 0x2D000>, <0x32e2f000=
 0x1000>;
> +                               interrupts =3D <6>, <8>, <9>;
> +                               interrupt-names =3D "ctx_ld", "ctxld_kick=
", "vblank";
> +                               interrupt-parent =3D <&irqsteer>;
> +                               clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT=
>,
> +                                        <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
> +                                        <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
> +                                        <&clk IMX8MQ_VIDEO2_PLL_OUT>,
> +                                        <&clk IMX8MQ_CLK_DISP_DTRC>;
> +                               clock-names =3D "apb", "axi", "rtrm", "pi=
x", "dtrc";
> +                               assigned-clocks =3D <&clk IMX8MQ_CLK_DISP=
_AXI>,
> +                                                 <&clk IMX8MQ_CLK_DISP_R=
TRM>,
> +                                                 <&clk IMX8MQ_VIDEO2_PLL=
1_REF_SEL>;
> +                               assigned-clock-parents =3D <&clk IMX8MQ_S=
YS1_PLL_800M>,
> +                                                        <&clk IMX8MQ_SYS=
1_PLL_800M>,
> +                                                        <&clk IMX8MQ_CLK=
_27M>;
> +                               assigned-clock-rates =3D <800000000>,
> +                                                          <400000000>;
> +                               status =3D "disabled";
> +                       };
