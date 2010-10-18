From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Mon, 18 Oct 2010 11:27:01 +1100
Message-ID: <20101018002701.GB4922@yookeroo>
References: <20101016010732.4855.52273.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101016010732.4855.52273.stgit@riker>
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

On Fri, Oct 15, 2010 at 06:07:50PM -0700, John Bonesio wrote:
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
> 
> This patch does not yet provide a way to remove properties.

Detailed comments below.

>  dtc-lexer.l  |   12 ++++++++++
>  dtc-parser.y |   24 ++++++++++++++++++++
>  dtc.h        |    2 ++
>  livetree.c   |   69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 107 insertions(+), 0 deletions(-)
> 
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 081e13a..a24edf5 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -96,6 +96,18 @@ static int pop_input_file(void);
>  			return DT_MEMRESERVE;
>  		}
>  
> +<*>"/trim-node/"	{
> +			DPRINT("Keyword: /trim-node/\n");
> +			BEGIN_DEFAULT();
> +			return DT_REPLACENODE;
> +		}

Hrm.  The keyword is "/trim-node/", but the C symbol is REPLACENODE.
Potentially confusing.

Also, while "trim-node" seemed a reasonable option to me in some
contexts, with the semantics implemented in this patch, I think
"replace-node" would be far clearer.

> +<*>"/remove-node/"	{
> +			DPRINT("Keyword: /remove-node/\n");
> +			BEGIN_DEFAULT();
> +			return DT_REMOVENODE;
> +		}
> +
>  <*>{LABEL}:	{
>  			DPRINT("Label: %s\n", yytext);
>  			yylval.labelref = xstrdup(yytext);
> diff --git a/dtc-parser.y b/dtc-parser.y
> index aa250f1..a9cde72 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -54,6 +54,8 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
>  
>  %token DT_V1
>  %token DT_MEMRESERVE
> +%token DT_REPLACENODE
> +%token DT_REMOVENODE
>  %token <propnodename> DT_PROPNODENAME
>  %token <literal> DT_LITERAL
>  %token <cbase> DT_BASE
> @@ -140,6 +142,28 @@ devicetree:
>  					" node extension", $2);
>  			$$ = $1;
>  		}
> +	| devicetree DT_REPLACENODE DT_REF nodedef
> +		{
> +			struct node *target;
> +
> +			target = get_node_by_label($1, $3);
> +			if (target)
> +				replace_nodes(target, $4);
> +			else
> +				yyerror("label, '%s' does not exist in"
> +					" node redefinition", $3);
> +			$$ = $1;
> +		}
> +	| devicetree DT_REMOVENODE DT_REF ';'
> +		{
> +			struct node *target;
> +
> +			target = get_node_by_label($1, $3);
> +			if (target)
> +				remove_nodes(target);
> +			else
> +				yyerror("label, '%s' does not exist in"
> +					" node removal", $3);
>  	;
>  
>  nodedef:
> diff --git a/dtc.h b/dtc.h
> index b36ac5d..1340568 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -175,6 +175,8 @@ struct node *build_node(struct property *proplist, struct node *children);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +struct node *replace_nodes(struct node *old_node, struct node *new_node);
> +struct node *remove_nodes(struct node *node);
>  
>  void add_property(struct node *node, struct property *prop);
>  void add_child(struct node *parent, struct node *child);
> diff --git a/livetree.c b/livetree.c
> index 13c5f10..5e32510 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -167,6 +167,75 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
>  	return old_node;
>  }
>  
> +struct node *remove_nodes(struct node *node) {
> +	struct property *prop;
> +	struct node *child, *parent;
> +
> +	while (node->proplist) {
> +		/* Pop the property off the list */
> +		prop = node->proplist;
> +		node->proplist = prop->next;
> +		prop->next = NULL;
> +
> +		free(prop);
> +	}
> +
> +	/* Free up the node's children */
> +	/* This assumes we have a tree and not a cylic or acylic graph */
> +	while (node->children) {
> +		/* Pop the child node off the list */
> +		child = node->children;
> +		node->children = child->next_sibling;
> +		child->parent = NULL;
> +		child->next_sibling = NULL;
> +
> +		child = remove_nodes(child);
> +	}
> +
> +	/* Remove the node from it's parent's child list */
> +	if (node->parent) {
> +		int found = 0;

This should go first, before the recursive free()ing.  I know we don't
have any concurrency to worry about in dtc, but as a general habit it
should always be remove from the structure first, then do the
disposal.

And then, don't bother with the disposal.  I'm pretty sure we already
have some leaks and I really don't care.  dtc is a strictly transient
process, so we can basically treating malloc() as a pool allocator
with exactly one pool, freed at exit.  If we do need something more
subtle infuture, we can use an actual pool allocator (talloc, for
preference).  The fact that in dts parsing we build the tree from the
leaves, but in dtb parsing we bulid it from the root makes lifetimes
complex enough that fully correct explicit free()ing is actually quite
a pain.

(Oh, and, in the case where you're removing, not replacing, you
already leak the labels. See my point :)

> +		parent = node->parent;
> +
> +		/* if the node is the first child ... */
> +		if (parent->children == node) {
> +			parent->children = node->next_sibling;
> +			found = 1;
> +		} else {
> +			for_each_child(parent, child) {
> +				if (child->next_sibling == node) {
> +					child->next_sibling = node->next_sibling;
> +					found = 1;
> +					break;
> +				}
> +			}
> +		}

You can do better:

	ptr = &parent->children;
	for_each_child(...) {
		if (child == node) {
			*ptr = child->next_sibling;
			found = 1;
			     ptr = &child->next_sibling;
		}
	}

This pointer-to-pointer idiom is used in a number of other places.

> +		assert(found); /* Woah! We've got an inconsistent tree here */
> +		node->parent = NULL;
> +		node->next_sibling = NULL;
> +	}
> +
> +	free(node);
> +
> +	return NULL;
> +}
> +
> +struct node *replace_nodes(struct node *old_node, struct node *new_node)
> +{
> +	struct label *l;
> +
> +	/* Add old node labels to new node, so we can still refer to the
> +	 * new node by the old labels.  */
> +	for_each_label(old_node->labels, l)
> +		add_label(&new_node->labels, l->label);

Yeah.  labels to subnodes of the original still disappear without
trace, and could therefore be re-used.  I think this has the potential
to be very confusing.  We need to be more careful with the label
semantics.

> +	/* Free up the old_node */
> +	remove_nodes(old_node);
> +
> +	return new_node;
> +}
> +
>  struct node *chain_node(struct node *first, struct node *list)
>  {
>  	assert(first->next_sibling == NULL);
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
