From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Wed, 13 May 2015 17:43:58 +0300
Message-ID: <A021451E-1635-45C4-8D3F-B687B817ADE0@antoniou-consulting.com>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com> <CAMuHMdXST+xv7PquiP+HPk8WyydbNRh_0EmgPfOJCsitWZ0WuA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXST+xv7PquiP+HPk8WyydbNRh_0EmgPfOJCsitWZ0WuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On May 13, 2015, at 17:40 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>=
 wrote:
>=20
> Hi Pantelis,
>=20
> On Wed, Dec 3, 2014 at 12:23 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> diff --git a/drivers/of/configfs.c b/drivers/of/configfs.c
>> new file mode 100644
>> index 0000000..1434ade
>> --- /dev/null
>> +++ b/drivers/of/configfs.c
>> @@ -0,0 +1,332 @@
>=20
>> +static int create_overlay(struct cfs_overlay_item *overlay, void *b=
lob)
>=20
> After "[PATCH] of/fdt: Make fdt blob input parameters of unflatten fu=
nctions
> const", you can make blob const ... (continue below) =E2=80=A6
>=20

Yes, seen it, thanks.

>> +{
>=20
> [...]
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
>=20
> snprintf() always zero-terminates the destination buffer, so you can =
just do
>=20
>        count =3D snprintf(overlay->path, sizeof(overlay->path), "%s",=
 p);
>=20
> You may want to check if count >=3D sizeofoverlay->path), to catch tr=
uncation.
>=20

Hmm, good catch. The manual zero termination is just a habit I carried =
from
user-space programming.

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
>=20
> ... (continuation) ... and drop the cast.
>=20

OK

> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus Torvalds

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
