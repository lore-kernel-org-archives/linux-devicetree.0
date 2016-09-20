From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] Documentation: dt-bindings: Add documentation for
 the Meson USB2 PHYs
Date: Tue, 20 Sep 2016 09:29:45 -0500
Message-ID: <20160920142944.GA16016@rob-hp-laptop>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160911134111.31141-3-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, johnyoun@synopsys.com, kishon@ti.com, khilman@baylibre.com, carlo@caione.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, will.deacon@arm.com, catalin.marinas@arm.com, gregkh@linuxfoundation.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Sun, Sep 11, 2016 at 03:41:07PM +0200, Martin Blumenstingl wrote:
> Add the documentation for the bindings for the Meson8b and GXBB USB2
> PHYs.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/phy/meson-usb2-phy.txt     | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
> new file mode 100644
> index 0000000..9da5ea2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
> @@ -0,0 +1,27 @@
> +* Amlogic USB2 PHY
> +
> +Required properties:
> +- compatible:	Depending on the platform this should be one of:
> +	"amlogic,meson8b-usb2-phy"
> +	"amlogic,meson-gxbb-usb2-phy"
> +- reg:		The base address and length of the registers
> +- #phys-cells:	should be 0 (see phy-bindings.txt in this directory)
> +- clocks:	phandle and clock identifier for the phy clocks
> +- clock-names:	"usb_general" and "usb"
> +
> +Optional properties:
> +- resets:	reference to the reset controller
> +- phy-supply:	see phy-bindings.txt in this directory
> +
> +
> +Example:
> +
> +usb0_phy: usb_phy@0 {

usb-phy@0

With that,

Acked-by: Rob Herring <robh@kernel.org>

> +	compatible = "amlogic,meson-gxbb-usb2-phy";
> +	#phy-cells = <0>;
> +	reg = <0x0 0x0 0x0 0x20>;
> +	resets = <&reset RESET_USB_OTG>;
> +	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
> +	clock-names = "usb_general", "usb";
> +	phy-supply = <&usb_vbus>;
> +};
> -- 
> 2.9.3
> 
