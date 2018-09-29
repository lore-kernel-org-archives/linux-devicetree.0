Return-Path: <SRS0=3z33=ML=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39661 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbeI2Q3O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 29 Sep 2018 12:29:14 -0400
Received: by mail-ed1-f66.google.com with SMTP id h4-v6so10171034edi.6
        for <devicetree@vger.kernel.org>; Sat, 29 Sep 2018 03:01:25 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: [PATCH] ARM: dts: am335x: Replace remaining legacy phy_id with
 phy-handle
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20180928203457.121761-1-tony@atomide.com>
Date: Sat, 29 Sep 2018 12:01:22 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <6BB238B0-0491-4B11-9E91-03083F781918@dominion.thruhere.net>
References: <20180928203457.121761-1-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Grygorii Strashko <grygorii.strashko@ti.com>, Neeraj Dantu <dantuguf14105@gmail.com>
List-ID: <devicetree@vger.kernel.org>



> Op 28 sep. 2018, om 22:34 heeft Tony Lindgren <tony@atomide.com> het =
volgende geschreven:
>=20
> Looks like we still have two instances of phy_handle that did not
> get update by Grygorii's series. Let's replace these too with
> standard phy-handle.
>=20
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Neeraj Dantu <dantuguf14105@gmail.com>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Thanks for taking care of this!

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> arch/arm/boot/dts/am335x-osd3358-sm-red.dts | 6 +++++-
> arch/arm/boot/dts/am335x-sancloud-bbe.dts   | 6 +++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts =
b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
> --- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
> +++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
> @@ -424,7 +424,7 @@
> };
>=20
> &cpsw_emac0 {
> -	phy_id =3D <&davinci_mdio>, <4>;
> +	phy-handle =3D <&ethphy0>;
> 	phy-mode =3D "rgmii-txid";
> };
>=20
> @@ -441,6 +441,10 @@
> 	pinctrl-0 =3D <&davinci_mdio_default>;
> 	pinctrl-1 =3D <&davinci_mdio_sleep>;
> 	status =3D "okay";
> +
> +	ethphy0: ethernet-phy@4 {
> +		reg =3D <4>;
> +	};
> };
>=20
> &mmc1 {
> diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts =
b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> --- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> +++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> @@ -103,10 +103,14 @@
> 	pinctrl-0 =3D <&davinci_mdio_default>;
> 	pinctrl-1 =3D <&davinci_mdio_sleep>;
> 	status =3D "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		reg =3D <0>;
> +	};
> };
>=20
> &cpsw_emac0 {
> -	phy_id =3D <&davinci_mdio>, <0>;
> +	phy-handle =3D <&ethphy0>;
> 	phy-mode =3D "rgmii-txid";
> };
>=20
> --=20
> 2.19.0
