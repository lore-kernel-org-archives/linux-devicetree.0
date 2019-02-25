From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: Add bindings for the SMSC USB333x
 ULPI USB PHY
Date: Mon, 25 Feb 2019 10:41:39 -0600
Message-ID: <20190225164139.GA10291@bogus>
References: <20190130155023.4495-1-paul.kocialkowski@bootlin.com>
 <20190130155023.4495-2-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190130155023.4495-2-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 04:50:21PM +0100, Paul Kocialkowski wrote:
> Introduce the device-tree bindings for this ULPI USB PHY.
> Optional bindings that are not prefixed with the vendor may be
> relevant to other ULPI USB PHYs since they match generic ULPI
> registers.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../devicetree/bindings/phy/smsc-usb333x.txt  | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/smsc-usb333x.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/smsc-usb333x.txt b/Documentation/devicetree/bindings/phy/smsc-usb333x.txt
> new file mode 100644
> index 000000000000..50d500d67b2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/smsc-usb333x.txt
> @@ -0,0 +1,50 @@
> +Device tree bindings for SMSC USB333x ULPI USB PHY
> +
> +Required properties:
> +- compatible: Should be "smsc,usb333x".
> +
> +Optional properties:
> +- reset-gpios: GPIO to reset the PHY.
> +- clocks: Reference clock that feeds the PHY's PLL.
> +- clock-names: Should be "refclk" for the reference clock.

> +- extvbus-passthru: Enable EXTVBUS signal pass-through to assert the VbusValid
> +  signal internally. This is useful when no VBUS line is connected to the PHY.
> +- auto-resume: Enable automatic transmission resume (in host mode).
> +- chrg-vbus: Enable internal VBUS pull-up to 3.3 V during OTG SRP.
> +- dischrg-vbus: Enable internal VBUS pull-down during OTG SRP.
> +- id-pull-up: Enable internal ID pull-up tp 3.3 V.

These all need smsc prefix.

> +- smsc,varisense: Squelch detector threshold register field value, as described
> +  in the datasheet.
> +- smsc,phyboost: Output voltage change register field value, as described in the
> +  datasheet.

Please give a range of values at least so we can write constraints.

> +
> +Refer to phy/phy-bindings.txt for the generic PHY binding properties.
> +Refer to usb/ulpi.txt for the parent ULPI bus binding required for this PHY.
> +
> +Example:
> +
> +&usb0 {
> +	compatible = "xlnx,zynq-usb-2.20a", "chipidea,usb2";
> +	clocks = <&clkc 28>;
> +	interrupt-parent = <&intc>;
> +	interrupts = <0 21 4>;
> +	reg = <0xe0002000 0x1000>;
> +	dr_mode = "peripheral";
> +	phys = <&usb_phy0>;
> +	phy-names = "usb-phy";
> +	phy_type = "ulpi";
> +
> +	ulpi {
> +		usb_phy0: usb-phy0 {
> +			#phy-cells = <0>;
> +			compatible = "smsc,usb333x";
> +			reset-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
> +			clocks = <&usb_phy_clk>;
> +			clock-names = "refclk";
> +			smsc,varisense = <1>;
> +			smsc,phyboost = <5>;
> +			extvbus-passthru;
> +			chrg-vbus;
> +		};
> +	};
> +};
> -- 
> 2.20.1
> 
