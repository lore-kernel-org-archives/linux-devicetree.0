From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 16/16] dt-bindings: net: add bindings for ADIN PHY driver
Date: Mon, 5 Aug 2019 16:11:00 +0200
Message-ID: <20190805141100.GG24275@lunn.ch>
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

> +  adi,rx-internal-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      RGMII RX Clock Delay used only when PHY operates in RGMII mode (phy-mode
> +      is "rgmii-id", "rgmii-rxid", "rgmii-txid") see `dt-bindings/net/adin.h`
> +      default value is 0 (which represents 2 ns)
> +    enum: [ 0, 1, 2, 6, 7 ]

We want these numbers to be in ns. So the default value would actually
be 2. The driver needs to convert the number in DT to a value to poke
into a PHY register. Please rename the property adi,rx-internal-delay-ns.

> +
> +  adi,tx-internal-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      RGMII TX Clock Delay used only when PHY operates in RGMII mode (phy-mode
> +      is "rgmii-id", "rgmii-rxid", "rgmii-txid") see `dt-bindings/net/adin.h`
> +      default value is 0 (which represents 2 ns)
> +    enum: [ 0, 1, 2, 6, 7 ]

Same here.

> +
> +  adi,fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      When operating in RMII mode, this option configures the FIFO depth.
> +      See `dt-bindings/net/adin.h`.
> +    enum: [ 0, 1, 2, 3, 4, 5 ]

Units? You should probably rename this adi,fifo-depth-bits and list
the valid values in bits.

> +
> +  adi,eee-enabled:
> +    description: |
> +      Advertise EEE capabilities on power-up/init (default disabled)
> +    type: boolean

It is not the PHY which decides this. The MAC indicates if it is EEE
capable to phylib. phylib looks into the PHY registers to determine if
the PHY supports EEE. phylib will then enable EEE
advertisement. Please remove this, and ensure EEE is disabled by
default.

	Andrew
