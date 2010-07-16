From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/8] of/fdt.c: use architecture-independent ALIGN macro,
	defined in kernel.h
Date: Fri, 16 Jul 2010 12:29:54 -0600
Message-ID: <AANLkTin8GUuMjAVI-r2KNXBoH7DjsQWfTjC1inQTlD6V@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<f2cebad3-5fb1-4984-800f-ef847e388e65@SG2EHSMHS001.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <f2cebad3-5fb1-4984-800f-ef847e388e65-RaUQJvECHitZbvUCbuG1mrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> This removes an architecture dependency, making the code more generic.

A similar change will be in linux-next today.  :-)  I've recently
updated my next-devicetree and test-devicetree branches if you would
like to rebase.

g.

> ---
> =A0drivers/of/fdt.c | =A0 20 ++++++++++----------
> =A01 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index b6987bb..d61fda8 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -69,9 +69,9 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 sz =3D be32_to_cpup((_=
_be32 *)p);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p +=3D 8;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (be32_to_cpu(initial_bo=
ot_params->version) < 0x10)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIG=
N(p, sz >=3D 8 ? 8 : 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN=
(p, sz >=3D 8 ? 8 : 4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p +=3D sz;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p, 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p, 4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (tag !=3D OF_DT_BEGIN_NODE) {
> @@ -80,7 +80,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0depth++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pathp =3D (char *)p;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p + strlen(pathp) + 1, 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p + strlen(pathp) + 1, 4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((*pathp) =3D=3D '/') {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *lp, *np;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (lp =3D NULL, np =3D p=
athp; *np; np++)
> @@ -109,7 +109,7 @@ unsigned long __init of_get_flat_dt_root(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p +=3D 4;
> =A0 =A0 =A0 =A0BUG_ON(be32_to_cpup((__be32 *)p) !=3D OF_DT_BEGIN_NODE);
> =A0 =A0 =A0 =A0p +=3D 4;
> - =A0 =A0 =A0 return _ALIGN(p + strlen((char *)p) + 1, 4);
> + =A0 =A0 =A0 return ALIGN(p + strlen((char *)p) + 1, 4);
> =A0}
>
> =A0/**
> @@ -138,7 +138,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, =
const char *name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0noff =3D be32_to_cpup((__be32 *)(p + 4));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p +=3D 8;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (be32_to_cpu(initial_boot_params->versi=
on) < 0x10)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p, sz >=3D 8 ?=
 8 : 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p, sz >=3D 8 ? =
8 : 4);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nstr =3D find_flat_dt_string(noff);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nstr =3D=3D NULL) {
> @@ -151,7 +151,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, =
const char *name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return (void *)p;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p +=3D sz;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p, 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p, 4);
> =A0 =A0 =A0 =A0} while (1);
> =A0}
>
> @@ -184,7 +184,7 @@ static void *__init unflatten_dt_alloc(unsigned long =
*mem, unsigned long size,
> =A0{
> =A0 =A0 =A0 =A0void *res;
>
> - =A0 =A0 =A0 *mem =3D _ALIGN(*mem, align);
> + =A0 =A0 =A0 *mem =3D ALIGN(*mem, align);
> =A0 =A0 =A0 =A0res =3D (void *)*mem;
> =A0 =A0 =A0 =A0*mem +=3D size;
>
> @@ -220,7 +220,7 @@ unsigned long __init unflatten_dt_node(unsigned long =
mem,
> =A0 =A0 =A0 =A0*p +=3D 4;
> =A0 =A0 =A0 =A0pathp =3D (char *)*p;
> =A0 =A0 =A0 =A0l =3D allocl =3D strlen(pathp) + 1;
> - =A0 =A0 =A0 *p =3D _ALIGN(*p + l, 4);
> + =A0 =A0 =A0 *p =3D ALIGN(*p + l, 4);
>
> =A0 =A0 =A0 =A0/* version 0x10 has a more compact unit name here instead =
of the full
> =A0 =A0 =A0 =A0 * path. we accumulate the full path size using "fpsize", =
we'll rebuild
> @@ -299,7 +299,7 @@ unsigned long __init unflatten_dt_node(unsigned long =
mem,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0noff =3D be32_to_cpup((__be32 *)((*p) + 4)=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*p +=3D 8;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (be32_to_cpu(initial_boot_params->versi=
on) < 0x10)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *p =3D _ALIGN(*p, sz >=3D 8=
 ? 8 : 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *p =3D ALIGN(*p, sz >=3D 8 =
? 8 : 4);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pname =3D find_flat_dt_string(noff);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pname =3D=3D NULL) {
> @@ -333,7 +333,7 @@ unsigned long __init unflatten_dt_node(unsigned long =
mem,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*prev_pp =3D pp;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prev_pp =3D &pp->next;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 *p =3D _ALIGN((*p) + sz, 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *p =3D ALIGN((*p) + sz, 4);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0/* with version 0x10 we may not have the name property, re=
create
> =A0 =A0 =A0 =A0 * it here from the unit name if absent
> --
> 1.5.6.6
>
>
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
