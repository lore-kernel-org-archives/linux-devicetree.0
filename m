From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8] mtd: nand: add tango NAND flash controller support
Date: Wed, 30 Nov 2016 17:44:59 -0800
Message-ID: <20161201014459.GK77253@google.com>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B37.5090100@sigmadesigns.com>
 <580F8407.5070706@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <580F8407.5070706-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: linux-mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Oct 25, 2016 at 06:10:47PM +0200, Marc Gonzalez wrote:
> This driver supports the NAND Flash controller embedded in recent
> Tango chips, such as SMP8758 and SMP8759.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
> ---

...

> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> new file mode 100644
> index 000000000000..74e39a92771c
> --- /dev/null
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -0,0 +1,654 @@

This driver is being introduced with no copyright or license header. At
least it has an appropriate MODULE_LICENSE().

Can the original author(s) please provide a follow-up patch with one?
Thanks.

> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>

...

> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Sigma Designs");
> +MODULE_DESCRIPTION("Tango4 NAND Flash controller driver");

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
