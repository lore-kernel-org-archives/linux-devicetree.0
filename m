From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun4i-a10: Add PMU node
Date: Mon, 17 Dec 2018 14:18:43 +0100
Message-ID: <20181217131843.zpemfzi5a6ksy5l7@flea>
References: <20181216092524.20337-1-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8540956307601358818=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181216092524.20337-1-harald@ccbib.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8540956307601358818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7feknatkyrp4aze7"
Content-Disposition: inline


--7feknatkyrp4aze7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Sun, Dec 16, 2018 at 09:25:24AM +0000, Harald Geyer wrote:
> This is necessary to use 'perf' for cache profiling etc.
> Tested on cubieboard with 'perf stat echo foo'.
>=20
> Signed-off-by: Harald Geyer <harald@ccbib.org>

Queued for 4.22, thanks

> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> While looking into this, I noticed that the dtsi files for the allwinner
> SoCs have no information about caches in them. Is this on purpose?

No, it's just that no one did it so far.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7feknatkyrp4aze7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBeiMwAKCRDj7w1vZxhR
xV/dAP49kSSgnz1C0Ynfl0fJ3U+FV3PvMk90lLyfR1irrC86sAEAhx0OMehaF6YO
9s0989O5nN2Zw+AAIP54h+0TPSeOnwc=
=3ZPY
-----END PGP SIGNATURE-----

--7feknatkyrp4aze7--


--===============8540956307601358818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8540956307601358818==--
