From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Implements new features for updating existing
	device tree nodes.
Date: Mon, 18 Oct 2010 14:42:42 -0600
Message-ID: <20101018204242.GD2259@angua.secretlab.ca>
References: <20101018202353.24286.74857.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101018202353.24286.74857.stgit@riker>
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

On Mon, Oct 18, 2010 at 01:25:29PM -0700, John Bonesio wrote:
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
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

A few comments, but I'm otherwise happy with this patch.

g.

> ---
> 
> I was originally going to submit just one patch, as the change in the
> second one is pretty trivial. However, I thought people might appreciate
> that the change to refer to nodes by path is highlighted separately.
> 
> Comment away!
> 
> - John
> 
>  dtc-lexer.l  |    6 ++++++
>  dtc-parser.y |   14 ++++++++++++--
>  dtc.h        |    3 +++
>  livetree.c   |   25 +++++++++++++++++++++++++

Need to add test cases to the patch

>  4 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 081e13a..80a886a 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -96,6 +96,12 @@ static int pop_input_file(void);
>  			return DT_MEMRESERVE;
>  		}
>  
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
> index e1846d4..56d7789 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -55,6 +55,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
>  
>  %token DT_V1
>  %token DT_MEMRESERVE
> +%token DT_REMOVENODE
>  %token <propnodename> DT_PROPNODENAME
>  %token <literal> DT_LITERAL
>  %token <cbase> DT_BASE
> @@ -137,10 +138,19 @@ devicetree:
>  			if (target)
>  				merge_nodes(target, $3);
>  			else
> -				print_error("label, '%s' does not exist in"
> -					" node extension", $2);
> +				print_error("label, '%s' not found", $2);
>  			$$ = $1;

This hunk should perhaps go in the previous patch?  It is unrelated.

>  		}
> +	| devicetree DT_REMOVENODE DT_REF ';'
> +		{
> +			struct node *target;
> +
> +			target = get_node_by_label($1, $3);

The above two lines could be merged for conciseness.

> +			if (target)
> +				remove_nodes(target);
> +			else
> +				print_error("label, '%s' not found", $3);
> +		}

Nice and simple!

>  	;
>  
>  nodedef:
> diff --git a/dtc.h b/dtc.h
> index b36ac5d..e7cb45c 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -175,9 +175,12 @@ struct node *build_node(struct property *proplist, struct node *children);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +struct node *replace_nodes(struct node *old_node, struct node *new_node);
> +void remove_nodes(struct node *node);
>  
>  void add_property(struct node *node, struct property *prop);
>  void add_child(struct node *parent, struct node *child);
> +void remove_child(struct node *parent, struct node *child);
>  
>  const char *get_unitname(struct node *node);
>  struct property *get_property(struct node *node, const char *propname);
> diff --git a/livetree.c b/livetree.c
> index 13c5f10..924c060 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -167,6 +167,14 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
>  	return old_node;
>  }
>  
> +void remove_nodes(struct node *node) {
> +	/*
> +	 * For now, just unlink the node from the tree structure.
> +	 * This leaks memory, but at this point the developers are ok with this.
> +	 */
> +	remove_child(node->parent, node);
> +}
> +
>  struct node *chain_node(struct node *first, struct node *list)
>  {
>  	assert(first->next_sibling == NULL);
> @@ -202,6 +210,23 @@ void add_child(struct node *parent, struct node *child)
>  	*p = child;
>  }
>  
> +void remove_child(struct node *parent, struct node *child)

Since remove_child() is only used by remove_nodes(), just roll this
implementation into remove_nodes().  If we need to do more in that
function later, then we'll refactor at that time.

> +{
> +	struct node **p;
> +
> +	/* Make sure we've got a consistent tree here */
> +	assert(child->parent == parent);
> +
> +	p = &parent->children;
> +	while (*p) {

This while loop will never complete because &((*p)->next_sibling
probably resolves to 16 on x86 and 32 on x86_64.  next_sibling is not
the first element in the structure.  The NULL condition still needs
to be tested for explicitly.

> +		if (*p == child) {
> +			*p = (*p)->next_sibling;

break;

> +		}
> +		p = &((*p)->next_sibling);

One way to solve the problem is with:

		p = (*p)->next_sibling ? &(*p)->next_sibling : NULL;
> +	}
> +	child->parent = NULL;
> +}
> +
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>  {
>  	struct reserve_info *new = xmalloc(sizeof(*new));
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
