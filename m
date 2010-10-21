From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/4] Allow nodes at the root to be specified by path as
	well as by label.
Date: Thu, 21 Oct 2010 17:03:48 +1100
Message-ID: <20101021060348.GI6227@yookeroo>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214513.2985.76446.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101020214513.2985.76446.stgit@riker>
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

On Wed, Oct 20, 2010 at 02:45:13PM -0700, John Bonesio wrote:
> Changes to allow us to specify a node by it's path. A path can be used in
> place of a label.
> 
> This is particularly useful when overriding existing nodes.
> This way we don't have to label every possible node in a device tree we know
> is a base device tree for a class of systems, and we know the tree will be
> modified for the specific systems.

[snip]
> diff --git a/livetree.c b/livetree.c
> index 21a4c48..bf8796b 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -429,10 +429,28 @@ struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
>  
>  struct node *get_node_by_ref(struct node *tree, const char *ref)
>  {
> +	struct node *node;
> +
>  	if (ref[0] == '/')
>  		return get_node_by_path(tree, ref);
> -	else
> +	else {
> +		/*
> +		 * Support finding a node reference that is rooted by
> +		 * a label reference.
> +		 *
> +		 * References rooted by a label have a '/' in them.
> +		 */
> +		char *p = strchr(ref, '/');

So, this line is effectively un-const-ing part of the string that ref
points to.

> +
> +		if (p) {
> +			*p = '\0';

And, then you write to it.  Not good at all.  I'm afraid you're going
to have to use a strndup() here.  Or else modify get_node_by_label()
to ignore text after a /.

> +			node = get_node_by_label(tree, ref);
> +			*p = '/';
> +			return get_node_by_path(node, p+1);
> +		}
> +
>  		return get_node_by_label(tree, ref);
> +	}
>  }
>  
>  cell_t get_node_phandle(struct node *root, struct node *node)
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
