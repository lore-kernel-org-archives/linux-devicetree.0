From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
Date: Tue, 17 Jul 2018 08:31:45 +0200
Message-ID: <739d382e-b553-107f-3cb7-59b7adf5d16d@pengutronix.de>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-2-o.rempel@pengutronix.de>
 <AM0PR04MB4211E30E85E830AA31F998A1805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <7f96a775-661b-86e5-95eb-07017dcec3c5@pengutronix.de>
 <AM0PR04MB42111EDD7771D0FABCEB671B805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5142580501092409078=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42111EDD7771D0FABCEB671B805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5142580501092409078==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kILQ9n8r5F73qrG340MY1gMuoHUxO8RRD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kILQ9n8r5F73qrG340MY1gMuoHUxO8RRD
Content-Type: multipart/mixed; boundary="laIT2ouci3m88CIYhmcg9OVQ7TUFUw75D";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "A.s. Dong" <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Message-ID: <739d382e-b553-107f-3cb7-59b7adf5d16d@pengutronix.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-2-o.rempel@pengutronix.de>
 <AM0PR04MB4211E30E85E830AA31F998A1805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <7f96a775-661b-86e5-95eb-07017dcec3c5@pengutronix.de>
 <AM0PR04MB42111EDD7771D0FABCEB671B805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42111EDD7771D0FABCEB671B805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>

--laIT2ouci3m88CIYhmcg9OVQ7TUFUw75D
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 17.07.2018 08:26, A.s. Dong wrote:
>> -----Original Message-----
>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>> Sent: Tuesday, July 17, 2018 1:45 PM
>> To: A.s. Dong <aisheng.dong@nxp.com>; Shawn Guo
>> <shawnguo@kernel.org>; Fabio Estevam <fabio.estevam@nxp.com>; Rob
>> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> kernel@pengutronix.de; dl-linux-imx <linux-imx@nxp.com>
>> Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
>>
>>
>>
>> On 17.07.2018 07:00, A.s. Dong wrote:
>>>> -----Original Message-----
>>>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>>>> Sent: Monday, July 16, 2018 7:42 PM
>>>> To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
>>>> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
>>>> Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>
>>>> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;=

>>>> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
>>>> dl-linux- imx <linux-imx@nxp.com>
>>>> Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
>>>>
>>>> The Messaging Unit module enables two processors within the SoC to
>>>> communicate and coordinate by passing messages (e.g. data, status an=
d
>>>> control) through the MU interface.
>>>>
>>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>>> ---
>>>>  .../devicetree/bindings/mailbox/fsl,mu.txt    | 32
>> +++++++++++++++++++
>>>>  1 file changed, 32 insertions(+)
>>>>  create mode 100644
>>>> Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>> b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>> new file mode 100644
>>>> index 000000000000..5d48dd75b98d
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>> @@ -0,0 +1,32 @@
>>>> +NXP i.MX Messaging Unit (MU)
>>>> +-------------------------------------------------------------------=
-
>>>> +
>>>> +Required properties:
>>>> +-------------------
>>>> +- compatible :	should be "fsl,<chip>-mu", the supported chips
>> include:
>>>> +		imx6sx	- i.MX 6SoloX
>>>> +		imx7d	- i.MX 7Dual
>>>> +		imx7s	- i.MX 7Solo
>>>> +		imx7ulp	- i.MX 7ULP
>>>> +		imx8qm	- i.MX 8QM
>>>> +		imx8qxp	- i.MX 8QXP
>>>> +- reg :		Should contain the registers location and length
>>>> +- interrupts :	Interrupt number. The interrupt specifier format
>> depends
>>>> +		on the interrupt controller parent.
>>>> +- #mbox-cells:  Must be:
>>>> +		0 - for single channel mode. i.MX8* SCU protocol specific.
>>>> +		1 - for multichannel (generic) mode.
>>>> +
>>>> +Optional properties:
>>>> +-------------------
>>>> +- clocks :	phandle to the input clock.
>>>> +- fsl,mu-side-a : Should be set for side A MU.
>>>
>>> For this property, how about doing like:
>>> fsl,mu-side: An Integer represents the MU side.
>>
>> All this SoCs have MUs with only two sides. Why do we need explicit
>> annotation for both parts?
>>
>>> If missing this property, it's default to Side A
>>
>> So, why do we need optional integer, which is set by default as side A=
?
>> This is why I made it bool.
>=20
> Yes, A bool probably is better.=20
>=20
>>
>>> 	       which is mostly used by A core.
>>
>> And you will need to explicit set side=3DB for SCU. Correct?
>=20
> SCU is using side A. AFAIK all SoC A core is using side A by default.
> That's why I think it can be default one. User is free to specify both
> In device tree. Does it make sense to you?

Ok.


--laIT2ouci3m88CIYhmcg9OVQ7TUFUw75D--

--kILQ9n8r5F73qrG340MY1gMuoHUxO8RRD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltNjVEACgkQdQOiSHVI
77RwyQf/WZgWgmShWsdqLIYeBzcpR/XQDybNh8b3ahlgNRtFIjBYryA8pnlU6i7G
j4zyKfMPngxw90fihEkpZeE06M2/jQOit+l7vvzuUdF3y1NaJBeVX3O1+Hu4nwhT
uoBuXtmLuAJf63eQsNfx8fCsfUZwLJaChpzMB24XuVg8hMCzQ4RH4XJ7E2nWf60c
0vgtAvBQeSPDSw5zf/lF/rTKcbd+W2IeKLd1ZE/SZaQgS0pIcJe7Kl7Fq+pk09ya
0GnXsSDwhuhOOPvIsnGz6yOoen921wSa+uQFichf4tlJnoToYZ9IQYUGwWeOwr8L
MSy2BxSa6roIc9XGVvxEVcCrsw345g==
=HgDH
-----END PGP SIGNATURE-----

--kILQ9n8r5F73qrG340MY1gMuoHUxO8RRD--


--===============5142580501092409078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5142580501092409078==--
