From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Add pms405 gpio support
Date: Thu, 20 Sep 2018 09:34:05 -0700
Message-ID: <20180920163405.GE1367@tuxbook-pro>
References: <20180920014705.15144-1-bjorn.andersson@linaro.org>
 <153745740342.119890.12073424910838960020@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153745740342.119890.12073424910838960020@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 20 Sep 08:30 PDT 2018, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2018-09-19 18:47:05)
> > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > index a29efbe08f48..b54891998caa 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > @@ -1055,6 +1055,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
> >         { .compatible = "qcom,pm8994-gpio" },   /* 22 GPIO's */
> >         { .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
> >         { .compatible = "qcom,pma8084-gpio" },  /* 22 GPIO's */
> > +       { .compatible = "qcom,pms405-gpio" }, /* 11 GPIO's */
> 
> I thought we didn't update the C driver, because there isn't anything to
> do here. Just make binding updates and it's all fine.
> 

Right, forgot that we just use the fallback.

Thanks,
Bjorn

> >         { .compatible = "qcom,spmi-gpio" }, /* Generic */
> >         { },
> >  };
