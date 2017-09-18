From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dts: Enable building of LWN's Display5 board
Date: Mon, 18 Sep 2017 13:07:42 -0300
Message-ID: <CAOMZO5DLuVfpHuMhJsP5G8oiAAKgZbXFATSme6wEtDJpTP5tXA@mail.gmail.com>
References: <1505746765-965-1-git-send-email-lukma@denx.de> <1505746765-965-2-git-send-email-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505746765-965-2-git-send-email-lukma-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lukasz,

On Mon, Sep 18, 2017 at 11:59 AM, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org> wrote:
> This commit enables building of display5 related dtbs.
>
> Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4b17f35..c293bbb 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -400,6 +400,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>         imx6q-cm-fx6.dtb \
>         imx6q-cubox-i.dtb \
>         imx6q-dfi-fs700-m60.dtb \
> +       imx6q-display5-tianma-tm070-1280x768.dtb \
> +       imx6q-display5-mitsubishi-aa070-800x480.dtb \

This should be part of the first patch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
