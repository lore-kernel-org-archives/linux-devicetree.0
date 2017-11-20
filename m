From: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v13 6/7] overlay: Add syntactic sugar version of overlays
Date: Mon, 20 Nov 2017 16:12:59 +0000
Message-ID: <CACxGe6vdGb6tUn5rW7vnnscOMPPjhYUTwVPupB=Mw5D6ub49Ww@mail.gmail.com>
References: <1481114903-8197-1-git-send-email-pantelis.antoniou@konsulko.com> <1481114903-8197-7-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481114903-8197-7-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 7, 2016 at 12:48 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> For simple overlays that use a single target there exists a
> simpler syntax version.
>
> &foo { }; generates an overlay with a single target at foo.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  dtc-parser.y | 20 +++++++++++++++++---
>  dtc.h        |  1 +
>  livetree.c   | 22 ++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 27d358f..50da917 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -183,10 +183,19 @@ devicetree:
>                 {
>                         struct node *target = get_node_by_ref($1, $2);
>
> -                       if (target)
> +                       if (target) {
>                                 merge_nodes(target, $3);
> -                       else
> -                               ERROR(&@2, "Label or path %s not found", $2);
> +                       } else {
> +                               /*
> +                                * We rely on the rule being always:
> +                                *   versioninfo plugindecl memreserves devicetree
> +                                * so $-1 is what we want (plugindecl)
> +                                */
> +                               if ($<flags>-1 & DTSF_PLUGIN)
> +                                       add_orphan_node($1, $3, $2);
> +                               else
> +                                       ERROR(&@2, "Label or path %s not found", $2);
> +                       }

It seems to me that the changes to this rule also need to be made to
the "devicetree DT_LABEL DT_REF nodedef" rule immediately above it.
Aside from applying the label, the rules are identical.
kkk
>                         $$ = $1;
>                 }
>         | devicetree DT_DEL_NODE DT_REF ';'
> @@ -201,6 +210,11 @@ devicetree:
>
>                         $$ = $1;
>                 }
> +       | /* empty */
> +               {
> +                       /* build empty node */
> +                       $$ = name_node(build_node(NULL, NULL), "");
> +               }
>         ;

This change to the parser results in shift/reduce warnings due to an
ambiguous parser. Just discovered this while playing with the mainline
dtc.

I *think* what you're trying to do here is allow for files whose first
tree is not '/', but a DT_REF. I've got a fix which I'll post as soon
as I get email from my Linux box working again.

g.

>
>  nodedef:
> diff --git a/dtc.h b/dtc.h
> index 2ca8601..c97e291 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -198,6 +198,7 @@ struct node *build_node_delete(void);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +void add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
>
>  void add_property(struct node *node, struct property *prop);
>  void delete_property_by_name(struct node *node, char *name);
> diff --git a/livetree.c b/livetree.c
> index df1bc04..0806e47 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -216,6 +216,28 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
>         return old_node;
>  }
>
> +void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
> +{
> +       static unsigned int next_orphan_fragment = 0;
> +       struct node *node;
> +       struct property *p;
> +       struct data d = empty_data;
> +       char *name;
> +
> +       d = data_add_marker(d, REF_PHANDLE, ref);
> +       d = data_append_integer(d, 0xffffffff, 32);
> +
> +       p = build_property("target", d);
> +
> +       xasprintf(&name, "fragment@%u",
> +                       next_orphan_fragment++);
> +       name_node(new_node, "__overlay__");
> +       node = build_node(p, new_node);
> +       name_node(node, name);
> +
> +       add_child(dt, node);
> +}
> +
>  struct node *chain_node(struct node *first, struct node *list)
>  {
>         assert(first->next_sibling == NULL);
> --
> 2.1.4
>
