From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: Add LED device nodes for Pine
 H64
Date: Wed, 20 Jun 2018 10:43:38 +0200
Message-ID: <20180620084338.s3r7l5nvrp6vnibg@flea>
References: <20180620071341.8143-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2048276796814220527=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620071341.8143-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2048276796814220527==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ko2iw5d4ve7d7yo"
Content-Disposition: inline


--7ko2iw5d4ve7d7yo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:13:41PM +0800, Chen-Yu Tsai wrote:
> The Pine H64 has 3 GPIO-controlled LEDs, which are labeled "heartbeat",
> "link", and "status".
>
> Add device nodes for them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--7ko2iw5d4ve7d7yo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsqE7kACgkQ0rTAlCFN
r3TWFQ//ePEt1R1vGVCT9B33EkYAuLdzF4wnOXbkLB/7rWT7kX44I/ZZy3fABL0z
pNMUlqsmN+gVsMKMcjPu45YVfRZ18OhQYs84/c3ssbzqMvT0AhjFozns+1rN9N4z
PLqXmaFChElb936JT8cp0P0Vt/6FEvXE91xeh1/lKbrONYK6DPbgoJqW2twVsQLR
RlTrRTilSCDnBn8aPC+Q+9NgAMcvq6H8yKEpsdHFXekmYxJViX4cqXvkVNtVVTOl
z9NCKSUEwmu8DQOl7eZXcz4bP7zI8jSXNj6Ecirop/Za0uREFA+q6beFmzD3IZ2c
rGUYQSN2UuOEaCIEd78I/4NDkOr0d6H9KlInIjvSWm+yPQqsEg9O8O39L1EWPo0G
RfAFKRQ/mEjoaNCOUNmudJZqCSczIfnLykFnkQVOAiYbw8AFoJg3M6YqBIz9Y1mF
s3V/LNSX4VI6foldJSQ87izTae34bafeRK7N3b6eOQEMFZkVk/LD+ioMOIsAvl2p
BV07TNn9OtFQOuTaehgDz4xkY/hVnTbUVptdkwMgPbbfXFCbQVcPJ++OPPqo37Wt
kv7arskEgBXYbaZqG30SEDYvTGBUu2XUhiy3mVig0Nbb3gD4aCs/v7/WLmSu/HUz
Id/SklULINWSMPhodhfmPZ5hq6ir6cXx84DFKdxYHHp1i3mX3ew=
=uWHL
-----END PGP SIGNATURE-----

--7ko2iw5d4ve7d7yo--


--===============2048276796814220527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2048276796814220527==--
