From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] Create a new property value that means 'undefined'.
Date: Fri, 22 Oct 2010 12:50:58 -0700
Message-ID: <1287777058.4535.1571.camel@riker>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214522.2985.97224.stgit@riker>
	<20101021061409.GJ6227@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101021061409.GJ6227@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2010-10-21 at 17:14 +1100, David Gibson wrote:
> On Wed, Oct 20, 2010 at 02:45:22PM -0700, John Bonesio wrote:
> > When updating existing nodes in a device tree merge operation, properties
> > can be removed by setting the value to /undef-prop/.
> > 
> > if /undef-prop/ is assigned to a property that doesn't exist, the property
> > is treated the same as if it had not been declared.
> 
> [snip]
> > diff --git a/dtc.h b/dtc.h
> > index a7f3667..b3fca6e 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -130,7 +130,12 @@ struct label {
> >  	struct label *next;
> >  };
> >  
> > +#define PROP_DEFINED (0)
> > +#define PROP_UNDEFINED (1)
> 
> You never actually use these constants.
> 
> > +
> >  struct property {
> > +	int undefined;  /* if the property is set to undefined, this feild is
> > +	                   set to PROP_UNDEFINED */
> >  	char *name;
> >  	struct data val;
> >  
> > @@ -170,6 +175,7 @@ void add_label(struct label **labels, char *label);
> >  struct property *build_property(char *name, struct data val);
> >  struct property *chain_property(struct property *first, struct property *list);
> >  struct property *reverse_properties(struct property *first);
> > +void undefine_property(struct property *prop);
> >  
> >  struct node *build_node(struct property *proplist, struct node *children);
> >  struct node *name_node(struct node *node, char *name);
> > @@ -177,6 +183,7 @@ struct node *chain_node(struct node *first, struct node *list);
> >  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> >  
> >  void add_property(struct node *node, struct property *prop);
> > +void remove_property(struct node *node, struct property *prop);
> >  void add_child(struct node *parent, struct node *child);
> >  void remove_child(struct node *parent, struct node *child);
> >  
> > diff --git a/flattree.c b/flattree.c
> > index ead0332..00439e9 100644
> > --- a/flattree.c
> > +++ b/flattree.c
> > @@ -275,6 +275,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
> >  	for_each_property(tree, prop) {
> >  		int nameoff;
> >  
> > +		if (prop->undefined)
> > +			continue;
> > +
> >  		if (streq(prop->name, "name"))
> >  			seen_name_prop = 1;
> >  
> > diff --git a/livetree.c b/livetree.c
> > index bf8796b..2ef734d 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -51,6 +51,11 @@ struct property *build_property(char *name, struct data val)
> >  	return new;
> >  }
> >  
> > +void undefine_property(struct property *prop)
> > +{
> > +	prop->undefined = 1;
> > +}
> > +
> >  struct property *chain_property(struct property *first, struct property *list)
> >  {
> >  	assert(first->next == NULL);
> > @@ -121,11 +126,15 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
> >  		/* Look for a collision, set new value if there is */
> >  		for_each_property(old_node, old_prop) {
> >  			if (streq(old_prop->name, new_prop->name)) {
> > -				/* Add new labels to old property */
> > -				for_each_label(new_prop->labels, l)
> > -					add_label(&old_prop->labels, l->label);
> > -
> > -				old_prop->val = new_prop->val;
> > +				if (new_prop->undefined) {
> > +					remove_property(old_node,
> > old_prop);
> 
> This will lose property labels into the ether as your earlier patch
> lost node labels.
> 
> > +				} else {
> > +					/* Add new labels to old property */
> > +					for_each_label(new_prop->labels, l)
> > +						add_label(&old_prop->labels, l->label);
> > +
> > +					old_prop->val = new_prop->val;
> > +				}
> >  				free(new_prop);
> >  				new_prop = NULL;
> >  				break;
> > @@ -188,6 +197,25 @@ void add_property(struct node *node, struct property *prop)
> >  	*p = prop;
> >  }
> >  
> > +void remove_property(struct node *node, struct property *prop)
> > +{
> > +	struct property **p;
> > +	int found = 0;
> > +
> > +	p = &node->proplist;
> > +	while (*p) {
> > +		if (*p == prop) {
> > +			*p = (*p)->next;
> > +			found = 1;
> > +			break;
> > +		}
> > +		p = &((*p)->next);
> > +	}
> > +	/* property not in the node? it's probably an error, so flag it. */
> > +	assert(found);
> 
> assert()s are for finding bugs in code, not detecting errors in user
> input.  AFAICT this *can* be generated by usre input so it should
> print an error message and if possible continue, not cause a SIGABRT.

I agree that assert() shouldn't be used if it can be caused by user
input, but I don't see how the assert can be triggered by user input. In
my mind this is a programming error.

I the only way I see this being triggered by user input is if the user
specifies that a property be deleted but it doesn't exist in the current
in-memory merged tree. I believe the merge_nodes() routine takes care
to avoid problems here by making sure the property already exists in the
in-memory merged tree before calling remove_property() on it.

Maybe there's a case I'm not considering.

> 
> > +}
> > +
> > +
> >  void add_child(struct node *parent, struct node *child)
> >  {
> >  	struct node **p;
> > 
> 
