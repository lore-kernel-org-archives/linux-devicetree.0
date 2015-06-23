From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH Resend] of: fix a build error to
 f_graph_get_endpoint_by_regs function
Date: Wed, 24 Jun 2015 04:27:58 +1000
Message-ID: <20150624042758.2ccbc886@canb.auug.org.au>
References: <1435043204-23133-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aLQcvnqZ__CMGffjJo5C157"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435043204-23133-1-git-send-email-inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/aLQcvnqZ__CMGffjJo5C157
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 23 Jun 2015 16:06:44 +0900 Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
> This patch fixes the below build error reported by Stephen,
>=20
>      Stephen reported:
>      After merging the drm-exynos tree, today's linux-next build (x86_64
>      allmodconfig) failed like this:
>=20
>      drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_r=
egs':
>      adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endpo=
int_by_regs'
>      drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined h=
ere
>      drivers/media/platform/soc_camera/atmel-isi.o: In function `of_graph=
_get_endpoint_by_regs':
>      atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_end=
point_by_regs'
>      drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0=
x2ce3): first defined here
>      drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph_=
get_endpoint_by_regs':
>      rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_endp=
oint_by_regs'
>      drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0=
x2ce3): first defined here
>=20
>      Caused by commit:
>        a0f7001c18ca ("of: add helper for getting endpoint node of specifi=
c identifiers")
>=20
> To fix the error, this patch declares of_graph_get_endpoint_by_regs funct=
ion
> with "static inline".
>=20
> Signed-off-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

In case it is not obvious, this is needed in the drm tree now.
However, you seem to have been sent a rebased version of the drm-exynos
tree and so the commit referred to above is commit 8ccd0d0ca041 in your
tree.  :-(

Inki, please clean up your tree now that Dave has merged a rebased
version of it (and please do *not* rebase your tree before asking Dave
to merge it in the future - or if you must do that, then also update
the branch that I include in linux-next first).

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

--Sig_/aLQcvnqZ__CMGffjJo5C157
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJViaU0AAoJEMDTa8Ir7ZwV/2wP/2P0viFoej+/XzWcOaBO4XpQ
zUtCAuRjlnSt0lRCLdmLzkluSbd4MfrSFruUe67k7YkWOrzvkBnln/mo0nmJv282
zdNm8yD9wSkPQPaz6ekBl6qBLl1Jhw2/Cs2WjRNLnjlVE7Qgcf8mqe3ujJyV8yXT
bq03ah4aC62bD/QM1b/NCD1NzVlIz0EsXSdyvrOgEVlCXF24TlNLM59+o/hB4ksM
LJBYnOMp0CaemfY3pULuuRE0qYHO5mQIxwMAeEGPyqnDL0+RlEdEsD8SRzSgjXfK
9cqk8qUQfiimheKoxqDxkiacGOQj2ynSkksfc/JgpZIUZdTlwcrOdOx1m982yk5S
jsDNpWKcOYFQdxwuA1Xd2wnOV/4067xjUB6BeK5MzVkl9OoRf1YpIVGt6shpdiRO
eF+lOxhb8lC+15ylv7tQ0LkQEZjNmjX0ebxrCC3IeoeUKUwP58we8KvjVJbv1Ta3
bsADYtjBS764gigwaQ6YVmj+OByhRx70jfYg9FD9/YnfwHk9ldaIl5XhnemQo8NL
5QYIOw/p6WZsM7pPHfjhCyHhdfiSfDe4QzKHnuhccoRTIW4K5SXsfgE0aNBKk14D
00jB/F8KH9zkbQmNOYkyLtk5/fapCtc0NsU2J9vJyToeS19+RvIGiLprJExD+1vA
UIPkdkiblZ/49xdEBlrI
=k3BO
-----END PGP SIGNATURE-----

--Sig_/aLQcvnqZ__CMGffjJo5C157--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
