From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 4/5] usb: phy: load usb phy earlier
Date: Tue, 10 Feb 2015 15:04:28 +0800
Message-ID: <20150210070424.GC32709@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch does not belong to phy, so, doesn't need to
add phy in subject, meanwhile, please add GregKH as TO list,
he is the right one to queue this patch.

Reply-To: 
In-Reply-To: <1423554627-694-5-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

On Tue, Feb 10, 2015 at 03:50:26PM +0800, Zhangfei Gao wrote:
> Since phy is definitely used in usb controller, load the phy
> earlier to make boot time shorter.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index 2f1e2aa..d8926c6 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -5,6 +5,7 @@
>  # Object files in subdirectories
>  
>  obj-$(CONFIG_USB)		+= core/
> +obj-$(CONFIG_USB_SUPPORT)	+= phy/
>  
>  obj-$(CONFIG_USB_DWC3)		+= dwc3/
>  obj-$(CONFIG_USB_DWC2)		+= dwc2/
> @@ -48,7 +49,6 @@ obj-$(CONFIG_USB_MICROTEK)	+= image/
>  obj-$(CONFIG_USB_SERIAL)	+= serial/
>  
>  obj-$(CONFIG_USB)		+= misc/
> -obj-$(CONFIG_USB_SUPPORT)	+= phy/
>  obj-$(CONFIG_EARLY_PRINTK_DBGP)	+= early/
>  
>  obj-$(CONFIG_USB_ATM)		+= atm/
> -- 
> 1.9.1
> 

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
