From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: update STM32 timers clock names
Date: Fri, 9 Jun 2017 09:43:21 +0200
Message-ID: <CA+M3ks7sQ_1kF_ZgQ1+mLwDVo2=CVmACFBvSuY+FyZ9WXY=5tw@mail.gmail.com>
References: <1496993874-9870-1-git-send-email-fabrice.gasnier@st.com> <1496993874-9870-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496993874-9870-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin GAIGNARD <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-06-09 9:37 GMT+02:00 Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>:
> Clock name has been updated during driver/DT binding review:
> https://lkml.org/lkml/2016/12/13/718
> Update DT binding doc to reflect this.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/stm32-timers.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/stm32-timers.txt b/Documentation/devicetree/bindings/mfd/stm32-timers.txt
> index bbd083f..1db6e00 100644
> --- a/Documentation/devicetree/bindings/mfd/stm32-timers.txt
> +++ b/Documentation/devicetree/bindings/mfd/stm32-timers.txt
> @@ -31,7 +31,7 @@ Example:
>                 compatible = "st,stm32-timers";
>                 reg = <0x40010000 0x400>;
>                 clocks = <&rcc 0 160>;
> -               clock-names = "clk_int";
> +               clock-names = "int";
>
>                 pwm {
>                         compatible = "st,stm32-pwm";
> --
> 1.9.1
>

Acked-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
