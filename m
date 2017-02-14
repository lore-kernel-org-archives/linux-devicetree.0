From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] devicetree: bindings: revise compatible string of
 sprd uart
Date: Tue, 14 Feb 2017 11:02:59 -0600
Message-ID: <CAL_JsqKNfYSug4vd5uWXnxn-_z0e-Nk9TYkktudk+F1VBYcm8g@mail.gmail.com>
References: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com> <1487063952-7113-4-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487063952-7113-4-git-send-email-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?UTF-8?B?T3Jzb24gWmhhaSjnv5/kuqwp?= <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 14, 2017 at 3:19 AM, Chunyan Zhang
<chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
> This patch revise the compatible string of sprd uart to "sc-uart"
> since this driver is not only for SC9836, but for all Spreadtrum
> SoCs so far.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/serial/sprd-uart.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/serial/sprd-uart.txt b/Documentation/devicetree/bindings/serial/sprd-uart.txt
> index 2aff0f2..9b0ad52 100644
> --- a/Documentation/devicetree/bindings/serial/sprd-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/sprd-uart.txt
> @@ -1,7 +1,7 @@
>  * Spreadtrum serial UART
>
>  Required properties:
> -- compatible: must be "sprd,sc9836-uart"
> +- compatible: must be "sprd,sc-uart"

You can't just change compatible strings.

You don't need a generic-ish compatible if other SoCs have "the same"
uart. Then you just do: '"sprd,sc<new soc>-uart", "sprd,sc9836-uart"'
in the DT. The existing driver will work matching on sprd,sc9836-uart
and if you ever find some difference in the uarts you have the more
specific compatible string to handle that.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
