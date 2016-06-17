From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCHv3 6/7] EDAC, altera: Add Arria10 Ethernet EDAC support
Date: Fri, 17 Jun 2016 19:29:28 +0200
Message-ID: <20160617172928.GK3912@pd.tnic>
References: <1465852752-11018-1-git-send-email-tthayer@opensource.altera.com>
 <1465852752-11018-7-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465852752-11018-7-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 04:19:11PM -0500, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add Altera Arria10 Ethernet FIFO memory EDAC support. Update
> to support a common compatibility string for all ethernet
> FIFOs in the DT.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v2  Remove (void *) cast from altr_edac_device_of_match[]
>     Addition of panic flag to ethernet private data.
> v3  Use common compatiblity string.
>     Simplify socfpga_init_ethernet_ecc().
> ---
>  drivers/edac/Kconfig       |    7 +++++++
>  drivers/edac/altera_edac.c |   38 ++++++++++++++++++++++++++++++++++++--
>  drivers/edac/altera_edac.h |    3 +++
>  3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 6ca7474..d0c1dab 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -391,6 +391,13 @@ config EDAC_ALTERA_OCRAM
>  	  Support for error detection and correction on the
>  	  Altera On-Chip RAM Memory for Altera SoCs.
>  
> +config EDAC_ALTERA_ETHERNET
> +	bool "Altera Ethernet FIFO ECC"
> +	depends on EDAC_ALTERA=y
> +	help
> +	  Support for error detection and correction on the
> +	  Altera Ethernet FIFO Memory for Altera SoCs.
> +
>  config EDAC_SYNOPSYS
>  	tristate "Synopsys DDR Memory Controller"
>  	depends on EDAC_MM_EDAC && ARCH_ZYNQ
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index f27bb29..14f99ae 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1260,6 +1260,34 @@ const struct edac_device_prv_data a10_l2ecc_data = {
>  
>  #endif	/* CONFIG_EDAC_ALTERA_L2C */
>  
> +/********************* Ethernet Device Functions ********************/
> +
> +#ifdef CONFIG_EDAC_ALTERA_ETHERNET
> +
> +const struct edac_device_prv_data a10_enet0rxecc_data = {

This needs to be "static const" and then you don't need to init panic to
false.

Your other edac_device_prv_data things are not static too, please
convert them in a separate patch too.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
