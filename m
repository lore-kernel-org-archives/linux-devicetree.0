From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/6] drm/panel: Make of_drm_find_panel() return an
 ERR_PTR() instead of NULL
Date: Fri, 4 May 2018 14:11:40 +0200
Message-ID: <20180504121140.GR13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-3-boris.brezillon@bootlin.com>
 <20180504101852.GG13459@ulmo> <20180504135820.37b8cea4@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1016463432=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504135820.37b8cea4@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1016463432==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CGcXfQ1PUDCmwDYp"
Content-Disposition: inline


--CGcXfQ1PUDCmwDYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 01:58:20PM +0200, Boris Brezillon wrote:
> On Fri, 4 May 2018 12:18:52 +0200 Thierry Reding <thierry.reding@gmail.co=
m> wrote:
> > On Thu, May 03, 2018 at 06:40:05PM +0200, Boris Brezillon wrote:
[...]
> > >  	return mdp4_lvds_connector->panel ?
> > >  			connector_status_connected :
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm=
/dsi/dsi_host.c
> > > index 7a03a9489708..fffc80b73966 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -1881,7 +1881,7 @@ int msm_dsi_host_register(struct mipi_dsi_host =
*host, bool check_defer)
> > >  		 * output
> > >  		 */
> > >  		if (check_defer && msm_host->device_node) {
> > > -			if (!of_drm_find_panel(msm_host->device_node))
> > > +			if (IS_ERR(of_drm_find_panel(msm_host->device_node)))
> > >  				if (!of_drm_find_bridge(msm_host->device_node))
> > >  					return -EPROBE_DEFER;
> > >  		} =20
> >=20
> > Again, pretty weird stuff going on here, prior to the patch. But I think
> > this needs to be changed to take the -ENODEV into account in the next
> > patch. As it is, this will continue to defer probe even if the panel
> > node is disabled.
>=20
> Not sure this is a problem. I mean, the code was working before, and we
> had no way to differentiate the -ENODEV vs -EPROBE_DEFER, which in turn
> means that, any driver that assumed that the device would appear at some
> point were just as broken as they are after this patch when the node
> they're pointing to has its status set to "disabled".
>=20
> I'm not trying to patch all drivers to take the return code into
> account, just those that might take advantage of it.

Okay, fair enough.

Thierry

--CGcXfQ1PUDCmwDYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsTfsACgkQ3SOs138+
s6GYjg//VuUOgkd2K/1s3e6fz+rx5WzVGJwJwOSLYQUwO3seiBK+kcWkwiMdow84
J3lFXSCRMhmsoE22ZGzPAnWP3ThAaDZgiomRtqNaJ28XmNf+Swqyc6ToYx7JIU52
nt9D3biXZsHjugavjNO5dTQdpWZS24EdcryAF+iYqvDC1tgfTIKT/rkFLbgGDFVd
g08UsKCUn1+CdkYZ/2hSPwAa10XwVRO8FJ28/JXJDw2JH3qhUO5Y7trZc58IEwyp
0EFd4ref9h50+/YV/3xTGWT6qW/wwYlREKvKiOCN4Jnr79IgfBf762/gBfJfRsGw
Df3JLfb3bcNm3khS+nuNzm6VytySFTll5jdec/KAAPfT3sUnKgVo7G6RFQYmCu53
U3cSLRkeRAcxAQUIqpO0viGchd9naJDPiKVfcPtBXCBR18mD1ahYk/sFzwOJgGqM
V80gCh3XcmJvsHHcIV1uL632+ijG59ScrnA2QK63MYwwSlnbK8yfRL49omjh2bOY
HwR/3eWrpGTd4uRvp7SUzTqsB+0/vdmTFG2XsInMxqSjdN/V/Cvh/zC6y0ArwXkH
ArlhiglmlPHfe2npKAeW4iw4RF+fUA8DeUdvjKfU8ADov+Dm3zrb51+f2FXQkZd3
4b9dp/g9uYfrJR9o/JjGqNUBftE9/vqvqHicUlWyIhxPkkD0kn4=
=ulFu
-----END PGP SIGNATURE-----

--CGcXfQ1PUDCmwDYp--

--===============1016463432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1016463432==--
