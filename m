From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: qpnp: Qualcomm PMIC pin controller driver
Date: Wed, 23 Jul 2014 17:27:22 +0200
Message-ID: <CACRpkdaCfrjNmkuRYVwdDHdt4myNkmTwmJjZU3AQr1SsSKBS3g@mail.gmail.com>
References: <1405610748-7583-1-git-send-email-iivanov@mm-sol.com>
	<1405610748-7583-3-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405610748-7583-3-git-send-email-iivanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 17, 2014 at 5:25 PM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
>
> This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> Qualcomm GPIO and MPP sub-function blocks found in the PMIC chips.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
(...)
> +static int qpnp_pinctrl_remove(struct platform_device *pdev)
> +{
> +       struct qpnp_pinctrl *qctrl = platform_get_drvdata(pdev);
> +
> +       pinctrl_unregister(qctrl->ctrl);
> +
> +       return gpiochip_remove(&qctrl->chip);

We're removing the return value from gpiochip_remove() and I
have dropped the __must_check attribute today, so just remove
it unconditionally and return 0;

Sorry for short and lame comment on a large patch I should look
closer at, but atleast it's something.

Yours,
Linus Walleij
