From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v8 11/14] dt-bindings: Document the Rockchip MIPI RX
 D-PHY bindings
Date: Thu, 15 Aug 2019 21:14:13 +0300
Message-ID: <20190815181413.GZ5011@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-12-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-12-helen.koike@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Helen Koike <helen.koike@collabora.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Tue, Jul 30, 2019 at 03:42:53PM -0300, Helen Koike wrote:
> From: Jacob Chen <jacob2.chen@rock-chips.com>
> 
> Add DT bindings documentation for Rockchip MIPI D-PHY RX
> 
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> [update for upstream]
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v8: None
> Changes in v7:
> - updated doc with new design and tested example
> 
>  .../bindings/media/rockchip-mipi-dphy.txt     | 38 +++++++++++++++++++

Shouldn't this go to bindings/phy/ ?

>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt b/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> new file mode 100644
> index 000000000000..2305d44d92db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> @@ -0,0 +1,38 @@
> +Rockchip SoC MIPI RX D-PHY
> +-------------------------------------------------------------

How about already converting the bindings to yaml ? There's one example
in bindings/phy/ that looks quite similar to what you need here. Make
sure to have a look at Documentation/devicetree/writing-schema.md, and
in particular to run make dt_binding_check.

> +
> +Required properties:
> +- compatible: value should be one of the following
> +	"rockchip,rk3288-mipi-dphy"
> +	"rockchip,rk3399-mipi-dphy"
> +- clocks : list of clock specifiers, corresponding to entries in
> +	clock-names property;
> +- clock-names: required clock name.
> +- #phy-cells: Number of cells in a PHY specifier; Should be 0.
> +
> +MIPI RX D-PHY use registers in "general register files", it
> +should be a child of the GRF.
> +
> +Optional properties:
> +- reg: offset and length of the register set for the device.
> +- rockchip,grf: MIPI TX1RX1 D-PHY not only has its own register but also
> +		the GRF, so it is only necessary for MIPI TX1RX1 D-PHY.
> +
> +Device node example
> +-------------------
> +
> +grf: syscon@ff770000 {
> +	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> +
> +...
> +
> +	dphy: mipi-dphy {
> +		compatible = "rockchip,rk3399-mipi-dphy";
> +		clocks = <&cru SCLK_MIPIDPHY_REF>,
> +			<&cru SCLK_DPHY_RX0_CFG>,
> +			<&cru PCLK_VIO_GRF>;
> +		clock-names = "dphy-ref", "dphy-cfg", "grf";
> +		power-domains = <&power RK3399_PD_VIO>;
> +		#phy-cells = <0>;
> +	};
> +};

-- 
Regards,

Laurent Pinchart
