From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Wed, 13 May 2015 17:31:02 +0200
Message-ID: <CAMuHMdXdw42PpWe4C1Kf1uLz8NxHLX12+875qhoxoUUUi--C7Q@mail.gmail.com>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417605808-23327-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Wed, Dec 3, 2014 at 12:23 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Add a runtime interface to using configfs for generic device tree overlay
> usage. With it its possible to use device tree overlays without having
> to use a per-platform overlay manager.

When loading more than one overlay, I got strange behavior:

    __allocate_fw_buf: fw-r8a7791-koelsch-exio-a-scifb0.dtbo buf=ee27b140
    (NULL device *): firmware: direct-loading firmware
r8a7791-koelsch-exio-a-scifb0.dtbo
    fw_set_page_data: fw-r8a7791-koelsch-exio-a-scifb0.dtbo
buf=ee27b140 data=f0bee000 size=820

    [ loaded overlay is activated!! ]

    __fw_free_buf: fw-r8a7791-koelsch-exio-a-scifb0.dtbo buf=ee27b140
data=f0bee000 size=820
    __allocate_fw_buf: fw-8a7791-koelsch-exio-a-scifb0.dtbo buf=ee3d96c0
    (NULL device *): Direct firmware load for
8a7791-koelsch-exio-a-scifb0.dtbo failed with error -2
    __fw_free_buf: fw-8a7791-koelsch-exio-a-scifb0.dtbo buf=ee3d96c0
data=  (null) size=0

After that:
  - The overlay itself works fine,
  - The "status" file in configfs says "applied".
  - The "path" file in configfs is empty?

Note that an "r" was dropped from the filename in front of the "8a7791".
Hence I suspected some obscure memory corruption bug....


> --- /dev/null
> +++ b/drivers/of/configfs.c
> @@ -0,0 +1,332 @@

> +static int create_overlay(struct cfs_overlay_item *overlay, void *blob)
> +{
> +       int err;
> +
> +       /* unflatten the tree */
> +       of_fdt_unflatten_tree(blob, &overlay->overlay);
> +       if (overlay->overlay == NULL) {
> +               pr_err("%s: failed to unflatten tree\n", __func__);
> +               err = -EINVAL;
> +               goto out_err;
> +       }
> +       pr_debug("%s: unflattened OK\n", __func__);
> +
> +       /* mark it as detached */
> +       of_node_set_flag(overlay->overlay, OF_DETACHED);
> +
> +       /* perform resolution */
> +       err = of_resolve_phandles(overlay->overlay);
> +       if (err != 0) {
> +               pr_err("%s: Failed to resolve tree\n", __func__);
> +               goto out_err;
> +       }
> +       pr_debug("%s: resolved OK\n", __func__);
> +
> +       err = of_overlay_create(overlay->overlay);
> +       if (err < 0) {
> +               pr_err("%s: Failed to create overlay (err=%d)\n",
> +                               __func__, err);
> +               goto out_err;
> +       }
> +       overlay->ov_id = err;
> +
> +out_err:
> +       return err;

This returns either a strict negative error code, or a positive overlay ID.

> +}

> +static ssize_t cfs_overlay_item_path_store(struct cfs_overlay_item *overlay,
> +               const char *page, size_t count)
> +{
> +       const char *p = page;
> +       char *s;
> +       int err;
> +
> +       /* if it's set do not allow changes */
> +       if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
> +               return -EPERM;
> +
> +       /* copy to path buffer (and make sure it's always zero terminated */
> +       count = snprintf(overlay->path, sizeof(overlay->path) - 1, "%s", p);
> +       overlay->path[sizeof(overlay->path) - 1] = '\0';
> +
> +       /* strip trailing newlines */
> +       s = overlay->path + strlen(overlay->path);
> +       while (s > overlay->path && *--s == '\n')
> +               *s = '\0';
> +
> +       pr_debug("%s: path is '%s'\n", __func__, overlay->path);
> +
> +       err = request_firmware(&overlay->fw, overlay->path, NULL);
> +       if (err != 0)
> +               goto out_err;
> +
> +       err = create_overlay(overlay, (void *)overlay->fw->data);
> +       if (err != 0)

Woops, this test should be "if (err < 0)"!
For the first overlay, err == 0, and everything works fine.
For subsequent overlays, err > 0, and ...

> +               goto out_err;
> +
> +       return count;
> +
> +out_err:
> +
> +       release_firmware(overlay->fw);
> +       overlay->fw = NULL;
> +
> +       overlay->path[0] = '\0';

... the path is cleared...

> +       return err;

...and a positive number is returned, smaller than the passed filename length.
This makes VFS believe the write was truncated, hence it retries, writing only
the remaining part of the filename again. That explains the dropped first
character of the filename, and the firmware load failure.

> +}

> +ssize_t cfs_overlay_item_dtbo_write(struct cfs_overlay_item *overlay,
> +               const void *buf, size_t count)
> +{
> +       int err;
> +
> +       /* if it's set do not allow changes */
> +       if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
> +               return -EPERM;
> +
> +       /* copy the contents */
> +       overlay->dtbo = kmemdup(buf, count, GFP_KERNEL);
> +       if (overlay->dtbo == NULL)
> +               return -ENOMEM;
> +
> +       overlay->dtbo_size = count;
> +
> +       err = create_overlay(overlay, overlay->dtbo);
> +       if (err != 0)

Same here: "if (err < 0)"

> +               goto out_err;
> +
> +       return count;
> +
> +out_err:
> +       kfree(overlay->dtbo);
> +       overlay->dtbo = NULL;
> +       overlay->dtbo_size = 0;
> +
> +       return err;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
