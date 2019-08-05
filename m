From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 16/16] dt-bindings: net: add bindings for ADIN PHY driver
Date: Mon, 5 Aug 2019 16:27:54 +0200
Message-ID: <20190805142754.GL24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-17-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-17-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 07:54:53PM +0300, Alexandru Ardelean wrote:
> This change adds bindings for the Analog Devices ADIN PHY driver, detailing
> all the properties implemented by the driver.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  .../devicetree/bindings/net/adi,adin.yaml     | 93 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  include/dt-bindings/net/adin.h                | 26 ++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/adi,adin.yaml
>  create mode 100644 include/dt-bindings/net/adin.h
> 
> diff --git a/Documentation/devicetree/bindings/net/adi,adin.yaml b/Documentation/devicetree/bindings/net/adi,adin.yaml
> new file mode 100644
> index 000000000000..fcf884bb86f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/adi,adin.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/adi,adin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADIN1200/ADIN1300 PHY
> +
> +maintainers:
> +  - Alexandru Ardelean <alexandru.ardelean@analog.com>
> +
> +description: |
> +  Bindings for Analog Devices Industrial Ethernet PHYs
> +
> +properties:
> +  compatible:
> +    description: |
> +      Compatible list, may contain "ethernet-phy-ieee802.3-c45" in which case
> +      Clause 45 will be used to access device management registers. If
> +      unspecified, Clause 22 will be used. Use this only when MDIO supports
> +      Clause 45 access, but there is no other way to determine this.
> +    enum:
> +      - ethernet-phy-ieee802.3-c45

It is valid to list ethernet-phy-ieee802.3-c22, it is just not
required. So maybe you should list it here to keep the DT validater happy?

	  Andrew
