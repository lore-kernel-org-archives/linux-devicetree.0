From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drivers/of: Fix depth for sub-tree blob in
 unflatten_dt_nodes()
Date: Wed, 8 Jun 2016 11:53:26 -0400
Message-ID: <828431f1-5b74-8aef-c229-7b7469e685ba@nvidia.com>
References: <1465368654-24170-1-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465368654-24170-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6/8/2016 2:50 AM, Gavin Shan wrote:
> The function is unflattening device sub-tree blob if @dad passed to
> the function is valid. Currently, this functionality is used by PPC
> PowerNV PCI hotplug driver only. There are possibly multiple nodes
> in the first level of depth, fdt_next_node() bails immediately when
> @depth becomes negative before the second device node can be probed
> successfully. It leads to the device nodes except the first one won't
> be unflattened successfully.
> 
> This fixes the issue by setting the initial depth (@inital_depth) to
> 1 when this function is called to unflatten device sub-tree blob. No
> logic changes when this function is used to unflatten non-sub-tree
> blob.
> 
> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Fixes: 78c44d910 ("drivers/of: Fix depth when unflattening devicetree")
> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/of/fdt.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 14f2f8c..9d70316 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -395,7 +395,7 @@ static int unflatten_dt_nodes(const void *blob,
>  			      struct device_node **nodepp)
>  {
>  	struct device_node *root;
> -	int offset = 0, depth = 0;
> +	int offset = 0, depth = 0, initial_depth = 0;
>  #define FDT_MAX_DEPTH	64
>  	unsigned int fpsizes[FDT_MAX_DEPTH];
>  	struct device_node *nps[FDT_MAX_DEPTH];
> @@ -408,8 +408,19 @@ static int unflatten_dt_nodes(const void *blob,
>  	root = dad;
>  	fpsizes[depth] = dad ? strlen(of_node_full_name(dad)) : 0;
>  	nps[depth] = dad;
> +
> +	/*
> +	 * We're unflattening device sub-tree if @dad is valid. There are
> +	 * possibly multiple nodes in the first level of depth. We need
> +	 * set @depth to 1 to make fdt_next_node() happy as it bails
> +	 * immediately when negative @depth is found. Otherwise, the device
> +	 * nodes except the first one won't be unflattened successfully.
> +	 */
> +	if (dad)
> +		depth = initial_depth = 1;
> +
>  	for (offset = 0;
> -	     offset >= 0 && depth >= 0;
> +	     offset >= 0 && depth >= initial_depth;
>  	     offset = fdt_next_node(blob, offset, &depth)) {
>  		if (WARN_ON_ONCE(depth >= FDT_MAX_DEPTH))
>  			continue;
> 

I tested this and it seems to be working fine for me.

Tested-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-rhyland

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
