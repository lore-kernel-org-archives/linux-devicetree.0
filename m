From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Wed, 13 May 2015 16:40:11 +0200
Message-ID: <CAMuHMdXST+xv7PquiP+HPk8WyydbNRh_0EmgPfOJCsitWZ0WuA@mail.gmail.com>
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
> diff --git a/drivers/of/configfs.c b/drivers/of/configfs.c
> new file mode 100644
> index 0000000..1434ade
> --- /dev/null
> +++ b/drivers/of/configfs.c
> @@ -0,0 +1,332 @@

> +static int create_overlay(struct cfs_overlay_item *overlay, void *blob)

After "[PATCH] of/fdt: Make fdt blob input parameters of unflatten functions
const", you can make blob const ... (continue below) ...

> +{

[...]

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

snprintf() always zero-terminates the destination buffer, so you can just do

        count = snprintf(overlay->path, sizeof(overlay->path), "%s", p);

You may want to check if count >= sizeofoverlay->path), to catch truncation.

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

... (continuation) ... and drop the cast.

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
