From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/2] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Fri, 12 Apr 2019 15:42:44 +0200
Message-ID: <20190412134244.GC324@lunn.ch>
References: <20190412130427.13418-1-angus@akkea.ca>
 <20190412130427.13418-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412130427.13418-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";

Hi Angus

This compatible string is optional. It won't warm, but it is not
needed.

> +			reg = <1>;
> +			power-supply = <&reg_3V3_P>;

I don't remember seeing a power-supply property in an Ethernet PHY
node before. What is using it? The PHY driver? Or the driver core
code?

	Andrew
