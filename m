From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFC 0/3] of/overlay: Update aliases when added or
 removed
Date: Tue, 30 Jun 2015 18:24:39 +0100
Message-ID: <20150630172439.91ACAC4053E@trevor.secretlab.ca>
References: <1435675876-2159-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435675876-2159-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jun 2015 16:51:13 +0200
, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
 wrote:
> 	Hi,
> 
> Currently the list of aliases is not updated when a DT overlay that adds
> an alias is loaded or unloaded. This break drivers (e.g. serial) that
> rely on of_alias_get_id(). This RFC patch series fixes that.
> 
> This is definitely not a final solution to be applied, as (1) it doesn't
> fix all possible cases, and as (2) there's an unresolved issue w.r.t.
> object lifetime. More about this in the last patch.
> 
> But it's Good Enough For My Use Case(TM), which is enabling/disabling
> serial ports on expansion headers by (un)loading DTBOs.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   [RFC] of: Extract of_alias_create()
>   [RFC] of: Add of_alias_destroy()
>   [RFC] of/dynamic: Update list of aliases on aliases changes

Looks good to me. I've made comments on patch 3. Also, you'll need to
include unittests before I can merge it.

g.

> 
>  drivers/of/base.c    | 72 +++++++++++++++++++++++++++++++++-------------------
>  drivers/of/dynamic.c | 24 ++++++++++++++++++
>  include/linux/of.h   |  3 +++
>  3 files changed, 73 insertions(+), 26 deletions(-)
> 
> -- 
> 1.9.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
