From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 4/5] nvmem: sunxi-sid: add support for H5's SID
 controller
Date: Tue, 24 Jul 2018 15:00:35 +0200
Message-ID: <20180724130035.cll6mdqiqjbglotj@flea>
References: <20180724101522.68165-1-manu@freebsd.org>
 <20180724101522.68165-4-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nm3mmu4m4ctttuip"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724101522.68165-4-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--nm3mmu4m4ctttuip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 12:15:21PM +0200, Emmanuel Vadot wrote:
> The H5 SoC have a SID controller that looks like the one in A64, but
> in case we find some difference in the futur at a binding for it.
>=20
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>

The prefix in your commit title should start with dt-bindings: ...

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--nm3mmu4m4ctttuip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltXIvIACgkQ0rTAlCFN
r3S2Ww//SZXZFeHH0RfRbLisSsuK1uOTqOmE+jhFVncjJ/8tJ07hLBN321sPnED0
e3sG8H2w8ZddGLPFoGpLnIr6kC0Q0pA/Igp1V0yLMo+IVdSMKUNeg8qWkYbX/0sR
CZ1yGIn8TOjkUYlxuMTgKNUQYAtBoK16YCh5+6zszIYUWiw4lKojfjV7XXiHw19D
et8Qk4GOVsTVf98Ae4NIFuHh9nkr/eaZHH6GTI4N9kYCo8GCymEbQXLZd26GjIu8
RqNi5sWqc/XowXGeUz8Hao6mNQKiiP4kR9CEWBhCPrrcg1TOXewgV7rdAqT+T/sL
b14O5m7ewhY4Cd4ti/O/zuUB+UZoYjcAoYuJzH10aImbGEfTgsITkOMZiAqRBcI/
nfmjBv7XyJiqufZNBAQMDKnl0nQicKT4Gk7L4n15onS6Hw95OJBMbhiEka/Q1y0z
WB6XdEk5Qo/HoWbRYgA98xpfe6whjmSAxGAeXR/KMrL6jcib2QKYPmp20XSBM/oY
8BHclVOclH1/E7nV26Wm5Hv8yuzrXDBEGYaxawEE4lRi2Xzv8Z5vwhFb5XaAsOiD
tuDzX+JwRwoxl8k/mes32Aylzzxlzxk3YqAduB5wvvTiVewCsaRmRl0A5Uf9opI2
XWttK00vtT9gxAcWAwG/HAx1MI6hG40AUk1IcCww5tBipUT1Gy8=
=Ataw
-----END PGP SIGNATURE-----

--nm3mmu4m4ctttuip--
