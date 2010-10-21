From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/4] Implements new features for updating existing
	device tree nodes.
Date: Thu, 21 Oct 2010 16:58:04 +1100
Message-ID: <20101021055804.GH6227@yookeroo>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214506.2985.32859.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101020214506.2985.32859.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 20, 2010 at 02:45:06PM -0700, John Bonesio wrote:
> This is interesting when the /include/ "<filename>" feature is used. This way
> we can create base device tree source files for a family of systems and modify
> the device tree for a specific system.
> 
> The current sytem allows an existing node to be extended with new properties
> and subnodes.
> 
> The new features allow an existing node to be replaced completely by the new
> properties and subnodes. The new features also allow an existing node to be
> deleted.

[snip]
> +	| devicetree DT_REMOVENODE DT_REF ';'
> +		{
> +			struct node *target;
> +
> +			target = get_node_by_label($1, $3);
> +			if (target)
> +				remove_child(target->parent, target);
> +			else
> +				print_error("label, '%s' not found", $3);
> +		}

This still has the problem of labels disappearing into the ether.

>  	;
>  
>  nodedef:
> diff --git a/dtc.h b/dtc.h
> index b36ac5d..a7f3667 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -178,6 +178,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node);
>  
>  void add_property(struct node *node, struct property *prop);
>  void add_child(struct node *parent, struct node *child);
> +void remove_child(struct node *parent, struct node *child);
>  
>  const char *get_unitname(struct node *node);
>  struct property *get_property(struct node *node, const char *propname);
> diff --git a/livetree.c b/livetree.c
> index 13c5f10..21a4c48 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -202,6 +202,24 @@ void add_child(struct node *parent, struct node *child)
>  	*p = child;
>  }
>  
> +void remove_child(struct node *parent, struct node *child)
> +{
> +	struct node **p;
> +
> +	/* Make sure we've got a consistent tree here */
> +	assert(child->parent == parent);
> +
> +	p = &parent->children;
> +	while (*p) {
> +		if (*p == child) {
> +			*p = (*p)->next_sibling;
> +			break;
> +		}
> +		p = &((*p)->next_sibling);
> +	}
> +	child->parent = NULL;
> +}
> +
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>  {
>  	struct reserve_info *new = xmalloc(sizeof(*new));
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
