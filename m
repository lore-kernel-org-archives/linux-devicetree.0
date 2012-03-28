From: Tom Warren <TWarren@nvidia.com>
Subject: Re: [PATCH 1/2] fdt: Avoid early panic() when there is no
 FDT present
Date: Wed, 28 Mar 2012 13:32:00 -0700
Message-ID: <5FBF8E85CA34454794F0F7ECBA79798F37977BF634@HQMAIL04.nvidia.com>
References: <1332965305-21151-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1332965305-21151-1-git-send-email-sjg@chromium.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Jerry Van Baren <vanbaren@cideas.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Simon,

> -----Original Message-----
> From: Simon Glass [mailto:sjg@chromium.org]
> Sent: Wednesday, March 28, 2012 1:08 PM
> To: U-Boot Mailing List
> Cc: Tom Warren; Stephen Warren; Albert Aribaud; Simon Glass; Jerry Van
> Baren; Devicetree Discuss
> Subject: [PATCH 1/2] fdt: Avoid early panic() when there is no FDT present
> 
> CONFIG_OF_CONTROL requires a valid device tree. However, we cannot call
> panic() before the console is set up since the message does not appear, and
> we get a silent failure.
> 
> Remove the panic from fdtdec_check_fdt() and provide a new function to
> prepare the fdt for use. This will be called after the console is ready.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

Tested-by: Tom Warren <twarren@nvidia.com>
Acked-by: Tom Warren <twarren@nvidia.com>

> ---
>  include/fdtdec.h |   17 +++++++++++++++--
>  lib/fdtdec.c     |   24 +++++++++++++++++++-----
>  2 files changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/include/fdtdec.h b/include/fdtdec.h index 766e0bd..d45acbe
> 100644
> --- a/include/fdtdec.h
> +++ b/include/fdtdec.h
> @@ -157,8 +157,21 @@ s32 fdtdec_get_int(const void *blob, int node, const
> char *prop_name,  int fdtdec_get_is_enabled(const void *blob, int node);
> 
>  /**
> - * Checks whether we have a valid fdt available to control U-Boot, and
> panic
> - * if not.
> + * Make sure we have a valid fdt available to control U-Boot.
> + *
> + * If not, a message is printed to the console if the console is ready.
> + *
> + * @return 0 if all ok, -1 if not
> + */
> +int fdtdec_prepare_fdt(void);
> +
> +/**
> + * Checks that we have a valid fdt available to control U-Boot.
> +
> + * However, if not then for the moment nothing is done, since this
> + function
> + * is called too early to panic().
> + *
> + * @returns 0
>   */
>  int fdtdec_check_fdt(void);
> 
> diff --git a/lib/fdtdec.c b/lib/fdtdec.c index 9241d13..0fb6d17 100644
> --- a/lib/fdtdec.c
> +++ b/lib/fdtdec.c
> @@ -276,17 +276,31 @@ int fdtdec_add_aliases_for_id(const void *blob, const
> char *name,
>  	return num_found;
>  }
> 
> +int fdtdec_check_fdt(void)
> +{
> +	/*
> +	 * We must have an FDT, but we cannot panic() yet since the console
> +	 * is not ready. So for now, just assert(). Boards which need an
> early
> +	 * FDT (prior to console ready) will need to make their own
> +	 * arrangements and do their own checks.
> +	 */
> +	assert(!fdtdec_prepare_fdt());
> +	return 0;
> +}
> +
>  /*
>   * This function is a little odd in that it accesses global data. At some
>   * point if the architecture board.c files merge this will make more sense.
>   * Even now, it is common code.
>   */
> -int fdtdec_check_fdt(void)
> +int fdtdec_prepare_fdt(void)
>  {
> -	/* We must have an fdt */
> -	if (((uintptr_t)gd->fdt_blob & 3) || fdt_check_header(gd->fdt_blob))
> -		panic("No valid fdt found - please append one to U-Boot\n"
> -			"binary or define CONFIG_OF_EMBED\n");
> +	if (((uintptr_t)gd->fdt_blob & 3) || fdt_check_header(gd->fdt_blob))
> {
> +		printf("No valid FDT found - please append one to U-Boot "
> +			"binary, use u-boot-dtb.bin or define "
> +			"CONFIG_OF_EMBED\n");
> +		return -1;
> +	}
>  	return 0;
>  }
> 
> --
> 1.7.7.3
-- 
nvpublic
