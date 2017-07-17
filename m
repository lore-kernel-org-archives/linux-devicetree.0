From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] dt-bindings: display: sunxi: Improve endpoint ID scheme
 readability
Date: Mon, 17 Jul 2017 08:21:02 +0200
Message-ID: <20170717062102.za55es6ejikkkcqv@flea>
References: <20170614063016.22069-1-wens@csie.org>
 <20170618140536.dr6ck3chaglfgz6t@rob-hp-laptop>
 <CAGb2v67wZ_dg0T1+_NuzatuuuRZ2eAQo94KWtSsEJk_0HmU6qQ@mail.gmail.com>
 <20170711193111.p6jdyesluuqdlu3j@flea>
 <CAGb2v64aoXsoE=YL_PFLkdU7rBZdpqhg37CKuQU-1F+SV9=zcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0119824210=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v64aoXsoE=YL_PFLkdU7rBZdpqhg37CKuQU-1F+SV9=zcw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org


--===============0119824210==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x7vgo7jo3cic3ydt"
Content-Disposition: inline


--x7vgo7jo3cic3ydt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 12, 2017 at 10:38:38AM +0800, Chen-Yu Tsai wrote:
> On Wed, Jul 12, 2017 at 3:31 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Mon, Jul 10, 2017 at 11:48:00PM +0800, Chen-Yu Tsai wrote:
> >> On Sun, Jun 18, 2017 at 10:05 PM, Rob Herring <robh@kernel.org> wrote:
> >> > On Wed, Jun 14, 2017 at 02:30:16PM +0800, Chen-Yu Tsai wrote:
> >> >> The explanation for the endpoint ID numbering scheme is convoluted
> >> >> and hard to understand.
> >> >>
> >> >> This patch aims to improve the readability of it by combining the
> >> >> existing two paragraphs, while also providing a diagram example,
> >> >> and how endpoints should be numbered based on that example.
> >> >>
> >> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> >> ---
> >> >>
> >> >> Hope this helps. I'm not sure I can improve this even more without
> >> >> spelling out all cases.
> >> >>
> >> >> ---
> >> >>  .../bindings/display/sunxi/sun4i-drm.txt           | 36 ++++++++++=
++++++------
> >> >>  1 file changed, 27 insertions(+), 9 deletions(-)
> >> >
> >> > Acked-by: Rob Herring <robh@kernel.org>
> >>
> >> Maxime, this patch seems to have fallen through the cracks.
> >>
> >> Could you queue it as a fix for 4.13?
> >
> > Sorry, I don't know why I overlooked it.
> >
> > Is it really 4.13 material though? It doesn't look that urgent.
>=20
> Unless I'm mistaken, this clarifies the numbering scheme introduced
> in 4.13. I'd say that's enough reason to have it in the same release.
>=20
> But I should update the diagram first. The backend <-> TCON mux is
> missing. And maybe a Fixes tag.

If it's just clarification, I don't think we should push it as a fix,
but and it can definitely wait.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--x7vgo7jo3cic3ydt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbFdOAAoJEBx+YmzsjxAgEU0QAMLsNvLri81uJDMs9cHwkIFS
MDlw8ft0N6NInL5fhM9wxtpJ73zVf+B1lS21RP852SXR7XorZWmHSnLZYp3/FFJE
72Jl1N3/qoVRUj5i0rrRIELsynxrh20IWfgl2NKuH3BdnuFtfk9o5vIiTnfI2W01
ZOx+6hJdpwZehPoGKS6Ozy5fw2LK1kor1Nr6AQ+YB+iIaiwNc1PvTI/RbAI3oY/3
DEbwTTqyXLv0dwIx/axQ8FsSadNE9UyTtdCydu3ouJn7xDsz0F7bFjy5rSfTJ/M+
Nj6OX8k41HaNbuueFoHigJiq06+HNsCB5T34P1rktodR84eo7wwlD4n3h5rbRd5B
nbyCzpDc291MZ4ScDCKP7AHtGTr/Bn0StKk8/V0yGbaQXiqMRWW4SKUQsNlERqM4
t9bqNsy1QhC85u9m1c2D+sTwjab23oHSf+TmL/qPw7OlT2YmCrsFcKT8om0CfcmA
8e51m7BJTaIL7d72ZBMW0dRiIWsgaUbGMiq63QSsWbnA9V/VsRzLlRCuk0jPdwPd
Xh5X3kgq0QqYyhluJQmtPeAWLScb9zrjQUVtw/QGKR1OAQzALcHJvrYVkiH10S4+
W4vhFm/jo3fwJz7bQHleLIV06J1tIfZjy3Y3Ds3vLHYkbdYsEqMvaO3S1xhWZBM9
ojEOAjEL8Yin5oJjAd4B
=sEfd
-----END PGP SIGNATURE-----

--x7vgo7jo3cic3ydt--

--===============0119824210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0119824210==--
