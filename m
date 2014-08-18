From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v3 1/6] pinctrl: Device tree bindings for Qualcomm
 pm8xxx gpio block
Date: Mon, 18 Aug 2014 10:16:02 +0300
Message-ID: <1408346162.2695.33.camel@iivanov-dev>
References: <1407771634-14946-1-git-send-email-iivanov@mm-sol.com>
	 <1407771634-14946-2-git-send-email-iivanov@mm-sol.com>
	 <ED4952FE-A292-4724-9283-B5226AB20E3E@me.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <ED4952FE-A292-4724-9283-B5226AB20E3E@me.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Daniel <delta.tatham@me.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2014-08-16 at 16:24 +0100, Daniel wrote:
> @Ivan: sorry about the double post.
> 
> Am 11.08.2014 um 16:40 schrieb Ivan T. Ivanov <iivanov@mm-sol.com>:
> > diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> > new file mode 100644
> > index 0000000..994e748
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> > @@ -0,0 +1,107 @@
> > +/*
> > + * This header provides constants for the Qualcomm PMIC gpio binding.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_QCOM_PMIC_GPIO_H
> > +#define _DT_BINDINGS_PINCTRL_QCOM_PMIC_GPIO_H
> > +
> > +#define PMIC_GPIO_PULL_UP_30		1
> > +#define PMIC_GPIO_PULL_UP_1P5		2
> > +#define PMIC_GPIO_PULL_UP_31P5		3
> > +#define PMIC_GPIO_PULL_UP_1P5_30	4
> 
> Looking at drivers/pinctrl/qcom/pinctrl-ssbi-pmic.c, shouldn't these defines start at 0?
> e.g. #define PMIC_GPIO_PULL_UP_30 	0
> 

Initially "bias-pull-up" was used to set this parameter. 
Zero value for "bias-pull-up" has special meaning "...the 
pin is connected to VDD...". So values in DTS have to have
offset by one. Micro Amps are non-standard for pull-ups, 
thats why I have changed this to "qcom,pull-up-strength", but I 
have made mistake in config_set function. Following patch should 
fix the issue. I will send updated version soon.

> However, I still cannot get any data from those 2 pins if I export them through /sys/class/gpio...

Ensure that you are exporting the right gpio number. 

# cat /sys/kernel/debug/gpio

Will tell you correct gpio range for registered gpio chips.

> 
> Device: Nexus 7 2013 WiFi
> Board: APQ8064

Thanks for testing this.

Regards,
Ivan

---
 drivers/pinctrl/qcom/pinctrl-ssbi-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-pmic.c
b/drivers/pinctrl/qcom/pinctrl-ssbi-pmic.c
index 9a1b443..dd424f4 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-pmic.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-pmic.c
@@ -446,7 +446,7 @@ static int pm8xxx_gpio_config_set(struct pinctrl_dev
*pctldev,
 				dev_err(pctrl->dev, "invalid pull-up level\n");
 				return -EINVAL;
 			}
-			pin->bias = arg - PM8XXX_GPIO_BIAS_PU_30;
+			pin->bias = arg - PMIC_GPIO_PULL_UP_30;
 			banks |= BIT(2);
 			pin->disable = 0;
 			banks |= BIT(3);
