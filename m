From: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 28/54] MAINTAINERS: Add file patterns for media device
 tree bindings
Date: Sun, 10 Jul 2016 12:27:35 -0300
Message-ID: <20160710122735.240b07fc@recife.lan>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
	<1463907991-7916-29-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463907991-7916-29-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Em Sun, 22 May 2016 11:06:05 +0200
Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> escreveu:

> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.

I'm assuming that this patch will go via DT git tree, so:
> 
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Acked-by: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>

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
> @@ -7376,6 +7376,7 @@ W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/
>  F:	Documentation/dvb/
>  F:	Documentation/video4linux/
>  F:	Documentation/DocBook/media/


-- 
Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
