From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
Date: Mon, 17 Oct 2016 08:56:16 +0300
Message-ID: <1e23c3e9-d34b-1d8f-8565-c9932a60fd32@ti.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <1475672732-17111-3-git-send-email-bgolaszewski@baylibre.com>
 <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0266706477=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan@gmail.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Karl Beldan <kbeldan@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============0266706477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="r5xkqjl6GgfEiPEQko1vgGrPfBciXsM4A"

--r5xkqjl6GgfEiPEQko1vgGrPfBciXsM4A
Content-Type: multipart/mixed; boundary="1UvQnqg5gNLv4C6hk3CkR9dDeWDefE9HH";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Karl Beldan <kbeldan@baylibre.com>
Message-ID: <1e23c3e9-d34b-1d8f-8565-c9932a60fd32@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <1475672732-17111-3-git-send-email-bgolaszewski@baylibre.com>
 <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>
In-Reply-To: <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>

--1UvQnqg5gNLv4C6hk3CkR9dDeWDefE9HH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15/10/16 20:42, Sekhar Nori wrote:

>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dt=
si
>> index f79e1b9..32908ae 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>=20
>> @@ -399,6 +420,14 @@
>>  				<&edma0 0 1>;
>>  			dma-names =3D "tx", "rx";
>>  		};
>> +
>> +		display: display@213000 {
>> +			compatible =3D "ti,am33xx-tilcdc", "ti,da850-tilcdc";
>=20
> This should instead be:
>=20
> compatible =3D "ti,da850-tilcdc", "ti,am33xx-tilcdc";
>=20
> as the closest match should appear first in the list.

Actually I don't think that's correct. The LCDC on da850 is not
compatible with the LCDC on AM335x. I think it should be just
"ti,da850-tilcdc".

 Tomi


--1UvQnqg5gNLv4C6hk3CkR9dDeWDefE9HH--

--r5xkqjl6GgfEiPEQko1vgGrPfBciXsM4A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBGgAAAoJEPo9qoy8lh71XTAP/Av1WgGRk9oEsEGN3KCYHALp
2AxBwfwD/2mZsyYJCdH6Gklxb+vYOE+ePMkCEi6SMj1NKox8OJtAZxQR1cHxSqjP
Mlu3ABifQHQsw/kiYl5Tz+OJbJOSRj3wUYeIEtqzotCktrqatWeRi5vWvnEkfZCV
t4yuyT7EW122qhrSW1tDSN9drQvjtJoqobbqEVfgZXoc1fMiIjRA8NbILHSqT+A9
d5vpmkgfwBJgvEywuuGk7FkKR7hpX89YUDFm1KBmBonxd+TDiYjiFjSTMclmfm0x
KP+8V7wEzxyZAZRWTwzbXWXucZok7ymqV6h1RVs7iDGI65AGDvX4OUp9a1zu9+LK
m/50LmDo7g5bpTpn5tqNxbnXvF0WQujTI+Rh/+8rIq6cyJyoezPCpk26TX0DTpPB
aTtf/rbmDf5NCA54PqP4Em/ORu89ut91ENqrYBqm+iBxOdo+hGHlfh/V/OAVbrtJ
hOWcupUbaB+h5cjcZEm5QzUhHuP0dt93KnEMqmQABcJOA+b2qhgaJpu6NE2xZaFg
IbB3fA3L/wpE10uFTt6pUV9jCBUv0shZ0tp/Kobvx7L6DyriXPreaonLsg+8zH04
zGjYUBKNpyKT99Jf5HevsfDrNkJJwCZOBlailIq2TWZsrpYIL9PiI3+wu+GLlerT
VFD9ewvYgGbZxZLAagWI
=FR00
-----END PGP SIGNATURE-----

--r5xkqjl6GgfEiPEQko1vgGrPfBciXsM4A--

--===============0266706477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0266706477==--
