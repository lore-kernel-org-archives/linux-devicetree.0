From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Fri, 15 Oct 2010 20:21:17 -0700
Message-ID: <1287199277.4535.1423.camel@riker>
References: <20101016010732.4855.52273.stgit@riker>
	<AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Fri, 2010-10-15 at 20:35 -0600, Grant Likely wrote:
> Hi John.
> 
> On Fri, Oct 15, 2010 at 7:07 PM, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > This is interesting when the /include/ "<filename>" feature is used. This way
> > we can create base device tree source files for a family of systems and modify
> > the device tree for a specific system.
> >
> > The current sytem allows an existing node to be extended with new properties
> > and subnodes.
> >
> > The new features allow an existing node to be replaced completely by the new
> > properties and subnodes. The new features also allow an existing node to be
> > deleted.
> >
> > This patch does not yet provide a way to remove properties.
> >
> > - John
> 
> Also need s-o-b line, and anything that doesn't belong as part of the
> commit message, such as '- John', needs to be below the '---' line so
> that git will ignore it.
> 
> The patch looks pretty good, but I cannot comment fully until the
> keyword handling works when deeper in the tree (see below).
> 
> > ---
> >
> >  dtc-lexer.l  |   12 ++++++++++
> >  dtc-parser.y |   24 ++++++++++++++++++++
> >  dtc.h        |    2 ++
> >  livetree.c   |   69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 107 insertions(+), 0 deletions(-)
> >
> > diff --git a/dtc-lexer.l b/dtc-lexer.l
> > index 081e13a..a24edf5 100644
> > --- a/dtc-lexer.l
> > +++ b/dtc-lexer.l
> > @@ -96,6 +96,18 @@ static int pop_input_file(void);
> >                        return DT_MEMRESERVE;
> >                }
> >
> > +<*>"/trim-node/"       {
> > +                       DPRINT("Keyword: /trim-node/\n");
> > +                       BEGIN_DEFAULT();
> > +                       return DT_REPLACENODE;
> > +               }
> > +
> > +<*>"/remove-node/"     {
> > +                       DPRINT("Keyword: /remove-node/\n");
> > +                       BEGIN_DEFAULT();
> > +                       return DT_REMOVENODE;
> > +               }
> > +
> >  <*>{LABEL}:    {
> >                        DPRINT("Label: %s\n", yytext);
> >                        yylval.labelref = xstrdup(yytext);
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index aa250f1..a9cde72 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -54,6 +54,8 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
> >
> >  %token DT_V1
> >  %token DT_MEMRESERVE
> > +%token DT_REPLACENODE
> > +%token DT_REMOVENODE
> >  %token <propnodename> DT_PROPNODENAME
> >  %token <literal> DT_LITERAL
> >  %token <cbase> DT_BASE
> > @@ -140,6 +142,28 @@ devicetree:
> >                                        " node extension", $2);
> >                        $$ = $1;
> >                }
> > +       | devicetree DT_REPLACENODE DT_REF nodedef
> > +               {
> > +                       struct node *target;
> > +
> > +                       target = get_node_by_label($1, $3);
> > +                       if (target)
> > +                               replace_nodes(target, $4);
> > +                       else
> > +                               yyerror("label, '%s' does not exist in"
> > +                                       " node redefinition", $3);
> > +                       $$ = $1;
> > +               }
> > +       | devicetree DT_REMOVENODE DT_REF ';'
> > +               {
> > +                       struct node *target;
> > +
> > +                       target = get_node_by_label($1, $3);
> > +                       if (target)
> > +                               remove_nodes(target);
> > +                       else
> > +                               yyerror("label, '%s' does not exist in"
> > +                                       " node removal", $3);
> >        ;
> 
> This handles the syntax at the top level, but doesn't deal with the
> /*-node/ keywords when they are within the overlay tree.
> 
> Also, I don't know if you'll be able to handle it in the same way when
> it comes to handling the new tokens embedded within an overlay tree
> because it isn't so easy to resolve the node to be removed.  In order
> to handle both cases in the same way, it might be better to set a
> 'replace' flag in struct node that defers the actual remove of the
> original node until merge_nodes() time.

Ok, so maybe I misunderstood. I thought we had decided that node
modifications would only happen at the top level, but now that I'm
looking back through your examples earlier today, and I see this isn't
true.

I'll take a look at changing the implementation.

> 
> >
> >  nodedef:
> > diff --git a/dtc.h b/dtc.h
> > index b36ac5d..1340568 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -175,6 +175,8 @@ struct node *build_node(struct property *proplist, struct node *children);
> >  struct node *name_node(struct node *node, char *name);
> >  struct node *chain_node(struct node *first, struct node *list);
> >  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> > +struct node *replace_nodes(struct node *old_node, struct node *new_node);
> > +struct node *remove_nodes(struct node *node);
> >
> >  void add_property(struct node *node, struct property *prop);
> >  void add_child(struct node *parent, struct node *child);
> > diff --git a/livetree.c b/livetree.c
> > index 13c5f10..5e32510 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -167,6 +167,75 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
> >        return old_node;
> >  }
> >
> > +struct node *remove_nodes(struct node *node) {
> 
> Can be void.  The return value of remove_nodes() is never used.
> 
> > +       struct property *prop;
> > +       struct node *child, *parent;
> > +
> > +       while (node->proplist) {
> > +               /* Pop the property off the list */
> > +               prop = node->proplist;
> > +               node->proplist = prop->next;
> > +               prop->next = NULL;
> > +
> > +               free(prop);
> > +       }
> 
> It would be useful to have a 'pop_property()' macro so this could be
> simplified to:
> 
> 	while (prop = pop_child_node(&node->proplist))
> 		free(prop);
> 
> But then on the other hand, most of the list management is open coded
> in dtc. It would be nice to use the list_head macros like used in the
> kernel, but that is probably work for another day. (if it is even worth
> the effort).
> 
> http://ccan.ozlabs.org/info/list.html
> 
> > +
> > +       /* Free up the node's children */
> > +       /* This assumes we have a tree and not a cylic or acylic graph */
> > +       while (node->children) {
> > +               /* Pop the child node off the list */
> > +               child = node->children;
> > +               node->children = child->next_sibling;
> > +               child->parent = NULL;
> > +               child->next_sibling = NULL;
> > +
> > +               child = remove_nodes(child);
> > +       }
> 
> Ditto here, except as pop_child_node().
> 
> > +
> > +       /* Remove the node from it's parent's child list */
> > +       if (node->parent) {
> > +               int found = 0;
> > +
> > +               parent = node->parent;
> > +
> > +               /* if the node is the first child ... */
> > +               if (parent->children == node) {
> > +                       parent->children = node->next_sibling;
> > +                       found = 1;
> > +               } else {
> > +                       for_each_child(parent, child) {
> > +                               if (child->next_sibling == node) {
> > +                                       child->next_sibling = node->next_sibling;
> > +                                       found = 1;
> > +                                       break;
> > +                               }
> > +                       }
> > +               }
> > +               assert(found); /* Woah! We've got an inconsistent tree here */
> > +               node->parent = NULL;
> > +               node->next_sibling = NULL;
> > +       }
> 
> This hunk is redundantly located because recursive calls have already
> removed the node from the parent.  Should split into a separate
> function called by dtc-parse.y so that the recursive bit is simpler.
> 
> > +
> > +       free(node);
> > +
> > +       return NULL;
> > +}
> 
> This block looks correct to me.  It seemed a little verbose, but when
> I went through it line by line I saw that it pretty much needs to be
> that way.  Especially with the list operations being open coded.
> 
> > +
> > +struct node *replace_nodes(struct node *old_node, struct node *new_node)
> > +{
> > +       struct label *l;
> > +
> > +       /* Add old node labels to new node, so we can still refer to the
> > +        * new node by the old labels.  */
> > +       for_each_label(old_node->labels, l)
> > +               add_label(&new_node->labels, l->label);
> > +
> > +       /* Free up the old_node */
> > +       remove_nodes(old_node);
> > +
> > +       return new_node;
> > +}
> > +
> >  struct node *chain_node(struct node *first, struct node *list)
> >  {
> >        assert(first->next_sibling == NULL);
> >
> > _______________________________________________
> > devicetree-discuss mailing list
> > devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > https://lists.ozlabs.org/listinfo/devicetree-discuss
> >
> 
> 
> 
