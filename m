From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: pinctrl: qcom: Add QCS404 pinctrl binding
Date: Thu, 20 Sep 2018 08:34:45 -0700
Message-ID: <153745768521.119890.130144479222793813@swboyd.mtv.corp.google.com>
References: <20180920013712.2361-1-bjorn.andersson@linaro.org>
 <20180920013712.2361-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920013712.2361-4-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-09-19 18:37:11)
> +
> +Example:
> +
> +       tlmm: pinctrl@01000000 {

Drop leading 0.

> +               compatible =3D "qcom,qcs404-pinctrl";
> +               reg =3D <0x01000000 0x200000>,
> +                     <0x01300000 0x200000>,
> +                     <0x07b00000 0x200000>;
> +               reg-names =3D "south", "north", "east";
> +               interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-ranges =3D <&tlmm 0 0 120>;
