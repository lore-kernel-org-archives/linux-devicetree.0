From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RFC][PATCH 2/2] phy: miphy365x: Convert to use phy.h instead
 of phy-miphy365x.h
Date: Mon, 9 Mar 2015 17:14:21 +0530
Message-ID: <54FD8795.6020409@ti.com>
References: <1425520379.1637.7.camel@phoenix> <1425520665.1637.10.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425520665.1637.10.camel@phoenix>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Lee Jones <lee.jones@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 05 March 2015 07:27 AM, Axel Lin wrote:
> The defines in phy-miphy365x.h are all covered in phy.h:
>
> MIPHY_TYPE_SATA == PHY_TYPE_STA
> MIPHY_TYPE_PCIE == PHY_TYPE_PCIE
> MIPPHY_TYPE_USB == PHY_TYPE_USB2
>
> So covert to use phy.h and then delete phy-miphy365x.h.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   Documentation/devicetree/bindings/ata/ahci-st.txt       |  2 +-
>   Documentation/devicetree/bindings/phy/phy-miphy365x.txt |  8 ++++----
>   arch/arm/boot/dts/stih416.dtsi                          |  4 ++--
>   drivers/phy/phy-miphy365x.c                             | 14 +++++++-------
>   include/dt-bindings/phy/phy-miphy365x.h                 | 14 --------------
>   5 files changed, 14 insertions(+), 28 deletions(-)
>   delete mode 100644 include/dt-bindings/phy/phy-miphy365x.h
>
> diff --git a/Documentation/devicetree/bindings/ata/ahci-st.txt b/Documentation/devicetree/bindings/ata/ahci-st.txt
> index 0574a77..070748b 100644
> --- a/Documentation/devicetree/bindings/ata/ahci-st.txt
> +++ b/Documentation/devicetree/bindings/ata/ahci-st.txt
> @@ -21,7 +21,7 @@ Example:
>   		reg             = <0xfe380000 0x1000>;
>   		interrupts      = <GIC_SPI 157 IRQ_TYPE_NONE>;
>   		interrupt-names = "hostc";
> -		phys	        = <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
> +		phys	        = <&miphy365x_phy MIPHY_PORT_0 PHY_TYPE_SATA>;
>   		phy-names       = "ahci_phy";
>   		resets	        = <&powerdown STIH416_SATA0_POWERDOWN>,
>   				  <&softreset STIH416_SATA0_SOFTRESET>;
> diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> index 9802d5d..087294d 100644
> --- a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> @@ -20,8 +20,8 @@ Required nodes	:  A sub-node is required for each channel the controller
>   Required properties (port (child) node):
>   - #phy-cells 	: Should be 1 (See second example)
>   		  Cell after port phandle is device type from:
> -			- MIPHY_TYPE_SATA
> -			- MIPHY_TYPE_PCI
> +			- PHY_TYPE_SATA
> +			- PHY_TYPE_PCIE
>   - reg        	: Address and length of register sets for each device in
>   		  "reg-names"
>   - reg-names     : The names of the register addresses corresponding to the
> @@ -68,10 +68,10 @@ property, containing a phandle to the phy port node and a device type.
>
>   Example:
>
> -#include <dt-bindings/phy/phy-miphy365x.h>
> +#include <dt-bindings/phy/phy.h>
>
>   	sata0: sata@fe380000 {
>   		...
> -		phys	  = <&phy_port0 MIPHY_TYPE_SATA>;
> +		phys	  = <&phy_port0 PHY_TYPE_SATA>;
>   		...
>   	};
> diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
> index ea28eba..eeb7afe 100644
> --- a/arch/arm/boot/dts/stih416.dtsi
> +++ b/arch/arm/boot/dts/stih416.dtsi

Can you split the patch so that I can queue the PHY part?

Cheers
Kishon
