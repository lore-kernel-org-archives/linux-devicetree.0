From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/6] phy: miphy365x: Use the generic phy type constants
 in dt-bindings/phy/phy.h
Date: Wed, 25 Feb 2015 15:15:02 +0000
Message-ID: <20150225151502.GH5132@x1>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424871377-1795-2-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 25 Feb 2015, Peter Griffin wrote:

> Now there are generic phy type constants declared in phy.h, migrate o=
ver to
> using them rather than defining our own. This change has been done as=
 one
> atomic commit to be bisectable.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/phy-miphy365x.txt |  8 ++++---=
-
>  arch/arm/boot/dts/stih416.dtsi                          |  4 ++--
>  drivers/phy/phy-miphy365x.c                             | 14 +++++++=
-------
>  include/dt-bindings/phy/phy-miphy365x.h                 | 14 -------=
-------
>  4 files changed, 13 insertions(+), 27 deletions(-)
>  delete mode 100644 include/dt-bindings/phy/phy-miphy365x.h

Nice.

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt =
b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> index 9802d5d..8772900 100644
> --- a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> @@ -20,8 +20,8 @@ Required nodes	:  A sub-node is required for each c=
hannel the controller
>  Required properties (port (child) node):
>  - #phy-cells 	: Should be 1 (See second example)
>  		  Cell after port phandle is device type from:
> -			- MIPHY_TYPE_SATA
> -			- MIPHY_TYPE_PCI
> +			- PHY_TYPE_SATA
> +			- PHY_TYPE_PCI
>  - reg        	: Address and length of register sets for each device =
in
>  		  "reg-names"
>  - reg-names     : The names of the register addresses corresponding =
to the
> @@ -68,10 +68,10 @@ property, containing a phandle to the phy port no=
de and a device type.
> =20
>  Example:
> =20
> -#include <dt-bindings/phy/phy-miphy365x.h>
> +#include <dt-bindings/phy/phy.h>
> =20
>  	sata0: sata@fe380000 {
>  		...
> -		phys	  =3D <&phy_port0 MIPHY_TYPE_SATA>;
> +		phys	  =3D <&phy_port0 PHY_TYPE_SATA>;
>  		...
>  	};
> diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih4=
16.dtsi
> index ea28eba..eeb7afe 100644
> --- a/arch/arm/boot/dts/stih416.dtsi
> +++ b/arch/arm/boot/dts/stih416.dtsi
> @@ -10,7 +10,7 @@
>  #include "stih416-clock.dtsi"
>  #include "stih416-pinctrl.dtsi"
> =20
> -#include <dt-bindings/phy/phy-miphy365x.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset-controller/stih416-resets.h>
>  / {
> @@ -306,7 +306,7 @@
>  			reg             =3D <0xfe380000 0x1000>;
>  			interrupts      =3D <GIC_SPI 157 IRQ_TYPE_NONE>;
>  			interrupt-names =3D "hostc";
> -			phys	        =3D <&phy_port0 MIPHY_TYPE_SATA>;
> +			phys	        =3D <&phy_port0 PHY_TYPE_SATA>;
>  			phy-names       =3D "sata-phy";
>  			resets	        =3D <&powerdown STIH416_SATA0_POWERDOWN>,
>  					  <&softreset STIH416_SATA0_SOFTRESET>;
> diff --git a/drivers/phy/phy-miphy365x.c b/drivers/phy/phy-miphy365x.=
c
> index 6c80154..98bffbc 100644
> --- a/drivers/phy/phy-miphy365x.c
> +++ b/drivers/phy/phy-miphy365x.c
> @@ -25,7 +25,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> =20
> -#include <dt-bindings/phy/phy-miphy365x.h>
> +#include <dt-bindings/phy/phy.h>
> =20
>  #define HFC_TIMEOUT		100
> =20
> @@ -176,7 +176,7 @@ static u8 rx_tx_spd[] =3D {
>  static int miphy365x_set_path(struct miphy365x_phy *miphy_phy,
>  			      struct miphy365x_dev *miphy_dev)
>  {
> -	bool sata =3D (miphy_phy->type =3D=3D MIPHY_TYPE_SATA);
> +	bool sata =3D (miphy_phy->type =3D=3D PHY_TYPE_SATA);
> =20
>  	return regmap_update_bits(miphy_dev->regmap,
>  				  miphy_phy->ctrlreg,
> @@ -430,7 +430,7 @@ static int miphy365x_init(struct phy *phy)
>  	}
> =20
>  	/* Initialise Miphy for PCIe or SATA */
> -	if (miphy_phy->type =3D=3D MIPHY_TYPE_PCIE)
> +	if (miphy_phy->type =3D=3D PHY_TYPE_PCIE)
>  		ret =3D miphy365x_init_pcie_port(miphy_phy, miphy_dev);
>  	else
>  		ret =3D miphy365x_init_sata_port(miphy_phy, miphy_dev);
> @@ -454,8 +454,8 @@ int miphy365x_get_addr(struct device *dev, struct=
 miphy365x_phy *miphy_phy,
>  		return ret;
>  	}
> =20
> -	if (!((!strncmp(name, "sata", 4) && type =3D=3D MIPHY_TYPE_SATA) ||
> -	      (!strncmp(name, "pcie", 4) && type =3D=3D MIPHY_TYPE_PCIE)))
> +	if (!((!strncmp(name, "sata", 4) && type =3D=3D PHY_TYPE_SATA) ||
> +	      (!strncmp(name, "pcie", 4) && type =3D=3D PHY_TYPE_PCIE)))
>  		return 0;
> =20
>  	miphy_phy->base =3D of_iomap(phynode, index);
> @@ -498,8 +498,8 @@ static struct phy *miphy365x_xlate(struct device =
*dev,
> =20
>  	miphy_phy->type =3D args->args[0];
> =20
> -	if (!(miphy_phy->type =3D=3D MIPHY_TYPE_SATA ||
> -	      miphy_phy->type =3D=3D MIPHY_TYPE_PCIE)) {
> +	if (!(miphy_phy->type =3D=3D PHY_TYPE_SATA ||
> +	      miphy_phy->type =3D=3D PHY_TYPE_PCIE)) {
>  		dev_err(dev, "Unsupported device type: %d\n", miphy_phy->type);
>  		return ERR_PTR(-EINVAL);
>  	}
> diff --git a/include/dt-bindings/phy/phy-miphy365x.h b/include/dt-bin=
dings/phy/phy-miphy365x.h
> deleted file mode 100644
> index 8ef8aba..0000000
> --- a/include/dt-bindings/phy/phy-miphy365x.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/*
> - * This header provides constants for the phy framework
> - * based on the STMicroelectronics MiPHY365x.
> - *
> - * Author: Lee Jones <lee.jones@linaro.org>
> - */
> -#ifndef _DT_BINDINGS_PHY_MIPHY
> -#define _DT_BINDINGS_PHY_MIPHY
> -
> -#define MIPHY_TYPE_SATA		1
> -#define MIPHY_TYPE_PCIE		2
> -#define MIPHY_TYPE_USB		3
> -
> -#endif /* _DT_BINDINGS_PHY_MIPHY */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
