From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: Add STM32F746 MCU support
Date: Wed, 6 Jul 2016 14:43:12 +0200
Message-ID: <CACRpkdaQ+SY5x_wjZUK4d4UHmrfnTrKghTJ96WEWqkzhphq-ng@mail.gmail.com>
References: <1467798418-12124-1-git-send-email-alexandre.torgue@st.com> <1467798418-12124-2-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467798418-12124-2-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 6, 2016 at 11:46 AM, Alexandre TORGUE
<alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:

> This patch which adds STM32F746 pinctrl and GPIO support, relies on the
> generic STM32 pinctrl driver.
>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

(...)
> +static struct platform_driver stm32f746_pinctrl_driver = {
> +       .probe = stm32_pctl_probe,
> +       .driver = {
> +               .name = "stm32f746-pinctrl",
> +               .of_match_table = stm32f746_pctrl_match,
> +       },
> +};
> +
> +static int __init stm32f746_pinctrl_init(void)
> +{
> +       return platform_driver_register(&stm32f746_pinctrl_driver);
> +}
> +device_initcall(stm32f746_pinctrl_init);

Please use builtin_platform_driver() for this.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
