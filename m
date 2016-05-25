From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 12/20] drm/sun4i: Add bridge support
Date: Wed, 25 May 2016 18:29:45 +0200
Message-ID: <20160525162945.GK9232@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-13-git-send-email-maxime.ripard@free-electrons.com>
 <CAKMK7uG-uq7XSqyesVnPtx0Ajx-FQjVKm_QzjEZgWJQDn8EkPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247977398=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uG-uq7XSqyesVnPtx0Ajx-FQjVKm_QzjEZgWJQDn8EkPA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1247977398==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opg8F0UgoHELSI+9"
Content-Disposition: inline


--opg8F0UgoHELSI+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, May 16, 2016 at 03:12:15PM +0200, Daniel Vetter wrote:
> On Mon, May 16, 2016 at 2:47 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Our RGB bus can be either connected to a bridge or a panel. While the p=
anel
> > support was already there, the bridge was not.
> >
> > Fix that.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> For bridge support the only thing you need is to set
> drm_encoder->bridge. Why do you need to hand-roll your own bridge
> support? That pretty muchmeans you'll do it slightly differently (e.g.
> you don't bother with a lot of the calls), which will make sharing
> bridge drivers ever so harder. And also reviewing code, since using
> shared code but slightly differently is really confusing.

Because I overlooked it :)

I'll change that.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--opg8F0UgoHELSI+9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRdL5AAoJEBx+YmzsjxAgmQwQAMB4NgJLyyr0/cLzGvYDoSBW
LmIllM/WFiU1xGySjTtymYKL44qSihgDPBtg/8VZuGI7BaME5IBguZXklUtkdSKp
kGRoue6D5Nu3Ra3fxoyjxgj74DrD82j6XheCUe05kQtsaAcLFG/UpwS0XU/ZlaXk
jUXABZmQyxaZXMjJP3akntWvOUUOPAGSn1HpeMYJz2mggNn1rgHnpfWwX4mv8NBd
sF97fTz2trm+7VJECO9N1CtQUqzW5TYPg7N0KBAkE2bsR2B2VZLJGRItQhzOp/k7
wlM1a7dirqHfsmuOAgimgjuaaIwPX7JWtJU7Odznp+eT1873c6IQ8ysbuSPzjSkm
vl1VyUfqr/a8IbQK0WqFywY2YPBm1DBdRu8Vify06RV5xGICY71yJPQiB1tNsXe3
6mq1UgCp/+lMsLoOTSA+7RWUBaGTh1ZyC6qOCGv1cWNZVHE64SS1a4RHuTO6libx
+m1+04E2ldAKN4RGFMldhYBs0GicY4dQEw5blgfnQnPPXMYDjTciepoOqKMxyPrr
h9NdaSXSNzmMvkWNp7DQFj5JPYAXHnc/d5Sfg5o0uencXRf/fyuJUWNChWnW4BXG
WDDIwgw79ev/9e0VfLPu/Gbkp5Ir2wBtuLLKz4gz4uFU04Csy+OL4BdiqKYkKe3b
kUNOw44KXVAJ97mX/Jze
=1f8a
-----END PGP SIGNATURE-----

--opg8F0UgoHELSI+9--

--===============1247977398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1247977398==--
