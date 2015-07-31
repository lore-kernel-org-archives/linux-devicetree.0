From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 5/5] mtd: ofpart: move ofpart partitions to a
 dedicated dt node
Date: Fri, 31 Jul 2015 18:06:14 +0200
Message-ID: <20150731180614.162852ee@bbrezillon>
References: <cover.1438340815.git.hramrach@gmail.com>
	<4982216b5cb602c71ade6810cecdb9535e0862fc.1438340815.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4982216b5cb602c71ade6810cecdb9535e0862fc.1438340815.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Thu, 30 Jul 2015 12:10:42 +0200
Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Parsing direct subnodes of a mtd device as partitions is unreliable
> since the mtd device is also part of its bus subsystem and can contain
> bus data in subnodes.
> 
> Move ofpart data to a subnode of its own so it is clear which data is
> part of the partition layout.
> 
> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mtd/ofpart.c | 56 +++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 40 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index aa26c32..2c28aaa 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -29,23 +29,33 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  				   struct mtd_partition **pparts,
>  				   struct mtd_part_parser_data *data)
>  {
> -	struct device_node *node;
> +	struct device_node *mtd_node;
> +	struct device_node *ofpart_node;
>  	const char *partname;
>  	struct device_node *pp;
>  	int nr_parts, i;
> +	bool dedicated = true;
>  
>  
>  	if (!data)
>  		return 0;
>  
> -	node = data->of_node;
> -	if (!node)
> +	mtd_node = data->of_node;
> +	if (!mtd_node)
>  		return 0;
>  
> +	ofpart_node = of_get_child_by_name(mtd_node, "ofpart");

Hm, you should use a more generic name, ofpart of the linux MTD
DT partition parser, but another operating system might decide to name
it otherwise. I think "partitions" is more appropriate. 

> +	if (!ofpart_node) {
> +		pr_warn("%s: 'ofpart' subnode not found on %s. Trying to parse direct subnodes as partitions.\n",
> +			master->name, mtd_node->full_name);

Do we really want to complain here. I mean, a lot of users do not need
to define their partition in a different node.

> +		ofpart_node = mtd_node;
> +		dedicated = false;
> +	}
> +
>  	/* First count the subnodes */
>  	nr_parts = 0;
> -	for_each_child_of_node(node,  pp) {
> -		if (node_has_compatible(pp))
> +	for_each_child_of_node(ofpart_node,  pp) {
> +		if (!dedicated && node_has_compatible(pp))
>  			continue;
>  
>  		nr_parts++;
> @@ -59,22 +69,36 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_child_of_node(node,  pp) {
> +	for_each_child_of_node(ofpart_node,  pp) {
>  		const __be32 *reg;
>  		int len;
>  		int a_cells, s_cells;
>  
> -		if (node_has_compatible(pp))
> -			continue;
> +		if (!dedicated && node_has_compatible(pp))
> +				continue;

Check your indentation (checkpatch should complain here).

>  
>  		reg = of_get_property(pp, "reg", &len);
>  		if (!reg) {
> +			if (dedicated) {
> +				pr_debug("%s: ofpart partition %s (%s) missing reg property.\n",
> +					 master->name, pp->full_name,
> +					 mtd_node->full_name);
> +				goto ofpart_fail;
> +			} else {
>  			nr_parts--;
>  			continue;

Ditto.

> +			}
>  		}
>  
>  		a_cells = of_n_addr_cells(pp);
>  		s_cells = of_n_size_cells(pp);
> +		if (len / 4 != a_cells + s_cells) {
> +			pr_debug("%s: ofpart partition %s (%s) error parsing reg property.\n",
> +				 master->name, pp->full_name,
> +				 mtd_node->full_name);
> +			goto ofpart_fail;
> +		}
> +

The above changes have nothing to do with the description you gave in
your commit message.

>  		(*pparts)[i].offset = of_read_number(reg, a_cells);
>  		(*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
>  
> @@ -92,15 +116,15 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  		i++;
>  	}
>  
> -	if (!i) {
> -		of_node_put(pp);
> -		pr_err("No valid partition found on %s\n", node->full_name);
> -		kfree(*pparts);
> -		*pparts = NULL;
> -		return -EINVAL;
> -	}
> -

Are you sure you can safely remove this check?


Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
