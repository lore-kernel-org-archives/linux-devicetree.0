From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 28/54] MAINTAINERS: Add file patterns for media device
 tree bindings
Date: Mon, 23 May 2016 09:29:51 -0400
Message-ID: <CABxcv=kuQa_A03bdkgBjHF3XyOWY1C6y4j_k9z2CRVSf5gVeXw@mail.gmail.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
	<1463907991-7916-29-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463907991-7916-29-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Geert,

On Sun, May 22, 2016 at 5:06 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7acb65bb2590a321..c230cd9ec8aefe45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7376,6 +7376,7 @@ W:        https://linuxtv.org
>  Q:     http://patchwork.kernel.org/project/linux-media/list/
>  T:     git git://linuxtv.org/media_tree.git
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/media/
>  F:     Documentation/dvb/
>  F:     Documentation/video4linux/
>  F:     Documentation/DocBook/media/

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
