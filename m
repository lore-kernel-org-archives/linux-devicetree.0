From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: bindings: add optional fifo size
 property to AMBA UARTs
Date: Wed, 18 Feb 2015 15:17:31 -0600
Message-ID: <CAL_JsqKBxmEUCYz4Pw6wbBTvU8p7Fo5O05tLUi9SHoiAzdVRgA@mail.gmail.com>
References: <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1424290069-8760-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424290069-8760-2-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 2:07 PM, Jorge Ramirez-Ortiz
<jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/serial/pl011.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/pl011.txt b/Documentation/devicetree/bindings/serial/pl011.txt
> index 5d2e840..05d1adb 100644
> --- a/Documentation/devicetree/bindings/serial/pl011.txt
> +++ b/Documentation/devicetree/bindings/serial/pl011.txt
> @@ -13,5 +13,6 @@ Optional properties:
>  - dmas:           When present, may have one or two dma channels.
>            The first one must be named "rx", the second one
>            must be named "tx".
> +- fifo-size:  When present, must have the fifo size.
>
>  See also bindings/arm/primecell.txt
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
