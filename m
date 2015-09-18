From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 16/16] phy: phy-core: fix initcall level
Date: Fri, 18 Sep 2015 11:46:13 +0530
Message-ID: <55FBAC2D.1020301@ti.com>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de> <1440592108-3740-17-git-send-email-holler@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440592108-3740-17-git-send-email-holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russel King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 26 August 2015 05:58 PM, Alexander Holler wrote:
> The phy-core has to be initialized before other dependent usb-drivers,
> otherwise a crash might occur.
> 
> Currently phy_core_init() is called in the initcall-level device, which is
> the same level where most usb-drivers will end up. By luck this seemed to
> have been called most of the time before other usb-drivers without having
> been explicitly enforced. But if phy_core_init() is not called before a
> dependent driver, a null-pointer exception might occur (e.g. because the
> phy device class isn't registered).

Did you actually face a problem? IIUC the modules get loaded based on
the drivers/Makefile order (unless the other modules are in a different
initcall table).

IMHO the fix should be in the module that caused the crash. Change it to
use module_init?

Thanks
Kishon

> 
> To fix this, phy_core_init() is moved to the initcall-level fs (right
> before the standard initcall level device).
> 
> Signed-off-by: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
> ---
>  drivers/phy/phy-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index fc48fac..4945029 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -930,7 +930,7 @@ static int __init phy_core_init(void)
>  
>  	return 0;
>  }
> -module_init(phy_core_init);
> +fs_initcall_sync(phy_core_init);
>  
>  static void __exit phy_core_exit(void)
>  {
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
