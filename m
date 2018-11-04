From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: phy-qcom-qmp: Fix register underspecification
Date: Sat, 03 Nov 2018 19:40:18 -0700
Message-ID: <154129921872.88331.15831802252403117971@swboyd.mtv.corp.google.com>
References: <20181026173544.136037-1-evgreen@chromium.org>
 <20181026173544.136037-2-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026173544.136037-2-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Can Guo <cang@codeaurora.org>, linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2018-10-26 10:35:40)
>                         (or)
> @@ -150,3 +153,54 @@ Example:
>                 ...
>                 ...
>         };
> +
> +       phy@88eb000 {
> +               compatible =3D "qcom,sdm845-qmp-usb3-uni-phy";
> +               reg =3D <0x88eb000 0x18c>;
> +               #clock-cells =3D <1>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               clocks =3D <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
> +                        <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                        <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> +                        <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
> +               clock-names =3D "aux", "cfg_ahb", "ref", "com_aux";
> +
> +               resets =3D <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
> +                        <&gcc GCC_USB3_PHY_SEC_BCR>;
> +               reset-names =3D "phy", "common";
> +
> +               lane@88eb200 {
> +                       reg =3D <0x88eb200 0x128>,
> +                             <0x88eb400 0x1fc>,
> +                             <0x88eb800 0x218>,
> +                             <0x88eb600 0x70>;
> +                       #phy-cells =3D <0>;
> +                       clocks =3D <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
> +                       clock-names =3D "pipe0";
> +                       clock-output-names =3D "usb3_uni_phy_pipe_clk_src=
";

If this has clock-output-names then I would expect to see a #clock-cells
property, but that isn't here in this node. Are we relying on the same
property in the parent node?

> +               };
> +       };
