From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: phy: add binding for Allwinner USB3
 PHY
Date: Sat, 6 Apr 2019 02:14:02 -0500
Message-ID: <20190406071402.GA6006@bogus>
References: <20190405205736.55177-1-icenowy@aosc.io>
 <20190405205736.55177-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405205736.55177-3-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 06, 2019 at 04:57:33AM +0800, Icenowy Zheng wrote:
> The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
> external USB3 pins of the SoC.
> 
> Add a device tree binding for the PHY.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes in v5:
> - Dropped Vbus regulator and added connector subnode.
> 
> Changes in v4:
> - Changed Vbus regulator property to vbus-supply.
> 
> Changes in v3:
> - Added Chen-Yu's Review tag.
> 
> No changes in v2, v1.
> 
>  .../bindings/phy/sun50i-usb3-phy.txt          | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> new file mode 100644
> index 000000000000..eeedc53e6360
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> @@ -0,0 +1,28 @@
> +Allwinner sun50i USB3 PHY
> +-----------------------
> +
> +Required properties:
> +- compatible : should be one of
> +  * allwinner,sun60i-h6-usb3-phy
> +- reg : a list of offset + length pairs
> +- #phy-cells : from the generic phy bindings, must be 0
> +- clocks : phandle + clock specifier for the phy clock
> +- resets : phandle + reset specifier for the phy reset
> +
> +Optional nodes:
> +- connector : A sub-node required for representing the connector connected
> +	      to the USB PHY. See ../connector/usb-connector.txt for details.
> +
> +Example:
> +	usb3phy: phy@5210000 {
> +		compatible = "allwinner,sun50i-h6-usb3-phy";
> +		reg = <0x5210000 0x10000>;
> +		clocks = <&ccu CLK_USB_PHY1>;
> +		resets = <&ccu RST_USB_PHY1>;
> +		#phy-cells = <0>;
> +
> +		connector {
> +			compatible = "usb-a-connector";
> +			label = "USB3";

The binding defines that a connector is a child of USB controller or 
some port controller (such as USB-C ctrlr) with OF graph to USB 
controller. So either way, this is wrong unless this is more than just a 
phy.

Rob
