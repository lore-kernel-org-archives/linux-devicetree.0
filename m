From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] Create a new property value that means 'undefined'.
Date: Wed, 20 Oct 2010 23:20:53 -0600
Message-ID: <20101021052053.GF13335@angua.secretlab.ca>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214522.2985.97224.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101020214522.2985.97224.stgit@riker>
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

On Wed, Oct 20, 2010 at 02:45:22PM -0700, John Bonesio wrote:
> When updating existing nodes in a device tree merge operation, properties
> can be removed by setting the value to /undef-prop/.
> 
> if /undef-prop/ is assigned to a property that doesn't exist, the property
> is treated the same as if it had not been declared.
> 
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Implementation looks good.
> ---
> 
>  dtc-lexer.l  |   14 ++++++++++----
>  dtc-parser.y |    6 ++++++
>  dtc.h        |    7 +++++++
>  flattree.c   |    3 +++
>  livetree.c   |   38 +++++++++++++++++++++++++++++++++-----
>  5 files changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 216a3d2..efa89b4 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -102,6 +102,12 @@ static int pop_input_file(void);
>  			return DT_REMOVENODE;
>  		}
>  
> +<*>"/undef-prop/"	{
> +			DPRINT("Keyword: /undef-prop/\n");
> +			BEGIN_DEFAULT();
> +			return DT_UNDEFINED;
> +		}
> +

Does /undef-prop/ really need to be using <*> to match in all start
conditions?

>  <*>{LABEL}:	{
>  			DPRINT("Label: %s\n", yytext);
>  			yylval.labelref = xstrdup(yytext);
> @@ -116,10 +122,10 @@ static int pop_input_file(void);
>  		}
>  
>  
> -<*>\&{LABEL}    {       /* label reference without the braces*/
> -                        DPRINT("Ref: %s\n", yytext+1);
> -                        yylval.labelref = xstrdup(yytext+1);
> -                        return DT_REF;
> +<*>\&{LABEL}	{       /* label reference without the braces*/
> +			DPRINT("Ref: %s\n", yytext+1);
> +			yylval.labelref = xstrdup(yytext+1);
> +	    		return DT_REF;
>  		}

Unrelated whitespace change.  In general, patches should avoid making
unrelated changes in the same patch, even if they are correct, because
they decrease the signal-to-noise ratio for patch reviewers.
Whitespace changes are particularly offensive because the can end up
masking (to a reviewer) functional changes in the same block.

>  
>  <*>"&{"{LABEL}{PATHCHAR}*\} { /* label and/or path refererence with braces */
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 0a74c86..ac9cfd7 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -56,6 +56,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
>  %token DT_V1
>  %token DT_MEMRESERVE
>  %token DT_REMOVENODE
> +%token DT_UNDEFINED
>  %token <propnodename> DT_PROPNODENAME
>  %token <literal> DT_LITERAL
>  %token <cbase> DT_BASE
> @@ -178,6 +179,11 @@ propdef:
>  		{
>  			$$ = build_property($1, empty_data);
>  		}
> +	| DT_PROPNODENAME '=' DT_UNDEFINED ';'

Hmmm.  I'm going to make this comment once, but I'll shut-up if you
guys disagree with me because the details have already been hashed out
several times, and I've already said I'd be okay with the above form.

The more I look at it, the more I prefer the form 
	/undef-prop/ property;
instead of
	property = /undef-prop/;

The reason being is that while the assignment form does work, it isn't
a very natural construct.  Removal is not logically the same as
assignment.  /undef-prop/ is something that is performed on a
property.  Syntax that shows /undef-prop/ being assigned as a property
value doesn't ring true for me as the right thing to do.

So, my vote is for the "/undef-prop/ property;" form, but I hold my
piece if you both disagree with me.

> +		{
> +			$$ = build_property($1, empty_data);
> +			undefine_property($$)

Don't bother with the undefine_property function.  Just do:
			$$->undefined = 1;

> +		}

>  	| DT_LABEL propdef
>  		{
>  			add_label(&$2->labels, $1);
> diff --git a/dtc.h b/dtc.h
> index a7f3667..b3fca6e 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -130,7 +130,12 @@ struct label {
>  	struct label *next;
>  };
>  
> +#define PROP_DEFINED (0)
> +#define PROP_UNDEFINED (1)

No need for the #defines. Just use 0 and 1 in the code when working
with boolean flags.  Besides, these #defines aren't used anywhere
anyway.  :-)

> +
>  struct property {
> +	int undefined;  /* if the property is set to undefined, this feild is
> +	                   set to PROP_UNDEFINED */
>  	char *name;
>  	struct data val;
>  
> @@ -170,6 +175,7 @@ void add_label(struct label **labels, char *label);
>  struct property *build_property(char *name, struct data val);
>  struct property *chain_property(struct property *first, struct property *list);
>  struct property *reverse_properties(struct property *first);
> +void undefine_property(struct property *prop);
>  
>  struct node *build_node(struct property *proplist, struct node *children);
>  struct node *name_node(struct node *node, char *name);
> @@ -177,6 +183,7 @@ struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
>  
>  void add_property(struct node *node, struct property *prop);
> +void remove_property(struct node *node, struct property *prop);
>  void add_child(struct node *parent, struct node *child);
>  void remove_child(struct node *parent, struct node *child);
>  
> diff --git a/flattree.c b/flattree.c
> index ead0332..00439e9 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -275,6 +275,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
>  	for_each_property(tree, prop) {
>  		int nameoff;
>  
> +		if (prop->undefined)
> +			continue;
> +
>  		if (streq(prop->name, "name"))
>  			seen_name_prop = 1;
>  
> diff --git a/livetree.c b/livetree.c
> index bf8796b..2ef734d 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -51,6 +51,11 @@ struct property *build_property(char *name, struct data val)
>  	return new;
>  }
>  
> +void undefine_property(struct property *prop)
> +{
> +	prop->undefined = 1;
> +}
> +
>  struct property *chain_property(struct property *first, struct property *list)
>  {
>  	assert(first->next == NULL);
> @@ -121,11 +126,15 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
>  		/* Look for a collision, set new value if there is */
>  		for_each_property(old_node, old_prop) {
>  			if (streq(old_prop->name, new_prop->name)) {
> -				/* Add new labels to old property */
> -				for_each_label(new_prop->labels, l)
> -					add_label(&old_prop->labels, l->label);
> -
> -				old_prop->val = new_prop->val;
> +				if (new_prop->undefined) {
> +					remove_property(old_node, old_prop);
> +				} else {
> +					/* Add new labels to old property */
> +					for_each_label(new_prop->labels, l)
> +						add_label(&old_prop->labels, l->label);
> +
> +					old_prop->val = new_prop->val;
> +				}
>  				free(new_prop);
>  				new_prop = NULL;
>  				break;
> @@ -188,6 +197,25 @@ void add_property(struct node *node, struct property *prop)
>  	*p = prop;
>  }
>  
> +void remove_property(struct node *node, struct property *prop)
> +{
> +	struct property **p;
> +	int found = 0;
> +
> +	p = &node->proplist;
> +	while (*p) {
> +		if (*p == prop) {
> +			*p = (*p)->next;
> +			found = 1;
> +			break;

You could just return at this point, and assert unconditionally if the
loop exits.  That would be slightly more concise.

> +		}
> +		p = &((*p)->next);
> +	}
> +	/* property not in the node? it's probably an error, so flag it. */
> +	assert(found);
> +}
> +
> +
>  void add_child(struct node *parent, struct node *child)
>  {
>  	struct node **p;
> 
