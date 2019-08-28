From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 07/10] regulator: mt6358: Add support for MT6358
 regulator
Date: Wed, 28 Aug 2019 11:45:55 +0100
Message-ID: <20190828104555.GE4298@sirena.co.uk>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-8-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566531931-9772-8-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2019 at 11:45:28AM +0800, Hsin-Hsiung Wang wrote:
> The MT6358 is a regulator found on boards based on MediaTek MT8183 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.

This looks good - since there was only one small issue with the example
in the binding document I'll apply both patches, please send a followup
fixing the binding document.

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mW2IACgkQJNaLcl1U
h9BSkwf/dn5XU4gEVNtDS9XFnqmJE1/jcGPItKtO0MNfD3jrB/hUyBWMYoBhI+sU
Vm45cGP+4DM/3BcJrj6qrmvgSmYZtpf6vn0RljmVuFlo5SOk4y4/HI8i+gdjcrER
26tolRdFTgR3sbVDa2Wyzz6eCdz0UhoC69q4qQccEjgetw8GuXQHwGARR3NeXxVp
4PCsUEKX5IxcOIKr2/1Y50W4HThACHgvoNAp/GK6zjSuyH17HKgZfSwh+p1sNZ4N
a83mggDEu1rOgsiptGPtO/U+y2pNNnXNqX/+Xsnna6jkCkbM4hnGMLqvvMJlsGaC
iVNyYaPdnO7o3Tqq6wzJbpXH6eKI+g==
=VmT8
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
