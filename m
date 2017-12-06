From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] of: overlay: Fix of_overlay_apply() error path
Date: Tue, 5 Dec 2017 21:40:33 -0500
Message-ID: <48dd6ac2-6481-4164-6051-ec9fd98490fb@gmail.com>
References: <1512487623-30450-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512487623-30450-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/05/17 10:27, Geert Uytterhoeven wrote:
> 	Hi Pantelis, Rob, Frank,
> 
> Here's a replacement for commit bd80e2555c5c9d45 ("of: overlay: Fix
> cleanup order in of_overlay_apply()"), which was applied by Rob, and
> dropped later.
> 
> The first patch fixes the memory leak reported by Colin.
> The second patch is a replacement for the bad dropped commit, and
> depends on the first patch for proper cleanup.
> 
> All OF unittests pass.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   of: overlay: Fix memory leak in of_overlay_apply() error path
>   of: overlay: Fix (un)locking in of_overlay_apply()
> 
>  drivers/of/overlay.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> 

Thank you, the code is much improved by these patches.

Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
