From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 05/10] regulator: Add document for MT6358 regulator
Date: Wed, 28 Aug 2019 11:44:03 +0100
Message-ID: <20190828104403.GD4298@sirena.co.uk>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-6-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566531931-9772-6-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2019 at 11:45:26AM +0800, Hsin-Hsiung Wang wrote:

> +	pmic {
> +		compatible =3D "mediatek,mt6358";
> +
> +		mt6358regulator: mt6358regulator {
> +			compatible =3D "mediatek,mt6358-regulator";

This still lists the subnode compatible string which has been removed
=66rom the binding.

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mWvIACgkQJNaLcl1U
h9DRhggAgRvC7U6BzuvYz9spXJ1dhssJoo4Cnc4KMXUuUQ6QoLUsAWOp6czaDVMi
2RNmm2MTbOfyXQs/lYDyEmNCxNCevItzJzxx0F1ny9EQ43yUGc/eoV1EqQB4df/j
SmqBQi1AbtM8eftJ/qtYfjGpuMgvch335oKN0YlpdsKgbT05CRlywkciokwd9D/N
+ZikuKYjDNep1358Y/axhdaeGBjwIC9YaUh9TYZ7oRE6U8H4hacfkSiCp76GYzn3
Wta9GRiHSlYxkiUgqDT7C6sqwDNfeIq68hda/2FoveacCOU9brIy8BwRC53amB95
adi4im7qPsNIUHUNKl7lgztsd8jrSw==
=HBf8
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
