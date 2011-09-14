From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] isp1760: Make probing via device tree
	non-powerpc-specific
Date: Wed, 14 Sep 2011 09:43:32 -0600
Message-ID: <20110914154332.GA3134@ponder.secretlab.ca>
References: <1316008633-31009-1-git-send-email-dave.martin@linaro.org>
	<1316008633-31009-2-git-send-email-dave.martin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316008633-31009-2-git-send-email-dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arvid Brodin <arvid.brodin-AM1FMPraTHU@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2011 at 02:57:12PM +0100, Dave Martin wrote:
> This patch just replaces the (presumably historical) CONFIG_OF_PPC
> 
> Signed-off-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/usb/host/isp1760-if.c |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
> index 7ee3005..69ee32c 100644
> --- a/drivers/usb/host/isp1760-if.c
> +++ b/drivers/usb/host/isp1760-if.c
> @@ -17,16 +17,18 @@
>  
>  #include "isp1760-hcd.h"
>  
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF

This #ifdef can just be dropped entirely.  linux/of*.h is always safe to
include now.

>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
>  #endif
>  
>  #ifdef CONFIG_PCI
>  #include <linux/pci.h>
>  #endif
>  
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  static int of_isp1760_probe(struct platform_device *dev)
>  {
>  	struct usb_hcd *hcd;
> @@ -396,7 +398,7 @@ static int __init isp1760_init(void)
>  	ret = platform_driver_register(&isp1760_plat_driver);
>  	if (!ret)
>  		any_ret = 0;
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  	ret = platform_driver_register(&isp1760_of_driver);
>  	if (!ret)
>  		any_ret = 0;

This should really be changed.  It used to be that of_platform_driver
and platform_driver were different things, but that is no longer the
case.  A single platform_driver should handle both the DT and non-DT
use cases.

That said, I don't have any objection to this patch being merged.  I'd
just be happier if it was cleaned up properly.

g.
