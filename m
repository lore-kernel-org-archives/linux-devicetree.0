From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
Date: Tue, 17 Jul 2018 06:56:13 +0200
Message-ID: <15215da0-2de9-a6a9-0a08-1877e27e0fd7@pengutronix.de>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-2-o.rempel@pengutronix.de>
 <20180716151654.GA21819@rob-hp-laptop>
 <AM0PR04MB42115331D2201A6A07D82CEA805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6547411445632758670=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42115331D2201A6A07D82CEA805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6547411445632758670==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UyLKf69i9VI4bQIzhiG5jx4SDEQ04zq4C"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UyLKf69i9VI4bQIzhiG5jx4SDEQ04zq4C
Content-Type: multipart/mixed; boundary="xuHrJVo9xbZQYqoKQmCoPrm9N0dAsqEUy";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "A.s. Dong" <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <15215da0-2de9-a6a9-0a08-1877e27e0fd7@pengutronix.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-2-o.rempel@pengutronix.de>
 <20180716151654.GA21819@rob-hp-laptop>
 <AM0PR04MB42115331D2201A6A07D82CEA805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42115331D2201A6A07D82CEA805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>

--xuHrJVo9xbZQYqoKQmCoPrm9N0dAsqEUy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 17.07.2018 06:51, A.s. Dong wrote:
>> -----Original Message-----
>> From: Rob Herring [mailto:robh@kernel.org]
>> Sent: Monday, July 16, 2018 11:17 PM
>> To: Oleksij Rempel <o.rempel@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
>> <fabio.estevam@nxp.com>; Mark Rutland <mark.rutland@arm.com>; A.s.
>> Dong <aisheng.dong@nxp.com>; kernel@pengutronix.de; linux-arm-
>> kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-linux-imx <=
linux-
>> imx@nxp.com>
>> Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
>>
>> On Mon, Jul 16, 2018 at 01:42:07PM +0200, Oleksij Rempel wrote:
>>> The Messaging Unit module enables two processors within the SoC to
>>> communicate and coordinate by passing messages (e.g. data, status and=

>>> control) through the MU interface.
>>
>> v3? I already gave my R-by on v4 from Dong. Please coordinate your wor=
k on
>> this.
>=20
> Okay.
>=20
> Oleksij,=20
> could you re-add the M4 support part in a separate patch based on
> the already acked SCU one?
> I guess you can re-send with the acked one.

Rob, what do you prefer: two patches for one new file or one squashed pat=
ch?


--xuHrJVo9xbZQYqoKQmCoPrm9N0dAsqEUy--

--UyLKf69i9VI4bQIzhiG5jx4SDEQ04zq4C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltNdu0ACgkQdQOiSHVI
77STXQgAl07vMc6nTo3kiD+Ibv63SqU7h2bLc3KRrgC+PJtTp1BylKFJ3g9pu0B5
6MqR6SbfgjzO91TdIWT4VldLAYilxDsGu1iaLDBpu0wdJknWmtV1e/k0S0YW4MFD
FQLqsMILSde4kboCvh2GLoGv0BUsqo4ykiVO77sQ7+voVt7rDpCHuNK75HsyxNkZ
gsruXZ65AghX72iylvrvT93Gnkt1/gM/bzz2nwbB1q76JGK3n2gXdSbb9MKxXRZn
yBu0rjVHBQ+gv89ZQvPywocmg0UQXGfLGAv8K+9hL8JATUcvqCvR/3CbOo7JEkGs
0sR9pjLMKwwQpitSNwIG5bSTrlcR8w==
=JZ/I
-----END PGP SIGNATURE-----

--UyLKf69i9VI4bQIzhiG5jx4SDEQ04zq4C--


--===============6547411445632758670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6547411445632758670==--
