From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 6/9] arm64: dts: actions: Add Reset Controller support for
 S900 SoC
Date: Tue, 16 Oct 2018 14:42:19 -0700
Message-ID: <153972613980.5275.10581925529054373344@swboyd.mtv.corp.google.com>
References: <20180810095113.25292-1-manivannan.sadhasivam@linaro.org>
 <20180810095113.25292-7-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180810095113.25292-7-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2018-08-10 02:51:10)
> Add reset controller property and bindings header for the
> Actions Semi S900 SoC DTS.
> =

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Are these DT patches necessary for me to apply the clk patches? I'd like
to apply the clk patches without these dts bits.

>  arch/arm64/boot/dts/actions/s900.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/=
actions/s900.dtsi
> index aa3a49b0d646..4fbb39fd7971 100644
> --- a/arch/arm64/boot/dts/actions/s900.dtsi
> +++ b/arch/arm64/boot/dts/actions/s900.dtsi
> @@ -6,6 +6,7 @@
>  =

>  #include <dt-bindings/clock/actions,s900-cmu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/actions,s900-reset.h>
>  =

>  / {
>         compatible =3D "actions,s900";
> @@ -172,6 +173,7 @@
>                         reg =3D <0x0 0xe0160000 0x0 0x1000>;
>                         clocks =3D <&hosc>, <&losc>;
>                         #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
>                 };
>  =

>                 pinctrl: pinctrl@e01b0000 {
> -- =

> 2.17.1
>=20
