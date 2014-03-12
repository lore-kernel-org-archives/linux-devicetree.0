From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/4] phy: miphy365x: Add Device Tree bindings for
 the MiPHY365x
Date: Wed, 12 Mar 2014 11:13:11 +0000
Message-ID: <20140312111311.GF3263@e106331-lin.cambridge.arm.com>
References: <1392377036-12816-1-git-send-email-lee.jones@linaro.org>
 <20140310162254.GG13661@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140310162254.GG13661@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "alexandre.torgue-qxv4g6HH51o@public.gmane.org" <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 10, 2014 at 04:22:54PM +0000, Lee Jones wrote:
> phy: miphy365x: Add Device Tree bindings for the MiPHY365x
>=20
> The MiPHY365x is a Generic PHY which can serve various SATA or PCIe
> devices. It has 2 ports which it can use for either; both SATA, both
> PCIe or one of each in any configuration.
>=20
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt =
b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> new file mode 100644
> index 0000000..15d105a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> @@ -0,0 +1,62 @@
> +STMicroelectronics STi MIPHY365x PHY binding
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This binding describes a miphy device that is used to control PHY ha=
rdware
> +for SATA and PCIe.
> +
> +Required properties:
> +- compatible :	Should be "st,miphy365x-phy"
> +- #phy-cells :	Should be 2 (See second example)
> +		First cell is the port number from:
> +			- MIPHY_PORT_0
> +			- MIPHY_PORT_1
> +		Second cell is device type from:
> +			- MIPHY_TYPE_SATA
> +			- MIPHY_TYPE_PCI
> +- reg       :	Address and length of register sets for each device in
> +		"reg-names"
> +- reg-names : 	The names of the register addresses corresponding to =
the
> +		registers filled in "reg", from:
> +			- sata0: For SATA port 0 registers
> +			- sata1: For SATA port 1 registers
> +			- pcie0: For PCIE port 0 registers
> +			- pcie1: For PCIE port 1 registers
> +- st,syscfg : 	Should be a phandle of the system configuration regis=
ter group
> +		which contain the SATA, PCIe mode setting bits
> +
> +Optional properties:
> +- st,sata-gen	     :	Generation of locally attached SATA IP. Expecte=
d values
> +			are {1,2,3). If not supplied generation 1 hardware will
> +			be expected
> +- st,pcie-tx-pol-inv :	Bool property to invert the polarity PCIe Tx =
(Txn/Txp)
> +- st,sata-tx-pol-inv :	Bool property to invert the polarity SATA Tx =
(Txn/Txp)
> +
> +Example:
> +
> +	miphy365x_phy: miphy365x@0 {

Please fix the unit-address to match the first reg entry.

Otherwise this looks fine. With that fixed:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> +		compatible =3D "st,miphy365x-phy";
> +		#phy-cells =3D <2>;
> +		reg =3D	<0xfe382000 0x100>,
> +			<0xfe38a000 0x100>,
> +			<0xfe394000 0x100>,
> +			<0xfe804000 0x100>;
> +		reg-names =3D "sata0", "sata1", "pcie0", "pcie1";
> +		st,syscfg =3D <&syscfg_rear>;
> +	};
> +
> +Specifying phy control of devices
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Device nodes should specify the configuration required in their "phy=
s"
> +property, containing a phandle to the miphy device node, a port numb=
er
> +and a device type.
> +
> +Example:
> +
> +#include <dt-bindings/phy/phy-miphy365x.h>
> +
> +	sata0: sata@fe380000 {
> +		...
> +		phys	  =3D <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
> +		...
> +	};
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
