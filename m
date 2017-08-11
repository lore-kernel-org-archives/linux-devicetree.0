From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V2 2/2] pinctrl: qcom: spmi-gpio: Add dtest route for
 digital input
Date: Fri, 11 Aug 2017 09:27:22 -0700
Message-ID: <20170811162722.GF2016@tuxbook>
References: <20170719063136.5300-1-fenglinw@codeaurora.org>
 <20170719063136.5300-3-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170719063136.5300-3-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue 18 Jul 23:30 PDT 2017, fenglinw@codeaurora.org wrote:
[..]
> @@ -528,6 +547,20 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (pad->dtest_buffer == 0) {
> +		val = 0;
> +	} else {
> +		if (pad->lv_mv_type) {
> +			val = pad->dtest_buffer - 1;
> +			val |= PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN;
> +		} else {
> +			val = 1 << (pad->dtest_buffer - 1);

val = BIT(pad->dtest_buffer - 1);


Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
