From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v8 10/14] dt-bindings: Document the Rockchip ISP1 bindings
Date: Fri, 16 Aug 2019 03:21:44 +0300
Message-ID: <20190816002144.GG5011@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-11-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-11-helen.koike@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Helen Koike <helen.koike@collabora.com>
Cc: devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, kernel@collabora.com, heiko@sntech.de, Rob Herring <robh@kernel.org>, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, zhengsq@rock-chips.com, mchehab@kernel.org, ezequiel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Tue, Jul 30, 2019 at 03:42:52PM -0300, Helen Koike wrote:
> From: Jacob Chen <jacob2.chen@rock-chips.com>
> 
> Add DT bindings documentation for Rockchip ISP1
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
> - update document with new design and tested example
> 
>  .../bindings/media/rockchip-isp1.txt          | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp1.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.txt b/Documentation/devicetree/bindings/media/rockchip-isp1.txt
> new file mode 100644
> index 000000000000..a97fef0f189f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.txt

If there wasn't enough work on your plate already I'd propose converting
this to yaml, but I'll refrain from doing so :-)

> @@ -0,0 +1,71 @@
> +Rockchip SoC Image Signal Processing unit v1
> +----------------------------------------------
> +
> +Rockchip ISP1 is the Camera interface for the Rockchip series of SoCs
> +which contains image processing, scaling, and compression funcitons.

s/funcitons/functions/

> +
> +Required properties:
> +- compatible: value should be one of the following
> +	"rockchip,rk3288-cif-isp";
> +	"rockchip,rk3399-cif-isp";
> +- reg : offset and length of the register set for the device.
> +- interrupts: should contain ISP interrupt.
> +- clocks: phandle to the required clocks.
> +- clock-names: required clock name.
> +- iommus: required a iommu node.
> +- phys: the phandle for the PHY port
> +- phy-names: must contain "dphy"
> +
> +port node
> +-------------------
> +
> +The device node should contain one 'ports' child node, with children 'port'
> +with child 'endpoint'.

Extra . and line break ?

> +nodes, according to the bindings defined in Documentation/devicetree/bindings/
> +media/video-interfaces.txt.
> +
> +- endpoint(mipi):
> +	- remote-endpoint: Connecting to Rockchip MIPI-DPHY,
> +		which is defined in rockchip-mipi-dphy.txt.
> +
> +The port node must contain at least one endpoint, either parallel or mipi.

If I understand things correctly, each ISP has a single CSI-2 receiver
and a single parallel output, and can select one of them at runtime.
This should be modelled as two separate ports. In addition to this,
multiple CSI-2 sensors can be connected to the same CSI-2 receiver as
long as all but one of them is held in reset (this is a poor man's CSI-2
switch, which exists in device out in the market, so we have to support
that). This should be modelled by multiple endpoints in the CSI-2 port.

> +It could have multiple endpoints, but please note the hardware don't support
> +two sensors work at a time, they are supposed to work asynchronously.

I assume you meant "are supposed to be mutually exclusive" or something
similar ?

> +
> +Device node example
> +-------------------
> +
> +	isp0: isp0@ff910000 {
> +		compatible = "rockchip,rk3399-cif-isp";
> +		reg = <0x0 0xff910000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru SCLK_ISP0>,
> +			 <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
> +			 <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
> +		clock-names = "clk_isp",
> +			      "aclk_isp", "aclk_isp_wrap",
> +			      "hclk_isp", "hclk_isp_wrap";
> +		power-domains = <&power RK3399_PD_ISP0>;
> +		iommus = <&isp0_mmu>;
> +		phys = <&dphy>;
> +		phy-names = "dphy";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				mipi_in_wcam: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&wcam_out>;
> +					data-lanes = <1 2>;
> +				};
> +
> +				mipi_in_ucam: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&ucam_out>;
> +					data-lanes = <1>;
> +				};

What are wcam and ucam ? It would help if you showed the sensor nodes in
the example.

> +			};
> +		};
> +	};

-- 
Regards,

Laurent Pinchart
