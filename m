From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Add pms405 gpio support
Date: Thu, 20 Sep 2018 08:30:03 -0700
Message-ID: <153745740342.119890.12073424910838960020@swboyd.mtv.corp.google.com>
References: <20180920014705.15144-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920014705.15144-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-09-19 18:47:05)
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index a29efbe08f48..b54891998caa 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1055,6 +1055,7 @@ static const struct of_device_id pmic_gpio_of_match=
[] =3D {
>         { .compatible =3D "qcom,pm8994-gpio" },   /* 22 GPIO's */
>         { .compatible =3D "qcom,pmi8994-gpio" },  /* 10 GPIO's */
>         { .compatible =3D "qcom,pma8084-gpio" },  /* 22 GPIO's */
> +       { .compatible =3D "qcom,pms405-gpio" }, /* 11 GPIO's */

I thought we didn't update the C driver, because there isn't anything to
do here. Just make binding updates and it's all fine.

>         { .compatible =3D "qcom,spmi-gpio" }, /* Generic */
>         { },
>  };
