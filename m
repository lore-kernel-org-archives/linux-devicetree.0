From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: bindings: Document CompuLab vendor
Date: Thu, 22 Oct 2015 10:09:19 -0500
Message-ID: <CAL_JsqKS=+DM43uJimctueK_N6UXoxxQyjeR9Ej-f4O=zTpRuw@mail.gmail.com>
References: <1445424464-28281-1-git-send-email-uri.mashiach@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445424464-28281-1-git-send-email-uri.mashiach-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uri Mashiach <uri.mashiach-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, igor.grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 21, 2015 at 5:47 AM, Uri Mashiach
<uri.mashiach-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wrote:
> Add CompuLab Ltd. to the list of device tree vendor prefixes.
>
> CompuLab manufacturers ARM-based computer-on-module, system-on-module
> products, and miniature fanless-PCs.
>
> Acked-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> Signed-off-by: Uri Mashiach <uri.mashiach-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 82d2ac9..0f60dbd 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -51,6 +51,7 @@ cirrus        Cirrus Logic, Inc.
>  cloudengines   Cloud Engines, Inc.
>  cnm    Chips&Media, Inc.
>  cnxt   Conexant Systems, Inc.
> +compulab       CompuLab Ltd.
>  cortina        Cortina Systems, Inc.
>  cosmic Cosmic Circuits
>  crystalfontz   Crystalfontz America, Inc.
> --
> 2.6.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
