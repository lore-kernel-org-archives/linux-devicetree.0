From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] of: overlay: correctly apply overlay node with unit-address
Date: Mon, 10 Jul 2017 11:08:42 -0500
Message-ID: <CAL_JsqKLVX-nNiVcuxiZdpUa8LvQsX37XwpfVfO9r7oCw8woiA@mail.gmail.com>
References: <1499473725-13361-1-git-send-email-frowand.list@gmail.com> <1499473725-13361-3-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499473725-13361-3-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 7, 2017 at 7:28 PM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> Correct existing node name detection when overlay node name has
> a unit-address.
>
> Expected test result is overlay will update the nodes and properties
> for /testcase-data-2/fairway-1/ride@100/ after the patch is applied.
>
> Before this patch is applied:
>
>    Console error message near end of unittest:
>       OF: Duplicate name in fairway-1, renamed to "ride@100#1"
>
>    $ cd /proc/device-tree/testcase-data-2/fairway-1/
>    $ # extra node: ride@100#1
>    $ ls
>    #address-cells  linux,phandle   phandle         ride@200
>    #size-cells     name            ride@100        status
>    compatible      orientation     ride@100#1
>    $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
>    $ ls track@3/incline_up
>    ls: track@3/incline_up: No such file or directory
>    $ ls track@4/incline_up
>    ls: track@4/incline_up: No such file or directory
>
> After this patch is applied:
>
>    Console error message no longer occurs
>
>    $ cd /proc/device-tree/testcase-data-2/fairway-1/
>    $ # no extra node: ride@100#1
>    $ ls
>    #address-cells  compatible      name            phandle         ride@200
>    #size-cells     linux,phandle   orientation     ride@100        status
>    $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
>    $ ls track@3/incline_up
>    track@3/incline_up
>    $ ls track@4/incline_up
>    track@4/incline_up
>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>  drivers/of/overlay.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index c0e4ee1cd1ba..30aef51eeee5 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -118,6 +118,24 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
>         return of_changeset_update_property(&ov->cset, target, propn);
>  }
>
> +static struct device_node *child_by_full_name(const struct device_node *np,

It's not really the full name which currently means the whole path (my
full_name work is going to change that), but the unit_name (at least
that's what dtc calls it).

> +               const char *cname)
> +{
> +       struct device_node *child;
> +       struct device_node *prev;
> +
> +       child = np->child;
> +       while (child) {

Doesn't for_each_child_of_node() work here?

> +               of_node_get(child);
> +               if (!of_node_cmp(cname, kbasename(child->full_name)))
> +                       break;
> +               prev = child;
> +               child = child->sibling;
> +               of_node_put(prev);
> +       }
> +       return child;
> +}
> +
>  static int of_overlay_apply_single_device_node(struct of_overlay *ov,
>                 struct device_node *target, struct device_node *child)
>  {
> @@ -130,7 +148,7 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
>                 return -ENOMEM;
>
>         /* NOTE: Multiple mods of created nodes not supported */
> -       tchild = of_get_child_by_name(target, cname);
> +       tchild = child_by_full_name(target, cname);
>         if (tchild != NULL) {
>                 /* new overlay phandle value conflicts with existing value */
>                 if (child->phandle)
> --
> Frank Rowand <frank.rowand@sony.com>
>
