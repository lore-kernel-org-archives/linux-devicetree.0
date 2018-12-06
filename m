From: =?iso-8859-2?Q?Vok=E1=E8_Michal?= <Michal.Vokac@ysoft.com>
Subject: Re: [PATCH] dsa device tree bindings: fix typo and wrong example
Date: Thu, 6 Dec 2018 13:28:56 +0000
Message-ID: <819595ee-9f3e-b7a2-6139-1ba265137f62@ysoft.com>
References: <20181115195111.GA9946@amd> <20181206130051.GA22343@amd>
 <20181206130513.GE22343@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206130513.GE22343@amd>
Content-Language: en-US
Content-ID: <33BB954C3F89E8419D2B3D9B82071881@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, "andrew@lunn.ch" <andrew@lunn.ch>, "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc: "buytenh@marvell.com" <buytenh@marvell.com>, "buytenh@wantstofly.org" <buytenh@wantstofly.org>, "nico@marvell.com" <nico@marvell.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 6.12.2018 14:05, Pavel Machek wrote:
>     =20
> Fix typo and fix compatible value that is not actually permitted by the
> description in the example.

Ahoj Pavle, I think the subject should be more like:

	"dt-bindings: net: dsa: ..."

BR, Michal

>    =20
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>=20
> diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Docu=
mentation/devicetree/bindings/net/dsa/marvell.txt
> index feb007af13cb..abf1be036ac5 100644
> --- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
> @@ -41,7 +41,7 @@ Optional properties:
>   - mdio			: Container of PHY and devices on the switches MDIO
>   			  bus.
>   - mdio?		: Container of PHYs and devices on the external MDIO
> -			  bus. The node must contains a compatible string of
> +			  bus. The node must contain a compatible string of
>   			  "marvell,mv88e6xxx-mdio-external"
>  =20
>   Example:
> @@ -80,7 +80,7 @@ Example:
>   		#interrupt-cells =3D <2>;
>  =20
>   		switch0: switch@0 {
> -			compatible =3D "marvell,mv88e6390";
> +			compatible =3D "marvell,mv88e6190";
>   			reg =3D <0>;
>   			reset-gpios =3D <&gpio5 1 GPIO_ACTIVE_LOW>;
>  =20
>=20
>=20
