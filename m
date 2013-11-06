From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/13] dma: ste_dma40: Expand DT binding to accept
 'high-priority channel' flag
Date: Wed, 6 Nov 2013 12:40:17 +0100
Message-ID: <CACRpkdaVPy8yuhYKohL7ewnmT5y7QrQ7ig2qf4t49YZ-+noDvQ@mail.gmail.com>
References: <1383732985-18928-1-git-send-email-lee.jones@linaro.org>
	<1383732985-18928-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383732985-18928-2-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 6, 2013 at 11:16 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> --- a/Documentation/devicetree/bindings/dma/ste-dma40.txt
> +++ b/Documentation/devicetree/bindings/dma/ste-dma40.txt
> @@ -50,6 +50,9 @@ Each dmas request consists of 4 cells:
>          0x00000008: Use fixed channel:
>                  Use automatic channel selection when unset
>                  Use DMA request line number when set
> +        0x00000010: Set channel as high priority:
> +                Normal priority when unset
> +                High priority when set

We should probably switch these magic numbers to #defines
but it's another subject so
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
