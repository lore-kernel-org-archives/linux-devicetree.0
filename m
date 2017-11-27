From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] of: overlay locking fixes
Date: Mon, 27 Nov 2017 12:49:22 -0500
Message-ID: <0b416bdd-7f3b-38cf-ddd5-a3c14804dcb0@gmail.com>
References: <1511793987-315-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511793987-315-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/27/17 09:46, Geert Uytterhoeven wrote:
> 	Hi Pantelis, Rob, Frank,
> 
> Here are two locking fixes for OF overlays, found by code inspection.
> 
> They were compile-tested only, as I'm still working on getting "real"
> (configfs) overlays working again in v4.15-rc1...
> 
> Geert Uytterhoeven (2):
>   of: overlay: Fix cleanup order in of_overlay_apply()
>   of: unittest: Remove bogus overlay mutex release from
>     overlay_data_add()
> 
>  drivers/of/overlay.c  | 6 +++---
>  drivers/of/unittest.c | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 

All patches:

Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
