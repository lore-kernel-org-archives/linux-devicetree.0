From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/3] of/flattree: Fix crash when device tree absent
Date: Mon, 19 Jul 2010 10:04:42 +1000
Message-ID: <1279497882.10390.1753.camel@pasglop>
References: <20100714233130.21887.73872.stgit@angua>
	<20100714233136.21887.27766.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100714233136.21887.27766.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2010-07-14 at 17:31 -0600, Grant Likely wrote:
> This patch fixes the condition where device tree support is compiled
> in, but no device tree was proved by firmware.  It makes
> of_platform_bus_probe() explicitly check for a NULL device tree
> pointer, and adds an error message if the device tree was unable
> to be flattened.
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Not sure about the message..

> ---
>  drivers/of/fdt.c      |    2 ++
>  drivers/of/platform.c |    2 ++
>  2 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index d61fda8..66401bc 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -94,6 +94,8 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
>  			break;
>  	} while (1);
>  
> +	if (rc)
> +		pr_err("Failed to unflatten device tree blob.  rc=%i\n", rc);
>  	return rc;
>  }

This is of_scan_flat_dt() ... might be better using something like

"Failed to scan the flat device-tree (error %d)". Might also want to
rate limit it to 1.

> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index f0ca906..9bc6999 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -674,6 +674,8 @@ int of_platform_bus_probe(struct device_node *root,
>  		root = of_find_node_by_path("/");
>  	else
>  		of_node_get(root);
> +	if (root == NULL)
> +		return -EINVAL;
>  
>  	pr_debug("of_platform_bus_probe()\n");
>  	pr_debug(" starting at: %s\n", root->full_name);

Cheers,
Ben.
