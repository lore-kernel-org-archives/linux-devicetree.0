From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/4] of: improve reporting invalid overlay target path
Date: Mon, 12 Feb 2018 10:00:37 +0100
Message-ID: <CAMuHMdUnkdtHnbSVM7p4756OQzq24N8=g8==s-6yKLAgki+LyA@mail.gmail.com>
References: <1518425496-12159-1-git-send-email-frowand.list@gmail.com> <1518425496-12159-5-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518425496-12159-5-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Mon, Feb 12, 2018 at 9:51 AM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> Errors while developing the patch to create of_overlay_fdt_apply()
> exposed inadequate error messages to debug problems when overlay
> devicetree fragment nodes contain an invalid target path.  Improve
> the messages in find_target_node() to remedy this.
>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>

Thanks for your patch!

> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -488,17 +488,26 @@ static int build_changeset(struct overlay_changeset *ovcs)
>   */
>  static struct device_node *find_target_node(struct device_node *info_node)
>  {
> +       struct device_node *node;
>         const char *path;
>         u32 val;
>         int ret;
>
>         ret = of_property_read_u32(info_node, "target", &val);
> -       if (!ret)
> -               return of_find_node_by_phandle(val);
> +       if (!ret) {
> +               node = of_find_node_by_phandle(val);
> +               if (!node)
> +                       pr_err("target node find by phandle failed\n");

Do you want to print the actual node, cfr. below?

> +               return node;
> +       }
>
>         ret = of_property_read_string(info_node, "target-path", &path);
> -       if (!ret)
> -               return of_find_node_by_path(path);
> +       if (!ret) {
> +               node =  of_find_node_by_path(path);
> +               if (!node)
> +                       pr_err("target node find by path failed\n");

Likewise.

> +               return node;
> +       }
>
>         pr_err("Failed to find target for node %p (%s)\n",
>                 info_node, info_node->name);

This one prints more info.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
