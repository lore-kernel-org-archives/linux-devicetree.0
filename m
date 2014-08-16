From: Daniel <delta.tatham@me.com>
Subject: Re: [PATCH v3 1/6] pinctrl: Device tree bindings for Qualcomm pm8xxx
 gpio block
Date: Sat, 16 Aug 2014 16:24:06 +0100
Message-ID: <ED4952FE-A292-4724-9283-B5226AB20E3E@me.com>
References: <1407771634-14946-1-git-send-email-iivanov@mm-sol.com>
 <1407771634-14946-2-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1972.3\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-reply-to: <1407771634-14946-2-git-send-email-iivanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

@Ivan: sorry about the double post.

Am 11.08.2014 um 16:40 schrieb Ivan T. Ivanov <iivanov@mm-sol.com>:
> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> new file mode 100644
> index 0000000..994e748
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> @@ -0,0 +1,107 @@
> +/*
> + * This header provides constants for the Qualcomm PMIC gpio binding.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_QCOM_PMIC_GPIO_H
> +#define _DT_BINDINGS_PINCTRL_QCOM_PMIC_GPIO_H
> +
> +#define PMIC_GPIO_PULL_UP_30		1
> +#define PMIC_GPIO_PULL_UP_1P5		2
> +#define PMIC_GPIO_PULL_UP_31P5		3
> +#define PMIC_GPIO_PULL_UP_1P5_30	4

Looking at drivers/pinctrl/qcom/pinctrl-ssbi-pmic.c, shouldn't these defines start at 0?
e.g. #define PMIC_GPIO_PULL_UP_30 	0

after shifting those 4 defines by -1, /sys/kernel/debug/gpio gives me the proper values for the pins configured to be pull-up:

cat /sys/kernel/debug/gpio
GPIOs 212-255, platform/500000.qcom,ssbi:pmic@0:gpio@150, 500000.qcom,ssbi:pmic@0:gpio@150:
...
gpio4 : in   normal  VIN2 pull-up 30uA                push-pull  low  no      inverted
...
gpio38: in   normal  VIN2 pull-up 30uA                push-pull  low  no      inverted
...
____
dts:
[snip]
                                        pm8921_gpio_keys: gpio-keys {
                                                volume-keys {
                                                        pins = "gpio4", "gpio38";
                                                        function = PMIC_GPIO_FUNC_NORMAL;

                                                        input-enable;
                                                        drive-push-pull;
                                                        qcom,pull-up-strength = <PMIC_GPIO_PULL_UP_30>;
                                                        qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
                                                        power-source = <PM8921_GPIO_S4>;
                                                };
                                        };
[/snip]

However, I still cannot get any data from those 2 pins if I export them through /sys/class/gpio...

Device: Nexus 7 2013 WiFi
Board: APQ8064

Cheers,
D