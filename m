From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] of/overlay: Directly include idr.h
Date: Tue, 17 Feb 2015 11:15:28 +0200
Message-ID: <56CDBF0A-4E66-406D-9086-7C0128FEC6C7@konsulko.com>
References: <1424140618-22987-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424140618-22987-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

> On Feb 17, 2015, at 04:36 , Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> 
> The overlay code uses IDRs but does not explicitly include the header
> providing the interface, instead relying on an implicit inclusion. Make
> the dependency implict to avoid potential future build issues if the
> implicit inclusion goes away.
> 
> Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> drivers/of/overlay.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 352b4f28f82c..406664801cb5 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -19,6 +19,7 @@
> #include <linux/string.h>
> #include <linux/slab.h>
> #include <linux/err.h>
> +#include <linux/idr.h>
> 
> #include "of_private.h"
> 
> -- 
> 2.1.4
> 

Nice catch.

Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
