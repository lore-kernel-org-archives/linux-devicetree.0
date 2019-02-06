From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [linux-sunxi] Re: [PATCH RESEND v2 06/12] drm/sun4i: rgb: Add 1%
 tolerance to dclk frequency check when bridge is connected
Date: Wed, 6 Feb 2019 10:16:08 +0100
Message-ID: <20190206091608.yvws7iyjuhw3xsdk@flea>
References: <20190203185501.8958-1-anarsoul@gmail.com>
 <20190203185501.8958-7-anarsoul@gmail.com>
 <20190204142036.vd42nvyjnjr5yeoi@flea>
 <CA+E=qVfTfJ9E29gz83tdVGx5_KGWSQVJOAxKTzC+-n7=gdj0cA@mail.gmail.com>
 <0F6CBEA4-6DB6-40F1-A2FD-65101AF64F1F@aosc.io>
 <CA+E=qVd7yh=JNZSvrfY4Diu+VJWFK6yLUJ5MavBcZ8Cftn6f-Q@mail.gmail.com>
 <20190205154156.o3aa4cy6uxenkwol@flea>
 <CA+E=qVePKnQLwObfu=ya7-GcUiUkjyFg2p-rmg=FiJJUhQBvxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2086806998=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CA+E=qVePKnQLwObfu=ya7-GcUiUkjyFg2p-rmg=FiJJUhQBvxw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Sean Paul <seanpaul@chromium.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============2086806998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6mbqqqmv7k77dcll"
Content-Disposition: inline


--6mbqqqmv7k77dcll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 09:49:17AM -0800, Vasily Khoruzhick wrote:
> On Tue, Feb 5, 2019 at 7:42 AM Maxime Ripard <maxime.ripard@bootlin.com> =
wrote:
> >
> > On Mon, Feb 04, 2019 at 10:50:17AM -0800, Vasily Khoruzhick wrote:
> > > On Mon, Feb 4, 2019 at 8:29 AM Icenowy Zheng <icenowy@aosc.io> wrote:
> > > > >> IIRC, from the previous discussion, HDMI had a tolerancy require=
ment
> > > > >> in the standard. Do you know if there's such a thing for eDP? Th=
at
> > > > >> would solve the issue for all the eDP displays at once.
> > > > >
> > > > >I don't have access to eDP standard - vesa.org says it's available=
 to
> > > > >members only.
> > > >
> > > > Try out to grab an old version?
> > > >
> > > > I remember 1.0 is open.
> > >
> > > I can't find anything regarding dot clock tolerance in DisplayPort
> > > specification.
> >
> > I guess since the DP is a VESA spec, it's probably .5%, just like on
> > the EDID (well, CVT).
>=20
> Unfortunately that's not enough for Pinebook. It needs 1% for 768p
> panel.

And that mode is stored in the EDID as a standard (or established)
timing, or a detailed timing?

If the latter, then it should also provide the tolerancies as part of
the panel timing description.

If the former, then what would be the advertised pixel clock and the
one we can compute? Maybe we have a bug somewhere.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6mbqqqmv7k77dcll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFql0gAKCRDj7w1vZxhR
xWGpAP9D/c/QkTM7RkEmYqX278PgTsD6DZQS9V3WGIvI9bLJXgEAm3+HDc3qJQPA
0HQwnjxRf6y79VXPkZBpd2H0cw1tdQY=
=vBLL
-----END PGP SIGNATURE-----

--6mbqqqmv7k77dcll--

--===============2086806998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2086806998==--
