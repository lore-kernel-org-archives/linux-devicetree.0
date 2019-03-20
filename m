Return-Path: <SRS0=i/wQ=RX=gmail.com=chunkeey@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6dl-yapp4: Use correct pseudo PHY address for the switch
Date: Wed, 20 Mar 2019 14:35:55 +0100
Message-ID: <3167549.DapOIHJhgP@debian64>
In-Reply-To: <1553080145-29348-1-git-send-email-michal.vokac@ysoft.com>
References: <1553080145-29348-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wednesday, March 20, 2019 12:09:05 PM CET Michal Vok=C3=A1=C4=8D wrote:
> The switch is accessible through pseudo PHY which is located at 0x10.

from what I know the switch@0 came from John' original qca8k submission pat=
ch
<https://lore.kernel.org/patchwork/patch/715974/> (this is v1! not the later
version)

In this version, the qca8k_sw_probe() function used read the MII_PHYID1 and=
 2
from the PHY0 in order to identify the switch (much like ar8216.c / ar8327.c
switchdev does):

|	/* sw_addr is irrelevant as the switch occupies the MDIO bus from
|	 * addresses 0 to 4 (PHYs) and 16-23 (for MDIO 32bits protocol). So
|	 * we'll probe address 0 to see if we see the right switch family.
|	 */
|	phy_id =3D mdiobus_read(mdiodev->bus, 0, MII_PHYSID1) << 16;
|	phy_id |=3D mdiobus_read(mdiodev->bus, 0, MII_PHYSID2);
|
|	switch (phy_id) {
|	case PHY_ID_QCA8337:
|		break;
|	default:
|		return -ENODEV;
|	}

However, this code was changed in v2. Probably because if the PHY is put in
isolation and powered down the MII_PHYID1 and 2 will read "0xffff". So the
discovery would no longer worked on systems that purposely disable the swit=
ch
during the bootloader-handoff procedure (like the Meraki MX60).
=20
> Signed-off-by: Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.com>
> ---
>  arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/d=
ts/imx6dl-yapp4-common.dtsi
> index 091d829f6b05..e8d800fec637 100644
> --- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> +++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> @@ -114,9 +114,9 @@
>  			reg =3D <2>;
>  		};
> =20
> -		switch@0 {
> +		switch@10 {
>  			compatible =3D "qca,qca8334";
> -			reg =3D <0>;
> +			reg =3D <10>;
> =20
>  			switch_ports: ports {
>  				#address-cells =3D <1>;
>=20
