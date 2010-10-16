From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device tree
	nodes.
Date: Fri, 15 Oct 2010 20:35:56 -0600
Message-ID: <AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
References: <20101016010732.4855.52273.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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

Hi John.

On Fri, Oct 15, 2010 at 7:07 PM, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> This is interesting when the /include/ "<filename>" feature is used. This=
 way
> we can create base device tree source files for a family of systems and m=
odify
> the device tree for a specific system.
>
> The current sytem allows an existing node to be extended with new propert=
ies
> and subnodes.
>
> The new features allow an existing node to be replaced completely by the =
new
> properties and subnodes. The new features also allow an existing node to =
be
> deleted.
>
> This patch does not yet provide a way to remove properties.
>
> - John

Also need s-o-b line, and anything that doesn't belong as part of the
commit message, such as '- John', needs to be below the '---' line so
that git will ignore it.

The patch looks pretty good, but I cannot comment fully until the
keyword handling works when deeper in the tree (see below).

> ---
>
> =A0dtc-lexer.l =A0| =A0 12 ++++++++++
> =A0dtc-parser.y | =A0 24 ++++++++++++++++++++
> =A0dtc.h =A0 =A0 =A0 =A0| =A0 =A02 ++
> =A0livetree.c =A0 | =A0 69 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++
> =A04 files changed, 107 insertions(+), 0 deletions(-)
>
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 081e13a..a24edf5 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -96,6 +96,18 @@ static int pop_input_file(void);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return DT_MEMRESERVE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> +<*>"/trim-node/" =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DPRINT("Keyword: /trim-node=
/\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BEGIN_DEFAULT();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return DT_REPLACENODE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> +<*>"/remove-node/" =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DPRINT("Keyword: /remove-no=
de/\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BEGIN_DEFAULT();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return DT_REMOVENODE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> =A0<*>{LABEL}: =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DPRINT("Label: %s\n", yyte=
xt);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0yylval.labelref =3D xstrdu=
p(yytext);
> diff --git a/dtc-parser.y b/dtc-parser.y
> index aa250f1..a9cde72 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -54,6 +54,8 @@ static unsigned long long eval_literal(const char *s, i=
nt base, int bits);
>
> =A0%token DT_V1
> =A0%token DT_MEMRESERVE
> +%token DT_REPLACENODE
> +%token DT_REMOVENODE
> =A0%token <propnodename> DT_PROPNODENAME
> =A0%token <literal> DT_LITERAL
> =A0%token <cbase> DT_BASE
> @@ -140,6 +142,28 @@ devicetree:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0" node extension", $2);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$$ =3D $1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 | devicetree DT_REPLACENODE DT_REF nodedef
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct node *target;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 target =3D get_node_by_labe=
l($1, $3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (target)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 replace_nod=
es(target, $4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yyerror("la=
bel, '%s' does not exist in"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 " node redefinition", $3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 | devicetree DT_REMOVENODE DT_REF ';'
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct node *target;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 target =3D get_node_by_labe=
l($1, $3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (target)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 remove_node=
s(target);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yyerror("la=
bel, '%s' does not exist in"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 " node removal", $3);
> =A0 =A0 =A0 =A0;

This handles the syntax at the top level, but doesn't deal with the
/*-node/ keywords when they are within the overlay tree.

Also, I don't know if you'll be able to handle it in the same way when
it comes to handling the new tokens embedded within an overlay tree
because it isn't so easy to resolve the node to be removed.  In order
to handle both cases in the same way, it might be better to set a
'replace' flag in struct node that defers the actual remove of the
original node until merge_nodes() time.

>
> =A0nodedef:
> diff --git a/dtc.h b/dtc.h
> index b36ac5d..1340568 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -175,6 +175,8 @@ struct node *build_node(struct property *proplist, st=
ruct node *children);
> =A0struct node *name_node(struct node *node, char *name);
> =A0struct node *chain_node(struct node *first, struct node *list);
> =A0struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +struct node *replace_nodes(struct node *old_node, struct node *new_node);
> +struct node *remove_nodes(struct node *node);
>
> =A0void add_property(struct node *node, struct property *prop);
> =A0void add_child(struct node *parent, struct node *child);
> diff --git a/livetree.c b/livetree.c
> index 13c5f10..5e32510 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -167,6 +167,75 @@ struct node *merge_nodes(struct node *old_node, stru=
ct node *new_node)
> =A0 =A0 =A0 =A0return old_node;
> =A0}
>
> +struct node *remove_nodes(struct node *node) {

Can be void.  The return value of remove_nodes() is never used.

> + =A0 =A0 =A0 struct property *prop;
> + =A0 =A0 =A0 struct node *child, *parent;
> +
> + =A0 =A0 =A0 while (node->proplist) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Pop the property off the list */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D node->proplist;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node->proplist =3D prop->next;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop->next =3D NULL;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(prop);
> + =A0 =A0 =A0 }

It would be useful to have a 'pop_property()' macro so this could be
simplified to:

	while (prop =3D pop_child_node(&node->proplist))
		free(prop);

But then on the other hand, most of the list management is open coded
in dtc. It would be nice to use the list_head macros like used in the
kernel, but that is probably work for another day. (if it is even worth
the effort).

http://ccan.ozlabs.org/info/list.html

> +
> + =A0 =A0 =A0 /* Free up the node's children */
> + =A0 =A0 =A0 /* This assumes we have a tree and not a cylic or acylic gr=
aph */
> + =A0 =A0 =A0 while (node->children) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Pop the child node off the list */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 child =3D node->children;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node->children =3D child->next_sibling;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 child->parent =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 child->next_sibling =3D NULL;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 child =3D remove_nodes(child);
> + =A0 =A0 =A0 }

Ditto here, except as pop_child_node().

> +
> + =A0 =A0 =A0 /* Remove the node from it's parent's child list */
> + =A0 =A0 =A0 if (node->parent) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int found =3D 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 parent =3D node->parent;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* if the node is the first child ... */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (parent->children =3D=3D node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 parent->children =3D node->=
next_sibling;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_child(parent, chil=
d) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (child->=
next_sibling =3D=3D node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 child->next_sibling =3D node->next_sibling;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 found =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 assert(found); /* Woah! We've got an incons=
istent tree here */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node->parent =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node->next_sibling =3D NULL;
> + =A0 =A0 =A0 }

This hunk is redundantly located because recursive calls have already
removed the node from the parent.  Should split into a separate
function called by dtc-parse.y so that the recursive bit is simpler.

> +
> + =A0 =A0 =A0 free(node);
> +
> + =A0 =A0 =A0 return NULL;
> +}

This block looks correct to me.  It seemed a little verbose, but when
I went through it line by line I saw that it pretty much needs to be
that way.  Especially with the list operations being open coded.

> +
> +struct node *replace_nodes(struct node *old_node, struct node *new_node)
> +{
> + =A0 =A0 =A0 struct label *l;
> +
> + =A0 =A0 =A0 /* Add old node labels to new node, so we can still refer t=
o the
> + =A0 =A0 =A0 =A0* new node by the old labels. =A0*/
> + =A0 =A0 =A0 for_each_label(old_node->labels, l)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_label(&new_node->labels, l->label);
> +
> + =A0 =A0 =A0 /* Free up the old_node */
> + =A0 =A0 =A0 remove_nodes(old_node);
> +
> + =A0 =A0 =A0 return new_node;
> +}
> +
> =A0struct node *chain_node(struct node *first, struct node *list)
> =A0{
> =A0 =A0 =A0 =A0assert(first->next_sibling =3D=3D NULL);
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
