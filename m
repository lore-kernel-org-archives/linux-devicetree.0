From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/5] simplefb: formalize pseudo palette handling
Date: Tue, 11 Nov 2014 16:34:08 +0000
Message-ID: <20141111163408.9C364C416AF@trevor.secretlab.ca>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
	<1413996311-4287-4-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCJP567ORICBBBHVRCRQKGQEIJQ6PNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1413996311-4287-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 22 Oct 2014 18:45:09 +0200
, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 wrote:
> From: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
> 

Patch description? Write a proper changelog before merging please.
Describe why the change is necessary and what was done. You need to give
future readers some information about this patch. Heck, you're listed in
MAINTAINERS, you should be *enforcing* proper changelogs.

The code looks fine though.

Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> Signed-off-by: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: drop unnecessary void * cast]
> Reviewed-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Reviewed-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/video/fbdev/simplefb.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 210f3a0..ec112c1 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -41,6 +41,8 @@ static struct fb_var_screeninfo simplefb_var = {
>  	.vmode		= FB_VMODE_NONINTERLACED,
>  };
>  
> +#define PSEUDO_PALETTE_SIZE 16
> +
>  static int simplefb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
>  			      u_int transp, struct fb_info *info)
>  {
> @@ -50,7 +52,7 @@ static int simplefb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
>  	u32 cb = blue >> (16 - info->var.blue.length);
>  	u32 value;
>  
> -	if (regno >= 16)
> +	if (regno >= PSEUDO_PALETTE_SIZE)
>  		return -EINVAL;
>  
>  	value = (cr << info->var.red.offset) |
> @@ -163,11 +165,16 @@ static int simplefb_parse_pd(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +struct simplefb_par {
> +	u32 palette[PSEUDO_PALETTE_SIZE];
> +};
> +
>  static int simplefb_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  	struct simplefb_params params;
>  	struct fb_info *info;
> +	struct simplefb_par *par;
>  	struct resource *mem;
>  
>  	if (fb_get_options("simplefb", NULL))
> @@ -188,11 +195,13 @@ static int simplefb_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	info = framebuffer_alloc(sizeof(u32) * 16, &pdev->dev);
> +	info = framebuffer_alloc(sizeof(struct simplefb_par), &pdev->dev);
>  	if (!info)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, info);
>  
> +	par = info->par;
> +
>  	info->fix = simplefb_fix;
>  	info->fix.smem_start = mem->start;
>  	info->fix.smem_len = resource_size(mem);
> @@ -225,7 +234,7 @@ static int simplefb_probe(struct platform_device *pdev)
>  		framebuffer_release(info);
>  		return -ENODEV;
>  	}
> -	info->pseudo_palette = (void *)(info + 1);
> +	info->pseudo_palette = par->palette;
>  
>  	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n",
>  			     info->fix.smem_start, info->fix.smem_len,
> -- 
> 2.1.0
> 
