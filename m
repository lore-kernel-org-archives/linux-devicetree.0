From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Thu, 26 Jul 2018 12:57:25 +0200
Message-ID: <ddd25683-d7a6-e900-461f-9bbac3100579@pengutronix.de>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-4-o.rempel@pengutronix.de>
 <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5377226485089391957=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel"@lists.infradead.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, srv_heupstream <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5377226485089391957==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="haHmbca99SwgV2Mcf1ASBoBnfTimQ4YsQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--haHmbca99SwgV2Mcf1ASBoBnfTimQ4YsQ
Content-Type: multipart/mixed; boundary="51zZ2lswdgIvurOM6pfms1gMuequtg09W";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel"@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 srv_heupstream <linux-arm-kernel@lists.infradead.org>,
 ", Sascha Hauer" <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 dl-linux-imx <linux-imx@nxp.com>
Message-ID: <ddd25683-d7a6-e900-461f-9bbac3100579@pengutronix.de>
Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-4-o.rempel@pengutronix.de>
 <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>
In-Reply-To: <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>

--51zZ2lswdgIvurOM6pfms1gMuequtg09W
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 26.07.2018 11:49, Jassi Brar wrote:
> On Thu, Jul 26, 2018 at 12:23 PM, Oleksij Rempel
> <o.rempel@pengutronix.de> wrote:
>=20
>> Each MU has four pairs of rx/tx data register with four rx/tx interrup=
ts
>> which can also be used as a separate channel.
>>
> So the hardware actually supports 4 channels.
>=20
>> -- #mbox-cells:  Must be 0. Number of cells in a mailbox
>> +- #mbox-cells:  Must be:
>> +               0 - for single channel mode. i.MX8* SCU protocol speci=
fic.
>> +               1 - for multichannel (generic) mode.
>> +
> No, please.
> DT bindings should reflect the real hardware, and not the software
> mode we want the driver to work in.
> Please define mbox-cells=3D1  and have the i.MX8* platform always ask
> for channel-0.

We spend already some week to publicly talk about this..
The problem is, imx8 has multiple MUs, only some of them communicate
directly with SCU. SCU has some well defined protocol and
MU should be used and configured in some SCU specific way. From NXP
perspective, SCU firmware should not be replaceable and from Linux side
seen as part of the HW.

@Dong, is it correct description?


--51zZ2lswdgIvurOM6pfms1gMuequtg09W--

--haHmbca99SwgV2Mcf1ASBoBnfTimQ4YsQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltZqRUACgkQdQOiSHVI
77Q6mggAhCPMLg6FGVQq+QoiHcbW9O6+9Ersn0f9uLLyKQFRx1DgcuxGgIzvY7ta
2t8GWL43z2N4qeFkcOhNR2Jkdn42HzZI42zk/Ti9e+dBzoihYi0M75zkAYQELrDm
5mOhlXscaHvbv+pAJoZer3DfbHlhgEZhptw8j6Ev6YnwPKJt078VAU4oHkStDwaM
2PN1tW/B7t2zOTtmExrxLJqL1SYqVzJIJ0vST38NYIrp3UGh81u+ezPEkfTg6OO5
X8BkmjsWuX8ODz2hjhsvxqIRKjCfsRGiSXAu8+iPoTzwNbK0QBTijKMKbzXhQRVJ
6OJ/1GWNhdaQAPHhLEYYz5PPnz6j2g==
=Agsb
-----END PGP SIGNATURE-----

--haHmbca99SwgV2Mcf1ASBoBnfTimQ4YsQ--


--===============5377226485089391957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5377226485089391957==--
