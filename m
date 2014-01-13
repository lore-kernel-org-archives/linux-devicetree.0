From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] ARM: Fix incorrect FDT initrd parameter override
Date: Mon, 13 Jan 2014 10:28:51 -0500
Message-ID: <20140113152851.GF19878@titan.lakedaemon.net>
References: <0a923e$51mtvt@icp-osb-irony-out9.iinet.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0a923e$51mtvt-73Sy8+Y76rVS+6ppBSHQ0E7lPHS7TK7L7bdBIQen8uI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ben,

Thanks for the patch.  A few comments below.

On Sat, Jan 11, 2014 at 10:03:58AM +1000, klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org wrote:
> Commit 65939301acdb (arm: set initrd_start/initrd_end for fdt scan)

Thanks for including this.  We have a new tag we are using now to
incorporate this information to be included after your SoB.  I've added
it below.

> caused the FDT initrd_start and initrd_end to override the
> phys_initrd_start and phys_initrd_size set by the initrd= kernel
> parameter.  With this patch initrd_start and initrd_end will be
> overridden if phys_initrd_start and phys_initrd_size are set by the
> kernel initrd= parameter.
> 
> Signed-off-by: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Fixes: 65939301acdb (arm: set initrd_start/initrd_end for fdt scan)

This commit was only introduced in v3.13-rc1 so we shouldn't need the
stable tag.  Unless v3.13 drops before Russell gets a chance to merge
it.

> ---
>  arch/arm/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 1f7b19a..819c539 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -345,10 +345,11 @@ void __init arm_memblock_init(struct meminfo *mi,
>  #endif
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	/* FDT scan will populate initrd_start */
> -	if (initrd_start) {
> +	if (initrd_start && !phys_initrd_size) {
>  		phys_initrd_start = __virt_to_phys(initrd_start);
>  		phys_initrd_size = initrd_end - initrd_start;
>  	}
> +	initrd_start = initrd_end = 0;

This line shouldn't be necessary.  Both are reset in the following hunk
below your change:

if (phys_initrd_size) {
	memblock_reserve(phys_initrd_start, phys_initrd_size);

	/* Now convert initrd to virtual addresses */
	initrd_start = __phys_to_virt(phys_initrd_start);
	initrd_end = initrd_start + phys_initrd_size;
}

With the above line removed,

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

Please add this patch to Russell's patch tracker found at

http://www.arm.linux.org.uk/developer/patches/

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
