From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] of: Explicitly include linux/types.h in of_graph.h
Date: Thu, 26 Mar 2015 18:08:38 +0100
Message-ID: <1427389718.3599.22.camel@pengutronix.de>
References: <1427388475-29096-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427388475-29096-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 26.03.2015, 09:47 -0700 schrieb Mark Brown:
> In current -next of_graph.h fails to build due to it relying on
> linux/types.h without explicitly including it:
> 
> ../include/linux/of_graph.h:43:71: error: unknown type name 'u32'
> 
> caused by bfe446e37c4e (of: Add of_graph_get_port_by_id function).  Add
> an explicit inclusion to fix this.
> 
> Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/of_graph.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 3c1c95a39e0c..7bc92e050608 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -14,6 +14,8 @@
>  #ifndef __LINUX_OF_GRAPH_H
>  #define __LINUX_OF_GRAPH_H
>  
> +#include <linux/types.h>
> +
>  /**
>   * struct of_endpoint - the OF graph endpoint data structure
>   * @port: identifier (value of reg property) of a port this endpoint belongs to

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Thanks!
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
