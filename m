From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH] pinctrl: Add support for PM8916 GPIO's and MPP's
Date: Tue, 7 Apr 2015 19:00:12 -0700
Message-ID: <CAJAp7OgC_-AStTQphR9jyRO5JdHaw1Cg3NWmT9sX70BCNMYCHA@mail.gmail.com>
References: <1427794638-32732-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427794638-32732-1-git-send-email-ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 31, 2015 at 2:37 AM, Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Add compatible string definitions and supported pin functions.
>
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
[..]
> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
[..]
>
> +#define PM8916_GPIO1_BAT_ALRM_OUT      PMIC_GPIO_FUNC_FUNC1
> +#define PM8916_GPIO1_KEYP_DRV          PMIC_GPIO_FUNC_FUNC2
> +#define PM8916_GPIO2_DIV_CLK           PMIC_GPIO_FUNC_FUNC1
> +#define PM8916_GPIO2_SLEEP_CLK         PMIC_GPIO_FUNC_FUNC2
> +#define PM8916_GPIO3_KEYP_DRV          PMIC_GPIO_FUNC_FUNC1
> +#define PM8916_GPIO4_KEYP_DRV          PMIC_GPIO_FUNC_FUNC2
> +

The documentation I have for the PM8916 is vague, but lists slightly
different functions. Andy, could you help out with verifying the
functions of the gpios on this pmic?

For the rest of the patch:
Acked-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
