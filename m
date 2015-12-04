From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible
 property to "partitions" node
Date: Fri, 4 Dec 2015 09:57:10 -0600
Message-ID: <20151204155710.GA29035@rob-hp-laptop>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
 <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449194529-145705-2-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 03, 2015 at 06:02:09PM -0800, Brian Norris wrote:
> As noted here [1], there are potentially future conflicts if we try to
> use MTD's "partitions" subnode to describe anything besides just the
> fixed-in-the-device-tree partitions currently described in this
> document. Particularly, there was a proposal to use this node for the
> AFS parser too.
> 
> It can pose a (small) problem to try to differentiate the following
> nodes:
> 
> 	// using binding as currently specified
> 	partitions {
> 		#address-cells = <x>;
> 		#size-cells = <y>;
> 		partition@0 {
> 			...;
> 		};
> 	};
> 
> and
> 
> 	// proposed future binding
> 	partitions {
> 		compatible = "arm,arm-flash-structure";
> 	};
> 
> It's especially difficult if other uses of this node start having
> subnodes.
> 
> So, since the "partitions" node is new in v4.4, let's fixup the binding
> before release so that it requires a compatible property, so it's much
> clearer to distinguish. e.g.:
> 
> 	// proposed
> 	partitions {
> 		compatible = "partitions";
> 		#address-cells = <x>;
> 		#size-cells = <y>;
> 		partition@0 {
> 			...;
> 		};
> 	};
> 
> [1] Subject: "mtd: create a partition type device tree binding"
>     http://lkml.kernel.org/g/20151113220039.GA74382-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
>     http://lists.infradead.org/pipermail/linux-mtd/2015-November/063355.html
>     http://lists.infradead.org/pipermail/linux-mtd/2015-November/063364.html
> 
> Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> This one is more of a future proofing patch. We should probably take this for
> 4.4, before the binding "stabilizes" (I don't actually see any users yet), or
> else we'll have to find some other (possibly more complicated) way to avoid
> this potential collision on future development.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
>  Documentation/devicetree/bindings/mtd/partition.txt | 7 ++++++-
>  drivers/mtd/ofpart.c                                | 3 +++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index f1e2a02381a4..047e80575881 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -6,7 +6,9 @@ used for what purposes, but which don't use an on-flash partition table such
>  as RedBoot.
>  
>  The partition table should be a subnode of the mtd node and should be named
> -'partitions'. Partitions are defined in subnodes of the partitions node.
> +'partitions'. This node should have the following property:
> +- compatible : (required) must be "partitions"
> +Partitions are then defined in subnodes of the partitions node.
>  
>  For backwards compatibility partitions as direct subnodes of the mtd device are
>  supported. This use is discouraged.
> @@ -36,6 +38,7 @@ Examples:
>  
>  flash@0 {
>  	partitions {
> +		compatible = "partitions";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  
> @@ -53,6 +56,7 @@ flash@0 {
>  
>  flash@1 {
>  	partitions {
> +		compatible = "partitions";
>  		#address-cells = <1>;
>  		#size-cells = <2>;
>  
> @@ -66,6 +70,7 @@ flash@1 {
>  
>  flash@2 {
>  	partitions {
> +		compatible = "partitions";
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 3e9c5857c991..23cd809fad4c 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -55,6 +55,9 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  			 master->name, mtd_node->full_name);
>  		ofpart_node = mtd_node;
>  		dedicated = false;
> +	} else if (!of_device_is_compatible(ofpart_node, "partitions")) {
> +		/* The 'partitions' subnode might be used by another parser */
> +		return 0;
>  	}
>  
>  	/* First count the subnodes */
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
