From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v14 08/10] drm/panel: Add Eukrea mbimxsd51 displays.
Date: Tue, 24 Jun 2014 23:56:48 +0200
Message-ID: <20140624215647.GA30143@mithrandir>
References: <1402913484-25910-1-git-send-email-denis@eukrea.com>
 <1402913484-25910-8-git-send-email-denis@eukrea.com>
 <20140624150600.GT32514@n2100.arm.linux.org.uk>
 <CAL_JsqLbzS9Zh+NK8pfqJ=twQpz0qYfyH4xC3NnvCXBokyx+yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0221724547=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqLbzS9Zh+NK8pfqJ=twQpz0qYfyH4xC3NnvCXBokyx+yQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robherring2@gmail.com>
Cc: devel@driverdev.osuosl.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, Denis Carikli <denis@eukrea.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Grant Likely <grant.likely@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0221724547==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 02:52:11PM -0500, Rob Herring wrote:
> On Tue, Jun 24, 2014 at 10:06 AM, Russell King - ARM Linux <linux@arm.lin=
ux.org.uk> wrote:
[...]
> > On Mon, Jun 16, 2014 at 12:11:22PM +0200, Denis Carikli wrote:
[...]
> >> diff --git a/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-=
dvi-vga.txt b/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-=
vga.txt
[...]
> >> @@ -0,0 +1,7 @@
> >> +Eukrea DVI-VGA (640x480 pixels) DVI output.
> >> +
> >> +Required properties:
> >> +- compatible: should be "eukrea,mbimxsd51-dvi-vga"
> >> +
> >> +This binding is compatible with the simple-panel binding, which is sp=
ecified
> >> +in simple-panel.txt in this directory.
>=20
> Seems like we could just have a list of compatible strings rather than
> a mostly duplicated file.

We've been doing it this way for all other panels.

> >> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pa=
nel/panel-simple.c
> >> index a251361..adc40a7 100644
> >> --- a/drivers/gpu/drm/panel/panel-simple.c
> >> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >> @@ -403,6 +403,80 @@ static const struct panel_desc edt_etm0700g0dh6 =
=3D {
> >>       },
> >>  };
> >>
> >> +static const struct drm_display_mode eukrea_mbimxsd51_cmoqvga_mode =
=3D {
> >> +     .clock =3D 6500,
> >> +     .hdisplay =3D 320,
> >> +     .hsync_start =3D 320 + 38,
> >> +     .hsync_end =3D 320 + 38 + 20,
> >> +     .htotal =3D 320 + 38 + 20 + 30,
> >> +     .vdisplay =3D 240,
> >> +     .vsync_start =3D 240 + 15,
> >> +     .vsync_end =3D 240 + 15 + 4,
> >> +     .vtotal =3D 240 + 15 + 4 + 3,
> >> +     .vrefresh =3D 60,
> >> +     .pol_flags =3D DRM_MODE_FLAG_POL_PIXDATA_NEGEDGE |
> >> +                  DRM_MODE_FLAG_POL_DE_LOW,
>=20
> Why aren't you using:
>=20
> Documentation/devicetree/bindings/video/display-timing.txt

Because it's redundant information. We need to have a compatible for the
panel in the device tree anyway and that already implicitly defines the
display mode.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTqfQfAAoJEN0jrNd/PrOht/UP/ifx9VfFjl9Gt78qipN1LOai
e08ZktpMr/+Z0xecbTlZ7Ajyfh8dGwEJO1LWUPGVUBncyCLaw6YLFjRdsSQ7gDJU
BBLhJB2NhMKP8A6rDs0kxnvrN4gaJx+E6ofOeP8lf+lbmweP0M8pVawHvkoE3/s2
CjApkFpZ+68Xytz/FvruijEcvNyEm3iUBxr5bISdmP7TCyK9zBqRQpqRUo4L9ljL
M4pzrVHwBjifuiVgltbAhcScfDsvBfB64gRjj0jobGI4z8FD0nmQTot3BLWs1xVh
jbxamUM8w5uFi3e2KNliZDvty/GPLXNM1E/LWyYe6X2FcbrWY04SA/yN+0oQaf3Z
2yW31WNpbWCUvquclnQiAfvYXqojjGELCoNbSo8xSRFULo2kG4JopNw0CEjNffzl
ccJ7rywp0bt4KvaZn+SgPkNE7otfruUNTRoUNRnAwKX6A/0GLTOD+dfPH2x2cL/L
Uz0vZP1AlBMd3GhXM6DGdzsjOmUs2PsQmuH+46pophEX9JJbVMB7Cnk/he4SzD5D
GIVXCimvzwu+U5oVA3KOiiVCg1DfOVaekjWJPuxgcphXbybZe7XaR20D4t+4C6tM
NusWYPKrGcCi2+wSYiO/btAR7ehgiH0vZPseFKiJK0tt7G+G5jfRU3+8tScY33uz
GM2i376W1SLu9Wc9HVlB
=7MQu
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

--===============0221724547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0221724547==--
