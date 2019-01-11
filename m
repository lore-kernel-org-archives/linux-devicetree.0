From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/6] pinctrl: qcom: spmi-gpio: hardcode IRQ counts
Date: Fri, 11 Jan 2019 14:00:58 -0800
Message-ID: <154724405834.169631.5375710339019706473@swboyd.mtv.corp.google.com>
References: <20190110011258.17227-1-masneyb@onstation.org> <20190110011258.17227-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110011258.17227-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-09 17:12:53)
> @@ -1062,14 +1056,15 @@ static int pmic_gpio_remove(struct platform_devic=
e *pdev)
>         return 0;
>  }
> =20
> +/* data contains the number of GPIOs */
>  static const struct of_device_id pmic_gpio_of_match[] =3D {
> -       { .compatible =3D "qcom,pm8916-gpio" },   /* 4 GPIO's */
> -       { .compatible =3D "qcom,pm8941-gpio" },   /* 36 GPIO's */
> -       { .compatible =3D "qcom,pm8994-gpio" },   /* 22 GPIO's */
> -       { .compatible =3D "qcom,pmi8994-gpio" },  /* 10 GPIO's */
> -       { .compatible =3D "qcom,pma8084-gpio" },  /* 22 GPIO's */
> -       { .compatible =3D "qcom,pms405-gpio" },   /* 12 GPIO's, holes on =
1 9 10 */
> -       { .compatible =3D "qcom,spmi-gpio" }, /* Generic */
> +       { .compatible =3D "qcom,pm8916-gpio", .data =3D (void *) 4 },
> +       { .compatible =3D "qcom,pm8941-gpio", .data =3D (void *) 36 },
> +       { .compatible =3D "qcom,pm8994-gpio", .data =3D (void *) 22 },
> +       { .compatible =3D "qcom,pmi8994-gpio", .data =3D (void *) 10 },
> +       { .compatible =3D "qcom,pma8084-gpio", .data =3D (void *) 22 },
> +       /* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
> +       { .compatible =3D "qcom,pms405-gpio", .data =3D (void *) 12 },

We've been lazy and not been updating this file.

 $ git grep "qcom,spmi-gpio"
 arch/arm/boot/dts/qcom-pm8941.dtsi:                     compatible =3D "qc=
om,pm8941-gpio", "qcom,spmi-gpio";
 arch/arm/boot/dts/qcom-pma8084.dtsi:                    compatible =3D "qc=
om,pma8084-gpio", "qcom,spmi-gpio";
 arch/arm64/boot/dts/qcom/pm8005.dtsi:                   compatible =3D "qc=
om,pm8005-gpio", "qcom,spmi-gpio";
 arch/arm64/boot/dts/qcom/pm8998.dtsi:                   compatible =3D "qc=
om,pm8998-gpio", "qcom,spmi-gpio";
 arch/arm64/boot/dts/qcom/pmi8994.dtsi:                  compatible =3D "qc=
om,pmi8994-gpio", "qcom,spmi-gpio";
 arch/arm64/boot/dts/qcom/pmi8998.dtsi:                  compatible =3D "qc=
om,pmi8998-gpio", "qcom,spmi-gpio";

So we'll need to add pm8005, pm8998, pmi8998 here with their pin counts
too to avoid breaking those devices with this patch.
