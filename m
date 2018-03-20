Return-Path: <SRS0=Rgsm=GK=chromium.org=swboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <1521071931-9294-6-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-6-git-send-email-kramasub@codeaurora.org>
Message-ID: <152157474508.187949.10348604942277810227@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: sdm845: Add serial console support
Date: Tue, 20 Mar 2018 12:39:05 -0700
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org
List-ID: <devicetree@vger.kernel.org>

Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:50)
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sdm845-mtp.dts
> index 979ab49..ea3efc5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -12,4 +12,43 @@
>  / {
>         model =3D "Qualcomm Technologies, Inc. SDM845 MTP";
>         compatible =3D "qcom,sdm845-mtp";
> +
> +       aliases {
> +               serial0 =3D &uart2;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0";

Also add :115200n8 ?


> +       };
> +};
> +
> +&soc {

I think the method is to put these inside soc node without using the
phandle reference. So indent everything once more.

> +       geniqup@ac0000 {
> +               serial@a84000 {
> +                       status =3D "okay";
> +               };
> +       };
> +
> +       pinctrl@3400000 {
> +               qup-uart2-default {
> +                       pinconf_tx {
> +                               pins =3D "gpio4";
> +                               drive-strength =3D <2>;
> +                               bias-disable;
> +                       };
> +
> +                       pinconf_rx {
> +                               pins =3D "gpio5";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +               };
> +
> +               qup-uart2-sleep {
> +                       pinconf {
> +                               pins =3D "gpio4", "gpio5";
> +                               bias-pull-down;
> +                       };
> +               };
> +       };
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 32f8561..59334d9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -6,6 +6,7 @@
>   */
>  =

>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  =

>  / {
>         interrupt-parent =3D <&intc>;
> @@ -194,6 +195,20 @@
>                         #gpio-cells =3D <2>;
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
> +
> +                       qup_uart2_default: qup-uart2-default {
> +                               pinmux {
> +                                       function =3D "qup9";
> +                                       pins =3D "gpio4", "gpio5";
> +                               };
> +                       };
> +
> +                       qup_uart2_sleep: qup-uart2-sleep {
> +                               pinmux {
> +                                       function =3D "gpio";
> +                                       pins =3D "gpio4", "gpio5";
> +                               };
> +                       };

Are these supposed to go to the board file?

>                 };
>  =

>                 timer@17c90000 {
> @@ -272,5 +287,28 @@
>                         #interrupt-cells =3D <4>;
>                         cell-index =3D <0>;
>                 };
> +
> +               geniqup@ac0000 {
> +                       compatible =3D "qcom,geni-se-qup";
> +                       reg =3D <0xac0000 0x6000>;
> +                       clock-names =3D "m-ahb", "s-ahb";
> +                       clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +                                <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;

Add a status =3D "disabled" here too.

> +
> +                       uart2: serial@a84000 {
> +                               compatible =3D "qcom,geni-debug-uart";
> +                               reg =3D <0xa84000 0x4000>;
> +                               clock-names =3D "se";
> +                               clocks =3D <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +                               pinctrl-names =3D "default", "sleep";
> +                               pinctrl-0 =3D <&qup_uart2_default>;
> +                               pinctrl-1 =3D <&qup_uart2_sleep>;
> +                               interrupts =3D <GIC_SPI 354 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               status =3D "disabled";
> +                       };
> +               };
>         };
>  };
