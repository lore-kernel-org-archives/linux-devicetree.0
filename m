From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 01/13] of: Remove comments that state the obvious
Date: Thu, 27 Oct 2016 07:18:01 -0500
Message-ID: <CAL_JsqL1aPq3rJLngvpQav-4-AKBd+u=+GX5NNpP9Kbc4zehpw@mail.gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com> <1477429146-27039-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-2-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@am.sony.com>
>
> Remove comments that state the obvious, to reduce clutter

I'm probably not the best reviewer, have you ever seen a comment in my code. :)

>
> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
> ---
>  drivers/of/resolver.c | 31 ++-----------------------------
>  1 file changed, 2 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> index 46325d6394cf..4ff0220d7aa2 100644
> --- a/drivers/of/resolver.c
> +++ b/drivers/of/resolver.c

> @@ -75,8 +73,6 @@ static phandle of_get_tree_max_phandle(void)
>
>  /*
>   * Adjust a subtree's phandle values by a given delta.
> - * Makes sure not to just adjust the device node's phandle value,
> - * but modify the phandle properties values as well.

What's missing here is the why? Why do we adjust phandle values?

>   */
>  static void __of_adjust_tree_phandles(struct device_node *node,
>                 int phandle_delta)
> @@ -85,32 +81,25 @@ static void __of_adjust_tree_phandles(struct device_node *node,
>         struct property *prop;
>         phandle phandle;
>
> -       /* first adjust the node's phandle direct value */

Seems somewhat useful.

>         if (node->phandle != 0 && node->phandle != OF_PHANDLE_ILLEGAL)
>                 node->phandle += phandle_delta;
>
> -       /* now adjust phandle & linux,phandle values */

Seems somewhat useful.

>         for_each_property_of_node(node, prop) {
>
> -               /* only look for these two */
>                 if (of_prop_cmp(prop->name, "phandle") != 0 &&
>                     of_prop_cmp(prop->name, "linux,phandle") != 0)
>                         continue;
>
> -               /* must be big enough */
>                 if (prop->length < 4)
>                         continue;
>
> -               /* read phandle value */
>                 phandle = be32_to_cpup(prop->value);
> -               if (phandle == OF_PHANDLE_ILLEGAL)      /* unresolved */
> +               if (phandle == OF_PHANDLE_ILLEGAL)
>                         continue;
>
> -               /* adjust */
>                 *(uint32_t *)prop->value = cpu_to_be32(node->phandle);
>         }
>
> -       /* now do the children recursively */
>         for_each_child_of_node(node, child)
>                 __of_adjust_tree_phandles(child, phandle_delta);
>  }

> @@ -254,7 +239,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
>
>                 for (i = 0; i < count; i++) {
>                         off = be32_to_cpu(((__be32 *)rprop->value)[i]);
> -                       /* make sure the offset doesn't overstep (even wrap) */

Seems somewhat useful.

>                         if (off >= sprop->length ||
>                                         (off + 4) > sprop->length) {
>                                 pr_err("%s: Illegal property '%s' @%s\n",

> @@ -349,10 +328,8 @@ int of_resolve_phandles(struct device_node *resolve)
>         resolve_sym = NULL;
>         resolve_fix = NULL;
>
> -       /* this may fail (if no fixups are required) */

Seem somewhat useful.

>         root_sym = of_find_node_by_path("/__symbols__");
>
> -       /* locate the symbols & fixups nodes on resolve */
>         for_each_child_of_node(resolve, child) {
>
>                 if (!resolve_sym &&
