From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/4] Implements new features for updating existing
	device tree nodes.
Date: Wed, 20 Oct 2010 22:47:29 -0600
Message-ID: <20101021044729.GE13335@angua.secretlab.ca>
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
> 
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Patch looks good, but it needs a test case before it can be merged.
Also, as mentioned earlier, the switch to get_node_by_ref() should be
applied before this patch.

g.

> ---
> 
>  dtc-lexer.l  |    6 ++++++
>  dtc-parser.y |   11 +++++++++++
>  dtc.h        |    1 +
>  livetree.c   |   18 ++++++++++++++++++
>  4 files changed, 36 insertions(+), 0 deletions(-)
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
> index b58ba8e..1ba0478 100644
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
> @@ -140,6 +141,16 @@ devicetree:
>  				print_error("label, '%s' not found", $2);
>  			$$ = $1;
>  		}
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
