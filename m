From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Tue, 31 Jan 2017 10:56:22 +0100
Message-ID: <20170131095622.ew56cyjrndu6wxwe@lukather>
References: <a4d90de597cfcfab5fddeeb538505774a980818b.1485180017.git-series.maxime.ripard@free-electrons.com>
 <20170127201913.jjhdw57jmxifqpxa@rob-hp-laptop>
 <20170130134824.u37svxphyy266tzz@lukather>
 <2a5e7d0a-e2ca-5cc7-5193-96be5bfe494b@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3666970587922134680=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2a5e7d0a-e2ca-5cc7-5193-96be5bfe494b@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3666970587922134680==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2exrgfoo7sh6d7ck"
Content-Disposition: inline


--2exrgfoo7sh6d7ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 05:24:06PM +0100, Neil Armstrong wrote:
> >>> @@ -0,0 +1,79 @@
> >>> +ARM Mali Utgard GPU
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +Required properties:
> >>> +  - compatible
> >>> +    * Must be one of the following:
> >>> +      + "arm,mali-300"
> >>> +      + "arm,mali-400"
> >>> +      + "arm,mali-450"
> >>> +    * And, optionally, one of the vendor specific compatible:
> >>> +      + allwinner,sun4i-a10-mali
> >>> +      + allwinner,sun7i-a20-mali
> >>
> >> And stericsson,db8500-mali?
> >=20
> > Good catch, I'll add it.
>=20
> I think you can safely add the following :
>=20
> amlogic,meson-gxbb-mali
> amlogic,meson-gxl-mali

Ack. Do you need any extra properties?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2exrgfoo7sh6d7ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYkF9CAAoJEBx+YmzsjxAghMkP/R+P0+rq/2y/ZtEG2g30Sjib
LT75iW3KJaQqOdMSp6RxDpKxmijoMZKNsYFq3zOobQ4SfPs3RuTOKpr36z4JtVvK
cHUzhMuD1YC3Ehyth2koJ6Qj3l7eGhRKmui77zZf9SxOSeL6U1P1qLWg9A+AkhOg
jBhPrwwxFmX3OqtjaZcBBXX1DcuHuG6z/TnrMbe+/ZYliQ667GT1/ddPSRn8YDHP
AKAhiSGr9gXuetTkPWERRU9+w4CFQxpcZNv3vxVEycSNErAZp4uSwxO+GNhxxlfF
1G18zvIUTgrjfB40RLmpEnJMAD2m8XEEdZyfrm3Yqtjj2eIVvXohtwyNuR3MZiZr
kOS9cI8HASJq0LKh12PUqtGJ1arD+m7Q54Tq3gLOFv2okvGMoe8a+NnXVQ1ChBvK
1nJQiyK2yyDw3hRWi8j6eheKCPJ6Z3ImPDr8rK4zdu8+YlycDoPSl5LGOCFLk+/v
fC111imM1up5P7HLORfsgh29Nj1F3uJUCfiQBnyUKuMLux6KbTNreK+3Rvskqnnh
PJB4CEEp9/FmuSXErxIqD56VCDz3+EpJ0Z70lWWN2RU45X6GxFcjanfpSHdcTgVk
bTCog16TTIWtr8UbTr7wHYpM4+9M2UtL8IS3erPo+gVp658EnS+oOAd213x/CeuJ
8hSW9LBVHpPuIQdlzD/m
=36GP
-----END PGP SIGNATURE-----

--2exrgfoo7sh6d7ck--


--===============3666970587922134680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3666970587922134680==--
