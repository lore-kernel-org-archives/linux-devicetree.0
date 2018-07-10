From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: Add Innolux P097PFG panel bindings
Date: Tue, 10 Jul 2018 12:58:12 +0200
Message-ID: <20180710105812.GM1504@ulmo>
References: <20180702102721.3546-1-heiko@sntech.de>
 <20180702102721.3546-4-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0225045865=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180702102721.3546-4-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, hl@rock-chips.com, briannorris@chromium.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============0225045865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yklP1rR72f9kjNtc"
Content-Disposition: inline


--yklP1rR72f9kjNtc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2018 at 12:27:20PM +0200, Heiko Stuebner wrote:
> From: huang lin <hl@rock-chips.com>
>=20
> The Innolux P097PFG panel is 9.7" panel with 1536X2048
> resolution, it reuse P079ZCA panel driver, so improve
> p079ZCA dt-binding to support P097PFG.
>=20
> Changes in v2:
> - None
> Changes in v3:
> - None
> Changes in v4:
> - None
> Changes in v5:
> - use separate file for binding
> - keep power supplies as required
>=20
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../display/panel/innolux,p097pfg.txt         | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,p097pfg.txt

Applied, thanks.

Thierry

--yklP1rR72f9kjNtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEkUMACgkQ3SOs138+
s6GnaA/+IbOAdh4Ukf/wjiUROgmRLBJRTU90II48NoI+3zWI8QHxd/K7P+ePjOee
REiJ5elHYuQzefyIHPvJs/ScpNOs10HiY4xN3B7YsUpljQucuut0G4/WVSL/eOLL
iqnbsgXjkzAeHhE/ss3cFB09VeYNpl8JxJTzsf8DuD/xbcbqcMei1XOOg7lWLuZp
1nPve0nOfyf6bzlD8FJBYxbp2KD17cH6qwFyutEA2HvPmc2LxiLLd9EcPgvvtn8M
RjjmFytwGO5vf2fqp6rXWjz4Lha0afHjcbWcWjZhHH14iohA2Ec63tR+P3K+JBvH
wsgRhpsuqppEsB7Y0zekqN4++3MRgcj/YqUqvV4+UJlpwq/0kyd6bMG0AqE9K1X3
C+HzXc8mfb6fN5bCD+qkAR15vHy7wPuKyj34iyQ8zAd6GFMfQ4/CaB3hGuqRjhbh
TlENvRoOzYdmAbE3tiB+Vm+QZ1rBNpwjlhvHcUSloBx5RugTCJA8znwyWcFfUh98
rLYEN9cd5di/jH8riMf1UEsCqLdFfEIzL/WCnyMM31MBHAMWLZWnGcuzUVW2R7b6
doWhrVGfDh4UZlHxu9mAKBt0labIBFjL81nOA+dGSiXFwgKBRUJjBApnmmNTDNfN
1VvqB5dQvYUm0IeKp15VbiWOYcdyAZ8XH7Zuc285tujg6X2RySw=
=NN3k
-----END PGP SIGNATURE-----

--yklP1rR72f9kjNtc--

--===============0225045865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0225045865==--
