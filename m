From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] dt-bindings: display: sunxi: Improve endpoint ID scheme
 readability
Date: Tue, 11 Jul 2017 21:31:11 +0200
Message-ID: <20170711193111.p6jdyesluuqdlu3j@flea>
References: <20170614063016.22069-1-wens@csie.org>
 <20170618140536.dr6ck3chaglfgz6t@rob-hp-laptop>
 <CAGb2v67wZ_dg0T1+_NuzatuuuRZ2eAQo94KWtSsEJk_0HmU6qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0460398583=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v67wZ_dg0T1+_NuzatuuuRZ2eAQo94KWtSsEJk_0HmU6qQ@mail.gmail.com>
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


--===============0460398583==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7m3pnjaw27vlnret"
Content-Disposition: inline


--7m3pnjaw27vlnret
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 11:48:00PM +0800, Chen-Yu Tsai wrote:
> On Sun, Jun 18, 2017 at 10:05 PM, Rob Herring <robh@kernel.org> wrote:
> > On Wed, Jun 14, 2017 at 02:30:16PM +0800, Chen-Yu Tsai wrote:
> >> The explanation for the endpoint ID numbering scheme is convoluted
> >> and hard to understand.
> >>
> >> This patch aims to improve the readability of it by combining the
> >> existing two paragraphs, while also providing a diagram example,
> >> and how endpoints should be numbered based on that example.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>
> >> Hope this helps. I'm not sure I can improve this even more without
> >> spelling out all cases.
> >>
> >> ---
> >>  .../bindings/display/sunxi/sun4i-drm.txt           | 36 +++++++++++++=
+++------
> >>  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > Acked-by: Rob Herring <robh@kernel.org>
>=20
> Maxime, this patch seems to have fallen through the cracks.
>=20
> Could you queue it as a fix for 4.13?

Sorry, I don't know why I overlooked it.

Is it really 4.13 material though? It doesn't look that urgent.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7m3pnjaw27vlnret
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZZSd/AAoJEBx+YmzsjxAgzDAP/2ifXkBet9XfeWFFclTjmyI6
Ffbd7bh9U5YTMBqZFWtR8MhuCsvSmSiqBXVEau3Qb05qT+sp+bD3K9MhdgLpRklz
AYivZ2Jez7MG6ikqtZgLBCatK31Tcueb5U65r4swoooouErVi9gAI8ngEQOAIyzV
PrOg3cCCQ/c6mrtoJpXHFswB1K1Zmqi4sDxB0leIuEWTzEIDdjW9oQLv2o2FIbOI
Cscq8mi3SBlhbEHDLE2wehmRZ09BLwYIYsl3h4Hjxa9xR1Xzv/NsZFDFFCVKnwZ2
OS1H8BC7RxikPO3BxNG9+HqkMTr+NcT6NI2XpLB5BnQlT57M1ywssPgq1Bsv6eAh
BzQMwaMa7NpTrwvCPX+w9nzieb7AjskJybkgEZ72/MDjNZfNmkqh9bG8aMNKOoJY
4pnhsVwUOh4Sa2GKDixysnGaY8nr8Ds2JFReURZSihGfLqZNM3yf338YSbelrNyn
vTVrs0LiiQw3TDmvmdV7FMuQtqocgY09iJlPGReCgwZrcbMQnjwqcZ7Tjk3A0VVH
2E8rfXn27D93w/AcjzZ05KvbJOIPnGSI/AlsgQYJBk3ncMavXlJo+cF53G4EvgEw
/cy/eIi3LfuJ6n4nFme17w8AnXaB2GZDqzNUK6ybKa01LVNhd7P/lX2mUIjyb6sL
OBl7SSS6LG3hoAPXb2ut
=u1h2
-----END PGP SIGNATURE-----

--7m3pnjaw27vlnret--

--===============0460398583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0460398583==--
