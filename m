From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 1/5] drm/sun4i: rgb: Remove the bridge enable/disable
 functions
Date: Mon, 10 Oct 2016 10:31:24 +0200
Message-ID: <20161010083124.GB3462@lukather>
References: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
 <5100ee37c9bbb53f8227bd38f1d3160e507c489d.1475740611.git-series.maxime.ripard@free-electrons.com>
 <CAOw6vbJ5C95rxK6--zEintO=qeu+Pm=OcvB+SYzQuvz5pSQaaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1497130827=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOw6vbJ5C95rxK6--zEintO=qeu+Pm=OcvB+SYzQuvz5pSQaaw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1497130827==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2016 at 03:43:21PM -0400, Sean Paul wrote:
> On Thu, Oct 6, 2016 at 3:57 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The atomic helpers already call the drm_bridge_enable on our behalf,
> > there's no need to do it a second time.
> >
> > Reported-by: Sean Paul <seanpaul@chromium.org>
>=20
> Reviewed-by: Sean Paul <seanpaul@chromium.org>

Thanks, I just queued it in my fixes for 4.9.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX+1HcAAoJEBx+YmzsjxAgN2cP/3GbxozL7bqAvztKTv+Hw9WJ
91tkEC1oz8GqJzUg+uVz2Drv9fMO8eLyLVncvryubL6IwhSu/45odhLiV8zcAyqM
xCc5+5kvwfCdCqC6zvGhUxuUujGZBL0bgaq7R8reaPLlCfBWmnHJM3n8K2K5khiZ
cKou5EWAwIv8F7xou0SEExy65uc5Dv/XMJ5/feo8F2f/gw7IWgYp4Hek150hztYq
CvLuzVUv6YIOG56WGqEmvKNoS1Kypg3hAcldo7goDR/Lo93ytFCi+DzAYnMs/S74
qVcZp+4qqMRZRgcoGQreymTNsc/mvOWhKhSET0vQVfMfEnz5uU3A1ePjLvdRQGps
buTPi0IBINnki+SbN5429sXgxdgq4nS2ZKzwUCVuAOod2FKiqvY2dIEDzRgkdLbZ
fAi6B4onPG8TN2krUGOhWHQwW++OLzSr6bnpHMGCLh4AEittxqN3uqnphzu5Nriz
I62pETDSPYvTwNKdgbE9Gn/pO+9T6wYJUyzdNGrtmXCGJ8Z6m8oOTNOuH0fvv4ul
xwLRGGgMNalRmvjWcZ3pUvfpG0Y25VCrUkqF9V4s8wwotD7XLn02KrCn63/tlQZZ
cQZUHKjs05MX6hegffOr95gurgBX5enpM7NekfL935+GDMEx1BmlzVdtdoYOBk33
ULOMg0k/B1hexDhksZyp
=cLbO
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--

--===============1497130827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1497130827==--
