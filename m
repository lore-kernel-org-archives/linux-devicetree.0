From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH 0/8] Qualcomm PMIC pinctrl additions
Date: Wed, 24 Jun 2015 11:29:35 +0300
Message-ID: <1435134575.2334.36.camel@linaro.org>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org


On Wed, 2015-06-17 at 23:47 -0700, Bjorn Andersson wrote:
> This series starts out by fixing various issues found in the pm8941 mpp driver.
> While doing this work, and trying to use the mpp driver from device tree it, it
> became obvious that the current binding is not fit for neither the driver
> implementation nor the dts implementation.
> 
> The main reason for this is that we "inherited" the functions from the gpio
> driver, where there is a notion of functions. But in the MPP the logical
> mapping of digital, analog and current sink makes much more sense to map as
> "functions". The features previously exposed as functions are replaced by two
> properties (qcom,paired and qcom,dtest).
> 
> The end result is a more natural device tree definition.
> 
> With this in place the series introduces the gpio and mpp drivers for the ssbi
> based pmics; found in 8660, 8960 and 8064.
> 
> Bjorn Andersson (8):
>   pinctrl: qcom: spmi-mpp: Transition to generic dt binding parser
>   pinctrl: qcom: spmi-mpp: Fixes related to enable handling
>   pinctrl: qcom: spmi-mpp: Introduce defines for MODE_CTL
>   pinctrl: qcom: spmi-mpp: Implement support for sink mode
>   pinctrl: qcom: spmi-mpp: Add support for setting analog output level
>   pinctrl: qcom: spmi-mpp: Transpose pinmux function
>   mfd: pm8921: Implement irq_get_irqchip_state
>   pinctrl: qcom: ssbi: Family A gpio & mpp drivers

Thank you Bjorn.

Now MPP drivers have its full functionality.

With two small comments on patch 5 and 8,

Reviewed-by: Ivan T. Ivanov <iivanov@mm-sol.com>
