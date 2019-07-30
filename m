From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] ARM: DTS: vybrid: Update qspi node description for
 VF610 BK4 board
Date: Tue, 30 Jul 2019 18:04:51 +0200
Message-ID: <20190730180451.38cad018@jawa>
References: <20190730150552.24927-1-lukma@denx.de>
        <CAOMZO5AxPHHobQQhq30fjLVeSroLdvdT0+GqCWi8it1ejhDONA@mail.gmail.com>
        <20190730175336.382d833c@jawa>
        <CAOMZO5AoSCDCMRKpkWQ=0PwiFG-O9doGaA31FRhDCGmNr7Xefg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FFYaC=52dh2nz5Y2tmjEFGz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AoSCDCMRKpkWQ=0PwiFG-O9doGaA31FRhDCGmNr7Xefg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--Sig_/FFYaC=52dh2nz5Y2tmjEFGz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Tue, Jul 30, 2019 at 12:53 PM Lukasz Majewski <lukma@denx.de>
> wrote:
>=20
> > Shall I refer to the original commit (which added this DTS)? Or the
> > original issue posted to linux-mtd [1] ? =20
>=20
> You can add a Fixes tag like this:
>=20
> Fixes: a67d2c52a82f ("ARM: dts: Add support for Liebherr's BK4 device
> (vf610 based)")

Yes, the above is correct (as indicated [1]), but I was not sure if I
should also refer to the original post to linux-mtd ML.

Now it is clear - thanks :-)

Note:

[1] -
https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html#revie=
wer-s-statement-of-oversight

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/FFYaC=52dh2nz5Y2tmjEFGz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1AaqMACgkQAR8vZIA0
zr1ITwf+P4+TW29l+wXSF2r4SKuAIoARSdCU3NSfGUpLW7gBQbK3x4RXlNnYW2y5
pLsjYgE4yPWa6xv+Eo0oZz23EgmQdXCEmflVB85+CxRJpOPTfL0f1oRNmYXm0Nfq
uQBko26IzNP+LMzSHDqJnaViHdWqP8URYGpMKHxL4lEUbZRfMzpieYt1IgHbCcB0
/H0cx/EFFO3P+txZw7OQwaZSvYhSrwqO9hc645rXXIqqzO+nJ/RtWw5FAgVZHK6g
tGTZ8rMYvWfhh/RuZwZzM7QktcV5NPxlVBagXFLujay/OSs/ENNO7MyWSTjL4g9B
F0ZoHf+Mp8liTvpd9aet/8v1UMB3BQ==
=LT7H
-----END PGP SIGNATURE-----

--Sig_/FFYaC=52dh2nz5Y2tmjEFGz--
