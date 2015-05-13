From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Wed, 13 May 2015 18:35:36 +0300
Message-ID: <02C709A3-0FFC-4D5B-B69E-3A0999151FF1@konsulko.com>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com> <CAMuHMdXdw42PpWe4C1Kf1uLz8NxHLX12+875qhoxoUUUi--C7Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXdw42PpWe4C1Kf1uLz8NxHLX12+875qhoxoUUUi--C7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On May 13, 2015, at 18:31 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>=
 wrote:
>=20
> Hi Pantelis,
>=20
> On Wed, Dec 3, 2014 at 12:23 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Add a runtime interface to using configfs for generic device tree ov=
erlay
>> usage. With it its possible to use device tree overlays without havi=
ng
>> to use a per-platform overlay manager.
>=20
> When loading more than one overlay, I got strange behavior:
>=20
>    __allocate_fw_buf: fw-r8a7791-koelsch-exio-a-scifb0.dtbo buf=3Dee2=
7b140
>    (NULL device *): firmware: direct-loading firmware
> r8a7791-koelsch-exio-a-scifb0.dtbo
>    fw_set_page_data: fw-r8a7791-koelsch-exio-a-scifb0.dtbo
> buf=3Dee27b140 data=3Df0bee000 size=3D820
>=20
>    [ loaded overlay is activated!! ]
>=20
>    __fw_free_buf: fw-r8a7791-koelsch-exio-a-scifb0.dtbo buf=3Dee27b14=
0
> data=3Df0bee000 size=3D820
>    __allocate_fw_buf: fw-8a7791-koelsch-exio-a-scifb0.dtbo buf=3Dee3d=
96c0
>    (NULL device *): Direct firmware load for
> 8a7791-koelsch-exio-a-scifb0.dtbo failed with error -2
>    __fw_free_buf: fw-8a7791-koelsch-exio-a-scifb0.dtbo buf=3Dee3d96c0
> data=3D  (null) size=3D0
>=20
> After that:
>  - The overlay itself works fine,
>  - The "status" file in configfs says "applied".
>  - The "path" file in configfs is empty?
>=20
> Note that an "r" was dropped from the filename in front of the "8a779=
1".
> Hence I suspected some obscure memory corruption bug....
>=20
>=20
>> --- /dev/null
>> +++ b/drivers/of/configfs.c
>> @@ -0,0 +1,332 @@
>=20
>> +static int create_overlay(struct cfs_overlay_item *overlay, void *b=
lob)
>> +{
>> +       int err;
>> +
>> +       /* unflatten the tree */
>> +       of_fdt_unflatten_tree(blob, &overlay->overlay);
>> +       if (overlay->overlay =3D=3D NULL) {
>> +               pr_err("%s: failed to unflatten tree\n", __func__);
>> +               err =3D -EINVAL;
>> +               goto out_err;
>> +       }
>> +       pr_debug("%s: unflattened OK\n", __func__);
>> +
>> +       /* mark it as detached */
>> +       of_node_set_flag(overlay->overlay, OF_DETACHED);
>> +
>> +       /* perform resolution */
>> +       err =3D of_resolve_phandles(overlay->overlay);
>> +       if (err !=3D 0) {
>> +               pr_err("%s: Failed to resolve tree\n", __func__);
>> +               goto out_err;
>> +       }
>> +       pr_debug("%s: resolved OK\n", __func__);
>> +
>> +       err =3D of_overlay_create(overlay->overlay);
>> +       if (err < 0) {
>> +               pr_err("%s: Failed to create overlay (err=3D%d)\n",
>> +                               __func__, err);
>> +               goto out_err;
>> +       }
>> +       overlay->ov_id =3D err;
>> +
>> +out_err:
>> +       return err;
>=20
> This returns either a strict negative error code, or a positive overl=
ay ID.
>=20
>> +}
>=20
>> +static ssize_t cfs_overlay_item_path_store(struct cfs_overlay_item =
*overlay,
>> +               const char *page, size_t count)
>> +{
>> +       const char *p =3D page;
>> +       char *s;
>> +       int err;
>> +
>> +       /* if it's set do not allow changes */
>> +       if (overlay->path[0] !=3D '\0' || overlay->dtbo_size > 0)
>> +               return -EPERM;
>> +
>> +       /* copy to path buffer (and make sure it's always zero termi=
nated */
>> +       count =3D snprintf(overlay->path, sizeof(overlay->path) - 1,=
 "%s", p);
>> +       overlay->path[sizeof(overlay->path) - 1] =3D '\0';
>> +
>> +       /* strip trailing newlines */
>> +       s =3D overlay->path + strlen(overlay->path);
>> +       while (s > overlay->path && *--s =3D=3D '\n')
>> +               *s =3D '\0';
>> +
>> +       pr_debug("%s: path is '%s'\n", __func__, overlay->path);
>> +
>> +       err =3D request_firmware(&overlay->fw, overlay->path, NULL);
>> +       if (err !=3D 0)
>> +               goto out_err;
>> +
>> +       err =3D create_overlay(overlay, (void *)overlay->fw->data);
>> +       if (err !=3D 0)
>=20
> Woops, this test should be "if (err < 0)"!
> For the first overlay, err =3D=3D 0, and everything works fine.
> For subsequent overlays, err > 0, and =E2=80=A6
>=20
You are absolutely correct! Good catch.


>> +               goto out_err;
>> +
>> +       return count;
>> +
>> +out_err:
>> +
>> +       release_firmware(overlay->fw);
>> +       overlay->fw =3D NULL;
>> +
>> +       overlay->path[0] =3D '\0';
>=20
> ... the path is cleared...
>=20
>> +       return err;
>=20
> ...and a positive number is returned, smaller than the passed filenam=
e length.
> This makes VFS believe the write was truncated, hence it retries, wri=
ting only
> the remaining part of the filename again. That explains the dropped f=
irst
> character of the filename, and the firmware load failure.
>=20
>> +}
>=20
>> +ssize_t cfs_overlay_item_dtbo_write(struct cfs_overlay_item *overla=
y,
>> +               const void *buf, size_t count)
>> +{
>> +       int err;
>> +
>> +       /* if it's set do not allow changes */
>> +       if (overlay->path[0] !=3D '\0' || overlay->dtbo_size > 0)
>> +               return -EPERM;
>> +
>> +       /* copy the contents */
>> +       overlay->dtbo =3D kmemdup(buf, count, GFP_KERNEL);
>> +       if (overlay->dtbo =3D=3D NULL)
>> +               return -ENOMEM;
>> +
>> +       overlay->dtbo_size =3D count;
>> +
>> +       err =3D create_overlay(overlay, overlay->dtbo);
>> +       if (err !=3D 0)
>=20
> Same here: "if (err < 0)"
>=20
>> +               goto out_err;
>> +
>> +       return count;
>> +
>> +out_err:
>> +       kfree(overlay->dtbo);
>> +       overlay->dtbo =3D NULL;
>> +       overlay->dtbo_size =3D 0;
>> +
>> +       return err;
>> +}
>=20
> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20

I will apply the fixes you pointed out. Good catch.

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus Torvalds

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
