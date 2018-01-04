From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 09/11] clk: sunxi-ng: add support for Allwinner A64
 DE2 CCU
Date: Thu, 4 Jan 2018 14:41:30 +0100
Message-ID: <20180104134130.dfh2qbhcvo67zu36@flea.lan>
References: <20171222122243.25735-1-icenowy@aosc.io>
 <20171222122243.25735-10-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0624996355=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171222122243.25735-10-icenowy@aosc.io>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0624996355==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vey4lzzuwtjmi6al"
Content-Disposition: inline


--vey4lzzuwtjmi6al
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2017 at 08:22:41PM +0800, Icenowy Zheng wrote:
> Allwinner A64's DE2 needs to claim a section of SRAM (SRAM C) to work.
>=20
> Add support for it.

That's highly suspicious that the clocks need an SRAM to operate
properly.

Can you elaborate?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vey4lzzuwtjmi6al
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOLwkACgkQ0rTAlCFN
r3QVuA/7BKDQF9s38/X7rq2BLnI01Qon26NAH53tdQ6EX8wjDyse2gVWcoOt3yph
cslsPHh4o1OoZzd9Xp4+Jr3niRs27D02o+KNUpIb5VtIJcrUz//Bp36E5qLLqF8S
AD9wlwzsGO8ZcrMKonlmKvzhW807q6FaxpST2AHqOCdXe4iuoXILmhyXrrPntxQW
HXtMJ3/zJCTQjkcJrwA00Apz2xPgr5CRPDa99OVxLmFtfd+pZPKCRWoAnLYTB2rb
uyVHCldIDq6/OZYkuFwUS0yrDgev0LrERyL+lDLkkriElj9bnpMP3gLJhTLkEtbQ
newFdehxcwPBg88fUweKKyedM1OJKz4m96ATZRi6pf2Yuck3866qFqvItb6mFLzJ
jGlYOugqnH0FVlGrFL4C40nNwPhJ7ba8lFEGYvi8muxRrQIFGoi03mBJvJoFcdOq
u5DA41bV2v+Ckna2WH4DNQLG35JPXDQTyxJAN9toxwSxYwmQLQo+757Rt9fda+YD
liP9CgdqA8GPCtOe4IsUaRGW8d/juyLAKEwzERhSy4KLwB/vS/a5xeV1Pdq7kLSl
asu1juk3fbH4cPZRdmipkVMWI1m7f+0M+nCQjFfOkxf5coF3xQxNU622YGVFmngW
a6rBB0CvC5lJSx69qpoxDLhmddxkk7xNYECoWYS93MidvA8NCj4=
=XbsJ
-----END PGP SIGNATURE-----

--vey4lzzuwtjmi6al--

--===============0624996355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0624996355==--
