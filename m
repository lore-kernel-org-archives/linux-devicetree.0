From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Fix NULL dereference in selftest removal code
Date: Sun, 5 Oct 2014 12:12:23 -0700
Message-ID: <CA+rpMb+Z80kwFXimv8PNXFZPKzRsX+0yUBOCUEJ0ZyDw2xMt7g@mail.gmail.com>
References: <1412179371-4053-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412179371-4053-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for the fix, I just noted that you increased NO_OF_NODES to 3 in
following phandle resolver patch.

So, with NO_OF_NODES = 3, the following patch works fine on arm, x86
and powerpc.

On Wed, Oct 1, 2014 at 9:02 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The selftest code removes its testcase data from the live tree when
> exiting, but if the testcases data tree contains an empty child of the
> root, then it causes an oops due to a NULL dereference. The reason is
> that the code tries to directly dereference the child pointer without
> checking first if a child is actually there.
>
> The solution is to pass the parent node into detach_node_and_children()
> instead of trying to pass the child. This required removing the code
> that attempts to remove all of the sibling nodes in
> detach_node_and_children(), which was never sensible in the first place.
>
> At the same time add a check to make sure the bounds of the nodes list
> are not exceeded by the testdata tree. If they are then abort.
>
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/selftest.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
> index a737cb5974de..883e60b04eb5 100644
> --- a/drivers/of/selftest.c
> +++ b/drivers/of/selftest.c
> @@ -637,6 +637,8 @@ static int attach_node_and_children(struct device_node *np)
>         dup = np;
>
>         while (dup) {
> +               if (WARN_ON(last_node_index >= NO_OF_NODES))
> +                       return -EINVAL;
>                 nodes[last_node_index++] = dup;
>                 dup = dup->sibling;
>         }
> @@ -717,10 +719,6 @@ static void detach_node_and_children(struct device_node *np)
>  {
>         while (np->child)
>                 detach_node_and_children(np->child);
> -
> -       while (np->sibling)
> -               detach_node_and_children(np->sibling);
> -
>         of_detach_node(np);
>  }
>
> @@ -749,8 +747,7 @@ static void selftest_data_remove(void)
>                 if (nodes[last_node_index]) {
>                         np = of_find_node_by_path(nodes[last_node_index]->full_name);
>                         if (strcmp(np->full_name, "/aliases") != 0) {
> -                               detach_node_and_children(np->child);
> -                               of_detach_node(np);
> +                               detach_node_and_children(np);
>                         } else {
>                                 for_each_property_of_node(np, prop) {
>                                         if (strcmp(prop->name, "testcase-alias") == 0)
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
