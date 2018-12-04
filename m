From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 00/28] Allwinner H6 DE3 and HDMI support
Date: Tue, 4 Dec 2018 09:29:14 +0100
Message-ID: <20181204082914.iyysctlftlgaffv3@flea>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
 <20181105094341.qedt7jvnxooiojki@flea>
 <14295738.m69morCfDC@jernej-laptop>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nick2en3or4insev"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZXVTDQAKGQE7W3P7HI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <14295738.m69morCfDC@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nick2en3or4insev
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2018 at 07:09:50PM +0100, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 05. november 2018 ob 10:43:41 CET je Maxime Ripard napisa=
l(a):
> > On Sun, Nov 04, 2018 at 07:26:37PM +0100, Jernej Skrabec wrote:
> > > This series adds support for Display Engine 3.0 and HDMI 2.0a, which
> > > can be found on H6 SoC.
> > >=20
> > > Display Engine 3.0 in comparison to 2.0 mostly adds features needed f=
or
> > > displaying and processing 10-bit and AFBC formats, which are not yet
> > > supported by this series.
> > >=20
> > > H6 is also the first SoC which supports IOMMU, but support for it is
> > > not yet added.
> > >=20
> > > This series is based on linux-next at next-20181102.
> > >=20
> > > I suggest all patches go through allwinner tree, except DRM patches,
> > > which should go through drm-misc tree.
> >=20
> > Applied all patches up to the 26. The two last one however should not
> > use the clk bindings define you added in the first clk patches, since
> > clk and dt patches are going through different tree.
>=20
> I think you forgot to merge patch "drm/sun4i: Add compatible for H6 displ=
ay=20
> engine". At least it is not in linux-next.

Sorry, I just applied it. thanks!
Maxime


--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--nick2en3or4insev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAY62gAKCRDj7w1vZxhR
xccKAQDREKow//RUsju4juH/zjvD1TLHoS2siseRM84JC9rJNQEAx0PrxX1bzz1R
imBJVWh5FSLkywqxNMaZvX8zkPyE2wg=
=VwNa
-----END PGP SIGNATURE-----

--nick2en3or4insev--
