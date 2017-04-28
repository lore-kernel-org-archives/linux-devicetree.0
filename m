From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: fix uninitialized variable warning for overlay
 test
Date: Fri, 28 Apr 2017 08:46:21 -0700
Message-ID: <590363CD.7000404@gmail.com>
References: <20170428094429.2396195-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170428094429.2396195-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/28/17 02:44, Arnd Bergmann wrote:
> gcc warns that an empty device tree would cause undefined behavior:
> 
> drivers/of/unittest.c: In function 'of_unittest':
> drivers/of/unittest.c:2199:25: warning: 'last_sibling' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> This adds an initialization of the variable to zero, which we handle
> correctly.
> 
> Fixes: 81d0848fc8d2 ("of: Add unit tests for applying overlays")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/of/unittest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 12597ff8cfb0..6b8f3e6aa43c 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2192,7 +2192,7 @@ static __init void of_unittest_overlay_high_level(void)
>  
>  	mutex_lock(&of_mutex);
>  
> -	for (np = of_root->child; np; np = np->sibling)
> +	for (last_sibling = np = of_root->child; np; np = np->sibling)
>  		last_sibling = np;
>  
>  	if (last_sibling)
> 

Thanks Arnd!  Linux-next also reported this and I sent Rob a different
patch for it yesterday.

Rob, I am fine with either Arnd's patch or mine, they both fix the
problem.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
