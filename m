From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 6/6] ARM: dts: sun5i: q8-common: Enable display pipeline
 and LCD display
Date: Wed, 25 May 2016 14:44:45 +0200
Message-ID: <20160525124445.GJ9232@lukather>
References: <1463500571-28970-1-git-send-email-wens@csie.org>
 <1463500571-28970-7-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1771135943=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463500571-28970-7-git-send-email-wens@csie.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1771135943==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4vpci17Ql0Nrbul2"
Content-Disposition: inline


--4vpci17Ql0Nrbul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:56:11PM +0800, Chen-Yu Tsai wrote:
> Q8 form factor A13 tablets have a 7" LCD panel. Unfortunately we
> don't know the exact model of the panel. Just pick a panel with
> display timings close to what we know.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--4vpci17Ql0Nrbul2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZ48AAoJEBx+YmzsjxAg+vEP/2uIEAYbDt4MEFAdVViDPjT1
afQe9F8gAPwepI24/h23DJeCKw5wMHJHH8VLmSCoNtBRpCu12UjtqorqMEYMjBGY
Vsxu4OGR4l0NY1ofD+yNJuZRTWmN4sdlxSG2jFrpUVMEzlFWUk8tV50D8mfK8/9Y
rB8iSHgBIVH2Sel5nvwV/EAdQWYvdPl6kHDZl6qBCe71rIO+V4qTfhItDEtHoZg7
nKeFVyYeE7stj4cSSRQqJDRbWVZVvFRQg0KdJviniLQ4i66H1cp4y8F2PjvdDrtk
9VQvjBDapXu2AcUNeLsTGYqwIx1jdzxNPAhTMRpNW8JwUbsSkbn8JFA0flLxnVfG
FAgW9Wrg0m0Je0++Y8oCn8+v8uptX2LgePHkwzKTLrlfIg6qMPr3VrCaZGuQ3SD4
mzXACLQSAP0fs7XlqEZCDQOv2w06lx5TNlTFRcInlgYw7+XYsRRFgryI+uRuPJtl
9ATpTl8czBNKPe1kZ23iUlN3ePIG8TLX27fBgv9cQyBFhvucJpMqxdFLSxRZiatB
Fajlinbg0gINB8Pix+a5y8XDJi1gKkQEE2PI/8Po7+o7b3CJbBi/MbmDRGrekfsU
+osKaZXwXyv+72gfT8gvdSUHROoibjAyjKNXBBNYx9M2rZtKFwAvMd/JXyfvVYNV
+jmnsOq1FwykKepv+PFx
=ILgA
-----END PGP SIGNATURE-----

--4vpci17Ql0Nrbul2--

--===============1771135943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1771135943==--
