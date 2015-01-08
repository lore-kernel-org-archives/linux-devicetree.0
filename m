From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: add mt6592 compatible string for
 mediatek sysirq
Date: Thu, 8 Jan 2015 13:28:45 +0100
Message-ID: <CABuKBeLFD4D8MB14o206Bs2t5sqhatsLzhV26rHkFrt5dd8+Qw@mail.gmail.com>
References: <1420698191-10878-1-git-send-email-howard.chen@linaro.org>
	<1420698191-10878-2-git-send-email-howard.chen@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420698191-10878-2-git-send-email-howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Howard,

2015-01-08 7:23 GMT+01:00 Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> Signed-off-by: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt | 1 +
>  1 file changed, 1 insertion(+)

This patch lacks a description of what it does. I added a description
and applied both to my tree. Please remember the next time to add a
description to all patches.

Thanks,
Matthias

>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
> index d680b07..4cd6f7b 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
> @@ -7,6 +7,7 @@ Required properties:
>  - compatible: should be one of:
>         "mediatek,mt8135-sysirq"
>         "mediatek,mt8127-sysirq"
> +       "mediatek,mt6592-sysirq"
>         "mediatek,mt6589-sysirq"
>         "mediatek,mt6582-sysirq"
>         "mediatek,mt6577-sysirq"
> --
> 1.9.1
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
