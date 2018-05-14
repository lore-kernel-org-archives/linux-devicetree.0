From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Collapse usb support into one node
Date: Mon, 14 May 2018 15:10:04 -0700
Message-ID: <152633580491.34267.3508281594437081335@swboyd.mtv.corp.google.com>
References: <1523973390-2387-1-git-send-email-yossim@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523973390-2387-1-git-send-email-yossim@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "moderated list:ARM64 PORT AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>
Cc: Yossi Mansharoff <yossim@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Yossi Mansharoff (2018-04-17 06:56:30)
> We currently have three device nodes for the same USB hardware
> block, as evident by the reuse of the same reg address multiple
> times. Now that the chipidea driver fully supports OTG with the
> MSM wrapper we can collapse all these nodes into one USB device
> node, reflecting the true nature of the hardware.

None of this makes sense. Commit text is totally bogus now.

> =

> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/=
dts/qcom/apq8016-sbc.dtsi
> index 9ff8487..1505921 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -371,18 +372,18 @@
>                         adp-disable;
>                         hnp-disable;
>                         srp-disable;
> -                       dr_mode =3D "host";
> -                       pinctrl-names =3D "default";
> -                       pinctrl-0 =3D <&usb_sw_sel_pm>;
> +                       mux-controls =3D <&usb_switch>;
> +                       mux-control-names =3D "usb_switch";
> +
>                         ulpi {
>                                 phy {
>                                         v1p8-supply =3D <&pm8916_l7>;
>                                         v3p3-supply =3D <&pm8916_l13>;
> -                                       extcon =3D <&usb_id>;
>                                 };
>                         };
>                 };
>  =

> +

Why the newline?

>                 lpass@7708000 {
>                         status =3D "okay";
>                 };
> @@ -512,11 +513,17 @@
>  =

>         usb_id: usb-id {
>                 compatible =3D "linux,extcon-usb-gpio";
> -               vbus-gpio =3D <&msmgpio 121 GPIO_ACTIVE_HIGH>;
> +               id-gpio =3D <&msmgpio 121 GPIO_ACTIVE_HIGH>;

Hmm?

>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&usb_id_default>;
>         };
>  =

> +       usb_switch: usb-switch {
> +               compatible =3D "gpio-mux";

Needs a better compatible string for the actual mux part. The gpio-mux
can come after that because it's generic, but it's good to record the
actual mux part too.

> +               mux-gpios =3D <&pm8916_gpios 4 GPIO_ACTIVE_HIGH>;
> +               #mux-control-cells =3D <0>;
> +       };
