From: divya ojha <odivya77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] pinctrl: qpnp: Qualcomm PMIC pin controller driver
Date: Mon, 21 Jul 2014 21:32:24 +0530
Message-ID: <CADsdr6Pwa+Vzugy7_-yWePmT6Wj5bpJRDq=qq2KLdG2woioY4g@mail.gmail.com>
References: <1405610748-7583-1-git-send-email-iivanov@mm-sol.com>
	<1405610748-7583-3-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405610748-7583-3-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jul 17, 2014 at 8:55 PM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
> From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>
> This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> Qualcomm GPIO and MPP sub-function blocks found in the PMIC chips.
>
> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pinctrl/Kconfig                       |   12 +
>  drivers/pinctrl/Makefile                      |    1 +
>  drivers/pinctrl/pinctrl-qpnp.c                | 1565 +++++++++++++++++++++++++
>  include/dt-bindings/pinctrl/qcom,pm8xxx-mpp.h |   34 +
..
+       struct device *dev = qctrl->dev;
> +       struct pinctrl_pin_desc *desc, *descs;
> +       struct qpnp_padinfo *pad, *pads;
> +       int idx, ret, cnt, gps, ais, aos, css;
> +       const char **names, *format;
> +       unsigned int addr;
> +
> +       pads = devm_kcalloc(dev, qchip->npads, sizeof(*pads), GFP_KERNEL);

when do we free these structures..?

> +       if (!pads)
> +               return -ENOMEM;
> +
> +       descs = devm_kcalloc(dev, qchip->npads, sizeof(*descs), GFP_KERNEL);

ditto..

> +       if (!descs)
> +               return -ENOMEM;
> +
..
> +               cnt = qctrl->groups[idx].npins;
> +               if (!cnt)
> +                       continue;
> +
> +               names = devm_kcalloc(dev, cnt, sizeof(names), GFP_KERNEL);

ditto..

> +               if (!names)
> +                       return -ENOMEM;

> +#define PM8XXX_MPP_AIN_ABUS4                   7
> +
> +#endif
> --
> 1.8.3.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Regards
Divya
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
