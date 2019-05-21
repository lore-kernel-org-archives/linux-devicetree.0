From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [RFC v2 4/5] dts: bcm2837: add per-cpu clock devices
Date: Tue, 21 May 2019 13:40:47 +0200
Message-ID: <c259e5166d9f6c2e1db3bcbec6dc943e578ebef2.camel@suse.de>
References: <20190520104708.11980-1-nsaenzjulienne@suse.de>
         <20190520104708.11980-5-nsaenzjulienne@suse.de>
         <af50c1e9-5f52-e06b-8d0b-c9f72fba1324@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-XdardQecTGOsrtJ31nRH"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <af50c1e9-5f52-e06b-8d0b-c9f72fba1324@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Cc: mbrugger@suse.de, viresh.kumar@linaro.org, rjw@rjwysocki.net, sboyd@kernel.org, eric@anholt.net, ptesarik@suse.com, linux-rpi-kernel@lists.infradead.org, ssuloev@orpaltech.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--=-XdardQecTGOsrtJ31nRH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-05-20 at 14:19 +0200, Stefan Wahren wrote:
> Hi Nicolas,
>=20
> On 20.05.19 12:47, Nicolas Saenz Julienne wrote:
> > The four CPUs share a same clock source called pllb_arm. The clock can
> > be scaled through the raspberrypi firmware interface.
> do you see a problem with applying this also to bcm2835.dtsi and
> bcm2836.dtsi?

Not at all. I just need to test it first.


--=-XdardQecTGOsrtJ31nRH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAlzj478ACgkQlfZmHno8
x/7yYQgAnqgXYhdAshV8U4gwtS+/dHnDGQp1/PL1XVVLYWmuHP2y3SO5fVlw6Ebq
ckR3ubP2gvpOOeBbDD/py+EqkT6u089s/e4v/Duju0rM3AX34z4xtUaVGSZwZ/pv
Bi95Xz7KRumD9YbUBCXoFGMzRwlAwKIz3EN7Q2U3B6oPZneavK8ipSjYm5XobWE7
7oB311KX909ENnlR1iOZGYh0HjX0fEkPb9aMkNp6xyxc2zJOPVMUD7anPwWB4b06
YymlQO7FJHpq9ZBaSFQhh5b/FuqpaZpa19GmyoHiGZoJHfZ1QmD/op6addi7DZa+
lt2LuUfBE/MYUaVA33mQNsx3Vgh14Q==
=zGgQ
-----END PGP SIGNATURE-----

--=-XdardQecTGOsrtJ31nRH--
