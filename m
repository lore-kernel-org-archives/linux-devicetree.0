From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v12 6/6] drm_modes: add of_videomode helpers
Date: Wed, 21 Nov 2012 14:52:50 +0200
Message-ID: <50ACCEA2.5060401@ti.com>
References: <1353426896-6045-1-git-send-email-s.trumtrar@pengutronix.de>
 <1353426896-6045-7-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2774200243000698141=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353426896-6045-7-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Florian Tobias Schandinat <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Guennady Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2774200243000698141==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig47A2311AA235F0CD0772E217"

--------------enig47A2311AA235F0CD0772E217
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2012-11-20 17:54, Steffen Trumtrar wrote:
> Add helper to get drm_display_mode from devicetree.
>=20
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Acked-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Tested-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Tested-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_modes.c |   35 ++++++++++++++++++++++++++++++++++-=

>  include/drm/drmP.h          |    6 ++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
>=20

> diff --git a/include/drm/drmP.h b/include/drm/drmP.h
> index de2f6cf..377280f 100644
> --- a/include/drm/drmP.h
> +++ b/include/drm/drmP.h
> @@ -56,6 +56,7 @@
>  #include <linux/cdev.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>
>  #include <linux/videomode.h>
>  #if defined(__alpha__) || defined(__powerpc__)
>  #include <asm/pgtable.h>	/* For pte_wrprotect */
> @@ -1459,6 +1460,11 @@ drm_mode_create_from_cmdline_mode(struct drm_dev=
ice *dev,
>  extern int drm_display_mode_from_videomode(const struct videomode *vm,=

>  					   struct drm_display_mode *dmode);
>  #endif
> +#if IS_ENABLED(CONFIG_OF_VIDEOMODE)
> +extern int of_get_drm_display_mode(const struct device_node *np,
> +				   struct drm_display_mode *dmode,
> +				   unsigned int index);
> +#endif
> =20
>  /* Modesetting support */
>  extern void drm_vblank_pre_modeset(struct drm_device *dev, int crtc);

And the same comments here also.

 Tomi




--------------enig47A2311AA235F0CD0772E217
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQrM6iAAoJEPo9qoy8lh71aU0P/iMMN8FZf5o0NLDAOoWjvSlY
Il8Z1z4NssYUvu+R3f7IS6NIzEE+Sz/Dox/LjCocZDdMfdU/UE+Xee64FmKe027l
qdLT6NGS5JzcZT265ELXsQzfBuLQmnWpUU/NDM7dNK1UWXVcaanIuAKkDqxgkTNq
1mTMuajq/XtQRkM5c9lst0UbahD+nNfvkT6WoVW516z1Z8E0DjOJaeaIgUpMKkZF
NcU143x+lZKZ/vOJs4ZJ4z3FzG8iDvjwKw0QRkfdSkL3sEBe1yVJaiCoi2RkDhsW
Wi/W3JTvrpvmG2MO/5Ftbs6Cq0jVho/elnU0tlFGYeP1doneR6TAUc85pMneTipG
FTsDL5S/AgQvx5UI07C8UCU2EV9kOEnPRFi+8xhLOsFav7l3Ze8Y89xuamhc264i
tNPRE4E5mAJqMLptRyXGzi+iy9UBdONoe2EjlZ3Hy8Kj1khT51C/7Mf1H3BEQ8H7
C0yUdAmRTmeyRB/dKEPKnZsM6912FCQbcPo3D9it9m2nrZf/Yt/p+YzxZILssbKJ
HQdLblHfFOVAq3LqIhhtqvfsceEUqijccUs6RxQQaxekk5Tz7jKGXEPX2giRjypf
HBR4uh/y+xNK7C+Bh4uWg44SzqqpYA3MQQm8i5v7pk7i3C4sUrryegesvfzyaclA
WvoWLwOZ/ou/Uafx8+IM
=AX3l
-----END PGP SIGNATURE-----

--------------enig47A2311AA235F0CD0772E217--

--===============2774200243000698141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2774200243000698141==--
