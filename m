From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
Date: Tue, 17 Jul 2018 07:45:22 +0200
Message-ID: <7f96a775-661b-86e5-95eb-07017dcec3c5@pengutronix.de>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-2-o.rempel@pengutronix.de>
 <AM0PR04MB4211E30E85E830AA31F998A1805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6741852679398449570=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211E30E85E830AA31F998A1805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6741852679398449570==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SwRc15dFF6vZx9O87Ct8wvmlJd9iNvo5G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SwRc15dFF6vZx9O87Ct8wvmlJd9iNvo5G
Content-Type: multipart/mixed; boundary="Tf2I2bK1eOsSoGFhHtFLkIZkiIruKjl7b";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "A.s. Dong" <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Message-ID: <7f96a775-661b-86e5-95eb-07017dcec3c5@pengutronix.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-2-o.rempel@pengutronix.de>
 <AM0PR04MB4211E30E85E830AA31F998A1805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4211E30E85E830AA31F998A1805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>

--Tf2I2bK1eOsSoGFhHtFLkIZkiIruKjl7b
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 17.07.2018 07:00, A.s. Dong wrote:
>> -----Original Message-----
>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>> Sent: Monday, July 16, 2018 7:42 PM
>> To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
>> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
>> Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>
>> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
>> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-l=
inux-
>> imx <linux-imx@nxp.com>
>> Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
>>
>> The Messaging Unit module enables two processors within the SoC to
>> communicate and coordinate by passing messages (e.g. data, status and
>> control) through the MU interface.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  .../devicetree/bindings/mailbox/fsl,mu.txt    | 32 ++++++++++++++++++=
+
>>  1 file changed, 32 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>> b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>> new file mode 100644
>> index 000000000000..5d48dd75b98d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>> @@ -0,0 +1,32 @@
>> +NXP i.MX Messaging Unit (MU)
>> +--------------------------------------------------------------------
>> +
>> +Required properties:
>> +-------------------
>> +- compatible :	should be "fsl,<chip>-mu", the supported chips include=
:
>> +		imx6sx	- i.MX 6SoloX
>> +		imx7d	- i.MX 7Dual
>> +		imx7s	- i.MX 7Solo
>> +		imx7ulp	- i.MX 7ULP
>> +		imx8qm	- i.MX 8QM
>> +		imx8qxp	- i.MX 8QXP
>> +- reg :		Should contain the registers location and length
>> +- interrupts :	Interrupt number. The interrupt specifier format depen=
ds
>> +		on the interrupt controller parent.
>> +- #mbox-cells:  Must be:
>> +		0 - for single channel mode. i.MX8* SCU protocol specific.
>> +		1 - for multichannel (generic) mode.
>> +
>> +Optional properties:
>> +-------------------
>> +- clocks :	phandle to the input clock.
>> +- fsl,mu-side-a : Should be set for side A MU.
>=20
> For this property, how about doing like:
> fsl,mu-side: An Integer represents the MU side.

All this SoCs have MUs with only two sides. Why do we need explicit
annotation for both parts?

> If missing this property, it's default to Side A

So, why do we need optional integer, which is set by default as side A?
This is why I made it bool.

> 	       which is mostly used by A core.

And you will need to explicit set side=3DB for SCU. Correct?

> 	       0: MU Side A
> 	       1: MU Side B



--Tf2I2bK1eOsSoGFhHtFLkIZkiIruKjl7b--

--SwRc15dFF6vZx9O87Ct8wvmlJd9iNvo5G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltNgnIACgkQdQOiSHVI
77Qo9wgAr4hsRzYCYGdlkcNZerP6okhC8NkeMVyLQybRiCWqRkUdwKh4r7V53ZDu
OOPTwPg3fHCLvvvY//K6/DJYcB2gupYZhIg3xyw3qc7vK1+J5a/3s1mqwZiaqpKu
Bq/PSRbRLAZBIZrW3QTecGsD6Irq5Bo4C/FrNF/yrh5u6SpsR5qu1dgKbEVGreUe
Tb1DbW8bwyC5oAZRJ5aDV+9vQFhJedxxDTH7RO61d9IxyqDmp1FCShvfhH9VfSF3
+aUGwLCoB79gQNF5MUb2iskcqhNBM+VafpTI+/xEOU9RN8+zXEEdWcXTPzhAr5Ez
K9F2DCHIfn37wCQXJIbwQtCUsFKzPQ==
=naRg
-----END PGP SIGNATURE-----

--SwRc15dFF6vZx9O87Ct8wvmlJd9iNvo5G--


--===============6741852679398449570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6741852679398449570==--
