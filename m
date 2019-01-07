From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/5] spmi: pmic-arb: hardcode IRQ counts
Date: Mon, 07 Jan 2019 13:26:06 -0800
Message-ID: <154689636697.15366.4175054145572492763@swboyd.mtv.corp.google.com>
References: <20190107021145.6370-1-masneyb@onstation.org> <20190107021145.6370-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-01-06 18:11:41)
> @@ -1062,19 +1076,6 @@ static int pmic_gpio_remove(struct platform_device=
 *pdev)
>         return 0;
>  }
> =20
> -static const struct of_device_id pmic_gpio_of_match[] =3D {
> -       { .compatible =3D "qcom,pm8916-gpio" },   /* 4 GPIO's */
> -       { .compatible =3D "qcom,pm8941-gpio" },   /* 36 GPIO's */
> -       { .compatible =3D "qcom,pm8994-gpio" },   /* 22 GPIO's */
> -       { .compatible =3D "qcom,pmi8994-gpio" },  /* 10 GPIO's */
> -       { .compatible =3D "qcom,pma8084-gpio" },  /* 22 GPIO's */
> -       { .compatible =3D "qcom,pms405-gpio" },   /* 12 GPIO's, holes on =
1 9 10 */
> -       { .compatible =3D "qcom,spmi-gpio" }, /* Generic */
> -       { },
> -};
> -
> -MODULE_DEVICE_TABLE(of, pmic_gpio_of_match);
> -

Please don't move the array. It isn't necessary if you use
device_get_match_data() instead of of_match_device().
