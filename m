From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] Removes OF_UNITTEST dependency on OF_DYNAMIC config symbol
Date: Tue, 13 Jan 2015 14:06:57 -0600
Message-ID: <CAL_Jsq+GgHYaJDE83XZdV3Wmhi749mT9bGa9z8FQEESEqpmU3w@mail.gmail.com>
References: <1420960791-26761-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420960791-26761-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 11, 2015 at 1:19 AM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch intends to remove the unittests dependency on
> the functions defined in dynamic.c. So, rather than calling
> of_attach_node defined in dynamic.c, minimal functionality
> required to attach a new node is re-defined in unittest.c.
> Also, now after executing the tests the test data is not
> removed from the device tree so there is no need to call
> of_detach_node.
>
> Tested with and without OF_DYNAMIC enabled on ppc, arm and
> x86
>
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied for 3.20. Thanks.

> ---
>  drivers/of/Kconfig    |  1 -
>  drivers/of/unittest.c | 70 +++++++++------------------------------------------
>  2 files changed, 12 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index b5e0c87..38d1c51 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -10,7 +10,6 @@ menu "Device Tree and Open Firmware support"
>  config OF_UNITTEST
>         bool "Device Tree runtime unit tests"
>         depends on OF_IRQ && OF_EARLY_FLATTREE
> -       select OF_DYNAMIC
>         select OF_RESOLVE
>         help
>           This option builds in test cases for the device tree infrastructure
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 844838e..139363a 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -822,6 +822,7 @@ static void update_node_properties(struct device_node *np,
>  static int attach_node_and_children(struct device_node *np)
>  {
>         struct device_node *next, *dup, *child;
> +       unsigned long flags;
>
>         dup = of_find_node_by_path(np->full_name);
>         if (dup) {
> @@ -838,8 +839,17 @@ static int attach_node_and_children(struct device_node *np)
>
>         child = np->child;
>         np->child = NULL;
> -       np->sibling = NULL;
> -       of_attach_node(np);
> +
> +       mutex_lock(&of_mutex);
> +       raw_spin_lock_irqsave(&devtree_lock, flags);
> +       np->sibling = np->parent->child;
> +       np->parent->child = np;
> +       of_node_clear_flag(np, OF_DETACHED);
> +       raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +
> +       __of_attach_node_sysfs(np);
> +       mutex_unlock(&of_mutex);
> +
>         while (child) {
>                 next = child->sibling;
>                 attach_node_and_children(child);
> @@ -911,59 +921,6 @@ static int __init selftest_data_add(void)
>         return 0;
>  }
>
> -/**
> - *     detach_node_and_children - detaches node
> - *     and its children from live tree
> - *
> - *     @np:    Node to detach from live tree
> - */
> -static void detach_node_and_children(struct device_node *np)
> -{
> -       while (np->child)
> -               detach_node_and_children(np->child);
> -       of_detach_node(np);
> -}
> -
> -/**
> - *     selftest_data_remove - removes the selftest data
> - *     nodes from the live tree
> - */
> -static void selftest_data_remove(void)
> -{
> -       struct device_node *np;
> -       struct property *prop;
> -
> -       if (selftest_live_tree) {
> -               of_node_put(of_aliases);
> -               of_node_put(of_chosen);
> -               of_aliases = NULL;
> -               of_chosen = NULL;
> -               for_each_child_of_node(of_root, np)
> -                       detach_node_and_children(np);
> -               __of_detach_node_sysfs(of_root);
> -               of_root = NULL;
> -               return;
> -       }
> -
> -       while (last_node_index-- > 0) {
> -               if (nodes[last_node_index]) {
> -                       np = of_find_node_by_path(nodes[last_node_index]->full_name);
> -                       if (np == nodes[last_node_index]) {
> -                               if (of_aliases == np) {
> -                                       of_node_put(of_aliases);
> -                                       of_aliases = NULL;
> -                               }
> -                               detach_node_and_children(np);
> -                       } else {
> -                               for_each_property_of_node(np, prop) {
> -                                       if (strcmp(prop->name, "testcase-alias") == 0)
> -                                               of_remove_property(np, prop);
> -                               }
> -                       }
> -               }
> -       }
> -}
> -
>  #ifdef CONFIG_OF_OVERLAY
>
>  static int selftest_probe(struct platform_device *pdev)
> @@ -1475,9 +1432,6 @@ static int __init of_selftest(void)
>         of_selftest_platform_populate();
>         of_selftest_overlay();
>
> -       /* removing selftest data from live tree */
> -       selftest_data_remove();
> -
>         /* Double check linkage after removing testcase data */
>         of_selftest_check_tree_linkage();
>
> --
> 2.1.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
