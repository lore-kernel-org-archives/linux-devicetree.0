From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/5 v10] usb: musb: core: added missing const qualifier
 to musb_hdrc_platform_data::config
Date: Fri, 11 Mar 2016 09:54:19 -0600
Message-ID: <20160311155419.GD20204@uda0271908>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
 <1457684989-13318-3-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457684989-13318-3-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Mar 11, 2016 at 09:29:47AM +0100, Petr Kulhavy wrote:
> The musb_hdrc_platform_data::config was defined as a non-const pointer.
> However some drivers (e.g. the ux500) set up this pointer to point to a
> static structure, which is potentially dangerous. Since the musb core
> uses the pointer in a read-only manner the const qualifier was added to
> protect the content of the config.
> 
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
> Acked-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>

It is okay now, but I don't remember I've given my Signed-off-by to this
patch yet.

Regards,
-Bin.

> ---
> v5: <initial>
> 
> v6:
>  - whitespace formatting corrected
> 
> v7: <no change>
> v8: <no change>
> v9: <no change>
> v10: <no change>
> 
>  drivers/usb/musb/musb_core.c | 2 +-
>  drivers/usb/musb/musb_core.h | 2 +-
>  include/linux/usb/musb.h     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index 6a2d6d3..b0be1a9 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -1920,7 +1920,7 @@ static void musb_recover_from_babble(struct musb *musb)
>   */
>  
>  static struct musb *allocate_instance(struct device *dev,
> -		struct musb_hdrc_config *config, void __iomem *mbase)
> +		const struct musb_hdrc_config *config, void __iomem *mbase)
>  {
>  	struct musb		*musb;
>  	struct musb_hw_ep	*ep;
> diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
> index 3f7a325..a062185 100644
> --- a/drivers/usb/musb/musb_core.h
> +++ b/drivers/usb/musb/musb_core.h
> @@ -438,7 +438,7 @@ struct musb {
>  	 */
>  	unsigned                double_buffer_not_ok:1;
>  
> -	struct musb_hdrc_config	*config;
> +	const struct musb_hdrc_config *config;
>  
>  	int			xceiv_old_state;
>  #ifdef CONFIG_DEBUG_FS
> diff --git a/include/linux/usb/musb.h b/include/linux/usb/musb.h
> index 96ddfb7..0b3da40 100644
> --- a/include/linux/usb/musb.h
> +++ b/include/linux/usb/musb.h
> @@ -124,7 +124,7 @@ struct musb_hdrc_platform_data {
>  	int		(*set_power)(int state);
>  
>  	/* MUSB configuration-specific details */
> -	struct musb_hdrc_config	*config;
> +	const struct musb_hdrc_config *config;
>  
>  	/* Architecture specific board data	*/
>  	void		*board_data;
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
