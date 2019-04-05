From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: Improve sun8i NAND transfers by
 using DMA
Date: Fri, 5 Apr 2019 11:38:18 +0200
Message-ID: <20190405113818.4dd5206b@xps13>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-4-miquel.raynal@bootlin.com>
 <20190405091807.itjp5uvsoqdfbm2u@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5336572785693999518=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190405091807.itjp5uvsoqdfbm2u@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============5336572785693999518==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/fJprKWxm.XYVgpO+/RDR/f="; protocol="application/pgp-signature"

--Sig_/fJprKWxm.XYVgpO+/RDR/f=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
11:18:07 +0200:

> On Thu, Apr 04, 2019 at 06:21:11PM +0200, Miquel Raynal wrote:
> > In the current state, sun8i NAND controllers use PIO during
> > transfers. Throughput can be increased thanks to the use of DMA
> > (mostly during reads, because of the ECC pipelining feature).
> >
> > Besides the usual addition of DMA DT properties, because the sun8i =20
>=20
> The only thing that "sun8i" means for Allwinner is that the SoC has
> Cortex-A7 CPUs. You need to be more precise than that, why not just
> use A33?

I am always confused. I'll stick to A33 then.


Thanks,
Miqu=C3=A8l

--Sig_/fJprKWxm.XYVgpO+/RDR/f=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynIgoACgkQJWrqGEe9
VoQR5gf/V1zoo50dot4Qi7vWluGfiJibRWvqen8W/jVwORD89T6jAO68MsYl1efz
Zpu0GQe2LiFZPcfQONosKIItiN/ulebusz9A718S3l6tNsbBSj3CX/6IUg9yiDul
ZHV/+YQG47pRojdCLyaA7znyxP3ArobygCidOcf2gOcQdU9jzsUXRT4P2PH7cLlQ
iUrraiJf0pSvagTWRCBqlVbjdg8Dvzu/EUNOqBu/0jZaDFrjILRGsSNk9VhqOkAK
7SjLYqPfkkMUVbyL9wPbKPZEc+0EUPxkqB05zkZheo0nwTIkhRgkEWhHLhCwuVhu
NOsZUrKouHqrka6P+kDxNCbGTbq9BA==
=HoTh
-----END PGP SIGNATURE-----

--Sig_/fJprKWxm.XYVgpO+/RDR/f=--


--===============5336572785693999518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5336572785693999518==--
