From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Allow device tree to be modified by additonal device
	tree sections
Date: Wed, 24 Feb 2010 12:36:58 +1100
Message-ID: <20100224013658.GG7187@yookeroo>
References: <20100223192659.11939.42521.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100223192659.11939.42521.stgit@angua>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2010 at 12:28:13PM -0700, Grant Likely wrote:
> This patch allows the following construct:
> 
> / {
> 	property-a = "old";
> 	property-b = "does not change";
> };
> 
> / {
> 	property-a = "changed";
> 	property-c = "new";
> 	node-a {
> 	};
> };

Heh.  I'm glad I didn't far last night with my own implementation of
the concept.

> Where the later device tree overrides the properties found in the
> earlier tree.  This is useful for laying down a template device tree
> in an include file and modifying it for a specific board without having
> to clone the entire tree.
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
> 
> I haven't extensively tested this patch yet, and I haven't figured out yet
> how to properly write the test cases, but I want to get this out there to
> make sure I'm taking the right approach.

Ok, I have a test case from my start to this, which you can use.  Your
dts files give a wider range of cases to check, but they'll also need
more test code to verify.

To add testcases, you basically just list them in run_tests.sh.  For
simple things, like just invoking dtc, or checking things for which
there is already a test program, it may be sufficient just to add the
right things into there.  For more complex and specific testing you'll
need to write a testcase binary, which should use the macros in
tests.h to indicate success or failure.

In this case, I think the simplest way to go is to write dts files
which use the merge functionality to create a tree identical to one of
the existing samples (like test_tree1.dts).  Then the testcase
consists of two parts, one invoking dtc on the merge tree (to check
that it even processes it without error), then a second comparing the
output tree to the thing it's supposed to match.

We won't be able to use the existing dtbs_equal_ordered,
unfortunately, because the merge behaviour could do odd things to the
order.  Still, I've been meaning to implement a dtbs_equal_unordered
for ages.

> diff --git a/dtc-parser.y b/dtc-parser.y
> index bd9e097..8f5c4a3 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -75,6 +75,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
>  %type <proplist> proplist
>  
>  %type <node> devicetree
> +%type <node> devicetrees
>  %type <node> nodedef
>  %type <node> subnode
>  %type <nodelist> subnodes
> @@ -83,7 +84,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
>  %%
>  
>  sourcefile:
> -	  DT_V1 ';' memreserves devicetree
> +	  DT_V1 ';' memreserves devicetrees
>  		{
>  			the_boot_info = build_boot_info($3, $4,
>  							guess_boot_cpuid($4));
> @@ -115,6 +116,17 @@ addr:
>  		}
>  	  ;
>  
> +devicetrees:
> +	  /* empty */

We always want at least one device tree block, so the base case here
should be 'devicetree', rather than empty.

> +		{
> +			$$ = NULL;
> +		}
> +	| devicetree devicetrees
> +		{
> +			$$ = merge_nodes($1, $2);
> +		}
> +	;
> +
>  devicetree:
>  	  '/' nodedef
>  		{
> diff --git a/dtc.h b/dtc.h
> index 5367198..815494a 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -164,6 +164,7 @@ struct property *reverse_properties(struct property *first);
>  struct node *build_node(struct property *proplist, struct node *children);
>  struct node *name_node(struct node *node, char *name, char *label);
>  struct node *chain_node(struct node *first, struct node *list);
> +struct node *merge_nodes(struct node *old_node, struct node *new_node);
>  
>  void add_property(struct node *node, struct property *prop);
>  void add_child(struct node *parent, struct node *child);
> diff --git a/livetree.c b/livetree.c
> index aa0edf1..0691599 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -89,6 +89,69 @@ struct node *name_node(struct node *node, char *name, char * label)
>  	return node;
>  }
>  
> +struct node *merge_nodes(struct node *old_node, struct node *new_node)
> +{
> +	struct property *new_prop, *old_prop;
> +	struct node *new_child, *old_child;
> +
> +	printf("Merge node, old_node:%s new_node:%s\n", old_node->name,
> +		new_node ? new_node->name : "<NULL>" );

There already exist some debug() macros in dtc.h for this sort of
message.

> +	if (!new_node)
> +		return old_node;

With the grammar change suggested above, you don't need this.

> +	/* Move the override properties into the old node.  If there
> +	 * is a collision, replace the old definition with the new */
> +	while (new_node->proplist) {
> +		/* Pop the property off the list */
> +		new_prop = new_node->proplist;
> +		new_node->proplist = new_prop->next;
> +		new_prop->next = NULL;
> +
> +		/* Look for a collision, set new value if there is */
> +		for_each_property(old_node, old_prop) {
> +			if (strcmp(old_prop->name, new_prop->name) == 0) {
> +				old_prop->val = new_prop->val;
> +				free(new_prop);
> +				new_prop = NULL;
> +				break;

I guess there should be a data_free() here of the old value.  Mind you
memory management in dtc is already a bit of a mess.  I've considered
moving it to talloc() (Tridge's nifty hierarchical pool allocator) or,
more controversially, just never bothering to free() anything on the
grounds that dtc processes are always shortlived anyway.

> +			}
> +		}
> +
> +		/* Assuming no collision, add the property to the old node. */
> +		if (new_prop)
> +			add_property(old_node, new_prop);
> +	}
> +
> +	/* Move the override child nodes into the primary node.  If
> +	 * there is a collision, then merge the nodes. */
> +	while (new_node->children) {
> +		/* Pop the child node off the list */
> +		new_child = new_node->children;
> +		new_node->children = new_child->next_sibling;
> +		new_child->parent = NULL;
> +		new_child->next_sibling = NULL;
> +
> +		/* Search for a collision.  Merge if there is */
> +		for_each_child(old_node, old_child) {
> +			if (strcmp(old_child->name, new_child->name)
> == 0) {

Ok, you should use the streq() macro instead of an explicit strcmp()
== 0.  However, there's also a bigger question here.  How precise do
we want the nodename matching to be.  Should we be using the OF-style
matchin where you can omit the unit address when it's unambiguous.
i.e. Should we allow:

/ {
	...
	somebus@1234 {
		widget@17 {
		};
	};
};

/ {
	...
	somebus {
		widget {
			new-property;
		};
	};
};

> +				merge_nodes(old_child, new_child);
> +				new_child = NULL;
> +				break;
> +			}
> +		}
> +
> +		/* Assuming no collision, add the child to the old node. */
> +		if (new_child)
> +			add_child(old_node, new_child);
> +	}
> +
> +	/* The new node contents are now merged into the old node.  Free
> +	 * the new node. */
> +	free(new_node);
> +
> +	return old_node;
> +}

[snip]

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
