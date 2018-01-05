From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 00/12] drm/sun4i: Add A83t LVDS support
Date: Fri, 5 Jan 2018 10:39:47 +0100
Message-ID: <20180105093947.kldzo2bdukt4volx@flea.lan>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0893143505=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, plaes@plaes.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org


--===============0893143505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebymzglsx6bane4u"
Content-Disposition: inline


--ebymzglsx6bane4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2017 at 12:02:26PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> Here is an attempt at supporting the LVDS output in our DRM driver. This
> has been tested on the A83T (with DE2), but since everything is basically
> in the TCON, it should also be usable on the older SoCs with minor
> modifications.
>=20
> This was the occasion to refactor a bunch of things. The most notable ones
> would be the documentation, and split of the UI layers in the mixer code,
> and the switch to kfifo for our endpoint parsing code in the driver that
> fixes an issue introduced by the switch to BFS.
>=20
> Let me know what you think,
> Maxime

I've applied all the patches.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ebymzglsx6bane4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpPR+IACgkQ0rTAlCFN
r3S3mg/5AbHVbKQZCBniqOB+FQxPGFT8bXlurCNw1n4GScTJNk+nDWo/bGeFcYNz
/vNp1VBLJTj6BfXZS91HePdTUiY6fM3eewzIWpxsJzHlADLyzFwxqJBb87UYmHnR
+cVhTEiJbViDAtBCdG6OYPaDTjRbWGqklk1c/6fXb6a33wlenw/EI9VxeU/i9Ldu
5JstLaE68IrR7Uj3fq7kUepVK6PXZulsFbsjmal0HKUV4P3OGfbQewh7G87ie3sX
wFQ0zejWEahmFkLoOzdmUMPq+lBYdIDeeG/bxdRFtZ9/FIzSiSiJmwVyuGn/dt05
lVnMOc/ZE8eQDDfJKgmqSOMjb0qsWwLkSzfOin7IaO+ZY5XiWws6U04WgRn5DDMC
VtXcKtNHBmj8cDlXAo4XWoIUvZxX77X4FW2HC33hWBc36CVUc4wrZKBLBXAAzbTE
XeVxnhhHRtRH3Epg4AJsaWqaaUA/nIEMDe0DxAnZkb2uPEVLZcAymAdXlK3mNhr+
7bnl5/2TAJg23eH0iu9t5B348K0Akzi5Xg0Av9Ba8jXPcdLOSNqsjpk76Z7oSwk6
/dzY6Y4iJJELCRpgUhQ+24xfsWHgA9oqraK+Dgd5zD4MqQDQYdQ6ZNQ0qy375pqp
14lJMp3nsVQOJK9Cd2JEhVLyuXMEdIVbCni2wMaZ6u36ioV7g0k=
=AMFT
-----END PGP SIGNATURE-----

--ebymzglsx6bane4u--

--===============0893143505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0893143505==--
