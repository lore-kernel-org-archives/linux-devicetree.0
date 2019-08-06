From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 16/16] dt-bindings: net: add bindings for ADIN PHY driver
Date: Tue, 6 Aug 2019 09:04:26 -0600
Message-ID: <CAL_JsqK6EqpcRj0JVkAQXRryPU1Jq+gA68EHCkFw16j_z95yvw@mail.gmail.com>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com> <20190805165453.3989-17-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805165453.3989-17-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 5, 2019 at 7:55 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
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

Needs an:

allOf:
  - $ref: ethernet-phy.yaml#

> +properties:
> +  compatible:
> +    description: |
> +      Compatible list, may contain "ethernet-phy-ieee802.3-c45" in which case
> +      Clause 45 will be used to access device management registers. If
> +      unspecified, Clause 22 will be used. Use this only when MDIO supports
> +      Clause 45 access, but there is no other way to determine this.
> +    enum:
> +      - ethernet-phy-ieee802.3-c45

Then you can drop 'compatible' from here as it is covered by the above schema.

> +
> +  adi,phy-mode-internal:
> +    $ref: /schemas/types.yaml#/definitions/string

This has to be under an 'allOf' or it doesn't actually work. Same below.

> +    description: |

No special formatting here, you can drop '|'.

> +      The internal mode of the PHY. This assumes that there is a PHY converter
> +      in-between the MAC & PHY.
> +    enum: [ "rgmii", "rgmii-id", "rgmii-txid", "rgmii-rxid", "rmii", "mii" ]

Don't need quotes here.

> +
> +  adi,rx-internal-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      RGMII RX Clock Delay used only when PHY operates in RGMII mode (phy-mode
> +      is "rgmii-id", "rgmii-rxid", "rgmii-txid") see `dt-bindings/net/adin.h`
> +      default value is 0 (which represents 2 ns)

Use 'default: 0' to specify defaults.

> +    enum: [ 0, 1, 2, 6, 7 ]
> +
> +  adi,tx-internal-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      RGMII TX Clock Delay used only when PHY operates in RGMII mode (phy-mode
> +      is "rgmii-id", "rgmii-rxid", "rgmii-txid") see `dt-bindings/net/adin.h`
> +      default value is 0 (which represents 2 ns)
> +    enum: [ 0, 1, 2, 6, 7 ]
> +
> +  adi,fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      When operating in RMII mode, this option configures the FIFO depth.
> +      See `dt-bindings/net/adin.h`.
> +    enum: [ 0, 1, 2, 3, 4, 5 ]
> +
> +  adi,eee-enabled:

Isn't there a standard property for EEE control?

> +    description: |
> +      Advertise EEE capabilities on power-up/init (default disabled)
> +    type: boolean
> +
> +  adi,disable-energy-detect:
> +    description: |
> +      Disables Energy Detect Powerdown Mode (default disabled, i.e energy detect
> +      is enabled if this property is unspecified)
> +    type: boolean
> +
> +  reset-gpios:
> +    description: |
> +      GPIO to reset the PHY
> +      see Documentation/devicetree/bindings/gpio/gpio.txt.

Active high or low?

> +
> +examples:
> +  - |
> +    ethernet-phy@0 {
> +        compatible = "ethernet-phy-ieee802.3-c45";
> +        reg = <0>;
> +    };

Not really anything specific to this binding. Drop it.


> +  - |
> +    #include <dt-bindings/net/adin.h>
> +    ethernet-phy@1 {
> +        reg = <1>;
> +        adi,phy-mode-internal = "rgmii-id";
> +
> +        adi,rx-internal-delay = <ADIN1300_RGMII_1_80_NS>;
> +        adi,tx-internal-delay = <ADIN1300_RGMII_2_20_NS>;
> +    };
> +  - |
> +    #include <dt-bindings/net/adin.h>
> +    ethernet-phy@2 {
> +        reg = <2>;
> +        phy-mode = "rmii";
> +
> +        adi,fifo-depth = <ADIN1300_RMII_16_BITS>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index faf5723610c8..6ffbb266dee4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -944,6 +944,8 @@ L:  netdev@vger.kernel.org
>  W:     http://ez.analog.com/community/linux-device-drivers
>  S:     Supported
>  F:     drivers/net/phy/adin.c
> +F:     include/dt-bindings/net/adin.h
> +F:     Documentation/devicetree/bindings/net/adi,adin.yaml
>
>  ANALOG DEVICES INC ADIS DRIVER LIBRARY
>  M:     Alexandru Ardelean <alexandru.ardelean@analog.com>
> diff --git a/include/dt-bindings/net/adin.h b/include/dt-bindings/net/adin.h
> new file mode 100644
> index 000000000000..4c3afa550c59
> --- /dev/null
> +++ b/include/dt-bindings/net/adin.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/**
> + * Device Tree constants for Analog Devices Industrial Ethernet PHYs
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_ADIN_H
> +#define _DT_BINDINGS_ADIN_H
> +
> +/* RGMII internal delay settings for rx and tx for ADIN1300 */
> +#define ADIN1300_RGMII_1_60_NS         0x1
> +#define ADIN1300_RGMII_1_80_NS         0x2
> +#define        ADIN1300_RGMII_2_00_NS          0x0
> +#define        ADIN1300_RGMII_2_20_NS          0x6
> +#define        ADIN1300_RGMII_2_40_NS          0x7
> +
> +/* RMII fifo depth values */
> +#define ADIN1300_RMII_4_BITS           0x0
> +#define ADIN1300_RMII_8_BITS           0x1
> +#define ADIN1300_RMII_12_BITS          0x2
> +#define ADIN1300_RMII_16_BITS          0x3
> +#define ADIN1300_RMII_20_BITS          0x4
> +#define ADIN1300_RMII_24_BITS          0x5
> +
> +#endif
> --
> 2.20.1
>
