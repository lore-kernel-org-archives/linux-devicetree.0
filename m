From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v17 4/7] fbmon: add videomode helpers
Date: Fri, 01 Feb 2013 09:33:08 +0000 (GMT)
Message-ID: <7561610.793881359711187327.JavaMail.weblogic@epml02>
Reply-To: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
MIME-version: 1.0
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "Mohammed, Afzal" <afzal-l0cyMroinI0@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Florian Tobias Schandinat <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Guennady Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, January 25, 2013 6:02 PM, Steffen Trumtrar wrote
> 
> Add a function to convert from the generic videomode to a fb_videomode.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Acked-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Tested-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Tested-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Tested-by: Afzal Mohammed <Afzal-l0cyMroinI0@public.gmane.org>
> Tested-by: Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Leela Krishna Amudala <leelakrishna.a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/video/fbmon.c |   52 +++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fb.h    |    4 ++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/video/fbmon.c b/drivers/video/fbmon.c
> index cef6557..17ce135 100644
> --- a/drivers/video/fbmon.c
> +++ b/drivers/video/fbmon.c
> @@ -31,6 +31,7 @@
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <video/edid.h>
> +#include <video/videomode.h>
>  #ifdef CONFIG_PPC_OF
>  #include <asm/prom.h>
>  #include <asm/pci-bridge.h>
> @@ -1373,6 +1374,57 @@ int fb_get_mode(int flags, u32 val, struct fb_var_screeninfo *var, struct fb_inf
>  	kfree(timings);
>  	return err;
>  }
> +
> +#if IS_ENABLED(CONFIG_VIDEOMODE)
> +int fb_videomode_from_videomode(const struct videomode *vm,
> +				struct fb_videomode *fbmode)
> +{
> +	unsigned int htotal, vtotal;
> +
> +	fbmode->xres = vm->hactive;
> +	fbmode->left_margin = vm->hback_porch;
> +	fbmode->right_margin = vm->hfront_porch;
> +	fbmode->hsync_len = vm->hsync_len;
> +
> +	fbmode->yres = vm->vactive;
> +	fbmode->upper_margin = vm->vback_porch;
> +	fbmode->lower_margin = vm->vfront_porch;
> +	fbmode->vsync_len = vm->vsync_len;
> +
> +	/* prevent division by zero in KHZ2PICOS macro */
> +	fbmode->pixclock = vm->pixelclock ?
> +			KHZ2PICOS(vm->pixelclock / 1000) : 0;
> +
> +	fbmode->sync = 0;
> +	fbmode->vmode = 0;
> +	if (vm->dmt_flags & VESA_DMT_HSYNC_HIGH)
> +		fbmode->sync |= FB_SYNC_HOR_HIGH_ACT;
> +	if (vm->dmt_flags & VESA_DMT_HSYNC_HIGH)

Hi Steffen Trumtrar,

Um, it seems to be a type. 'H'SYNC -> 'V'SYNC
Thus, it would be changed as below:

    VESA_DMT_HSYNC_HIGH -> VESA_DMT_VSYNC_HIGH


Best regards,
Jingoo Han

> +		fbmode->sync |= FB_SYNC_VERT_HIGH_ACT;
> +	if (vm->data_flags & DISPLAY_FLAGS_INTERLACED)
> +		fbmode->vmode |= FB_VMODE_INTERLACED;
> +	if (vm->data_flags & DISPLAY_FLAGS_DOUBLESCAN)
> +		fbmode->vmode |= FB_VMODE_DOUBLE;
> +	fbmode->flag = 0;
> +
> +	htotal = vm->hactive + vm->hfront_porch + vm->hback_porch +
> +		 vm->hsync_len;
> +	vtotal = vm->vactive + vm->vfront_porch + vm->vback_porch +
> +		 vm->vsync_len;
> +	/* prevent division by zero */
> +	if (htotal && vtotal) {
> +		fbmode->refresh = vm->pixelclock / (htotal * vtotal);
> +	/* a mode must have htotal and vtotal != 0 or it is invalid */
> +	} else {
> +		fbmode->refresh = 0;
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fb_videomode_from_videomode);
> +#endif
> +
>  #else
>  int fb_parse_edid(unsigned char *edid, struct fb_var_screeninfo *var)
>  {
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index c7a9571..100a176 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -19,6 +19,7 @@ struct vm_area_struct;
>  struct fb_info;
>  struct device;
>  struct file;
> +struct videomode;
> 
>  /* Definitions below are used in the parsed monitor specs */
>  #define FB_DPMS_ACTIVE_OFF	1
> @@ -714,6 +715,9 @@ extern void fb_destroy_modedb(struct fb_videomode *modedb);
>  extern int fb_find_mode_cvt(struct fb_videomode *mode, int margins, int rb);
>  extern unsigned char *fb_ddc_read(struct i2c_adapter *adapter);
> 
> +extern int fb_videomode_from_videomode(const struct videomode *vm,
> +				       struct fb_videomode *fbmode);
> +
>  /* drivers/video/modedb.c */
>  #define VESA_MODEDB_SIZE 34
>  extern void fb_var_to_videomode(struct fb_videomode *mode,
> --
> 1.7.10.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
