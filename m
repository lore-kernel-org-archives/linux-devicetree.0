From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8974: add interrupt properties
Date: Thu, 03 Jan 2019 16:29:37 -0800
Message-ID: <154656177748.15366.4715288412613717364@swboyd.mtv.corp.google.com>
References: <20181229114755.8711-1-masneyb@onstation.org> <20181229114755.8711-4-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229114755.8711-4-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2018-12-29 03:47:55)
> Add interrupt properties now that spmi-gpio is a proper hierarchical IRQ
> chip.
>=20
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  arch/arm/boot/dts/qcom-pm8941.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-=
pm8941.dtsi
> index 9a91b758f7aa..d0b7f0eff288 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -65,6 +65,9 @@
>                         gpio-controller;
>                         gpio-ranges =3D <&pm8941_gpios 0 0 36>;
>                         #gpio-cells =3D <2>;
> +                       interrupt-parent =3D <&spmi_bus>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <4>;
>                         interrupts =3D <0 0xc0 0 IRQ_TYPE_NONE>,
>                                      <0 0xc1 0 IRQ_TYPE_NONE>,
>                                      <0 0xc2 0 IRQ_TYPE_NONE>,

Shouldn't we remove the interrupts property here then? Although we use
it to count the number of gpios that are supported so I guess we'll have
to specify it all the time now just to know how many pins there are.
Alternatively we change the driver to know about all the different
compatibles and use the right number of gpios for each compatible string
that we see.
