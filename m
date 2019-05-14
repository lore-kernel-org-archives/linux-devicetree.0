From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC,V2,03/11] dt-bindings: mt8183: Added camera ISP Pass 1
Date: Tue, 14 May 2019 14:54:17 -0500
Message-ID: <20190514195417.GA21726@bogus>
References: <jungo.lin@mediatek.com>
 <20190510015755.51495-4-jungo.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190510015755.51495-4-jungo.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jungo Lin <jungo.lin@mediatek.com>
Cc: ryan.yu@mediatek.com, frankie.chiu@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, hans.verkuil@cisco.com, frederic.chen@mediatek.com, seraph.huang@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, shik@chromium.org, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com, tfiga@chromium.org, christie.yu@mediatek.com, zwisler@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 09:57:52AM +0800, Jungo Lin wrote:
> This patch adds DT binding document for the Pass 1 (P1) unit in
> Mediatek's camera ISP system. The Pass 1 unit grabs the sensor data
> out from the sensor interface, applies ISP image effects from tuning
> data and outputs the image data or statistics data to DRAM.
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek,camisp.txt        | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> new file mode 100644
> index 000000000000..759e55a5dfac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
> @@ -0,0 +1,92 @@
> +* Mediatek Image Signal Processor Pass 1 (ISP P1)
> +
> +The Pass 1 unit of Mediatek's camera ISP system grabs the sensor data out
> +from the sensor interface, applies ISP effects from tuning data and outputs
> +the image data and statistics data to DRAM. Furthermore, Pass 1 unit has
> +the ability to output two different resolutions frames at the same time to
> +increase the performance of the camera application.
> +
> +Required properties:
> +- compatible: Must be "mediatek,mt8183-camisp" for MT8183.
> +- reg: Must contain an entry for each entry in reg-names.

Must list reg-names here and define the values. Though, I don't find 
cam1, cam2, cam3 to be too useful.

> +- interrupts: interrupt number to the cpu.
> +- iommus: shall point to the respective IOMMU block with master port
> +  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.

How many entries?

> +- power-domains : a phandle to the power domain of this local arbiter.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must be "CAMSYS_CAM_CGPDN" and "CAMSYS_CAMTG_CGPDN".
> +- mediatek,larb: must contain the local arbiters in the current SOCs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- mediatek,scp : the node of system control processor (SCP), see
> +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> +- memory-region : the reserved shared memory region between Pass 1 unit and
> +  system control processor.
> +
> +Example:
> +SoC specific DT entry:
> +
> +	camisp: camisp@1a000000 {
> +		compatible = "mediatek,mt8183-camisp", "syscon";
> +		reg = <0 0x1a000000 0 0x1000>,
> +		      <0 0x1a003000 0 0x1000>,
> +		      <0 0x1a004000 0 0x2000>,
> +		      <0 0x1a006000 0 0x2000>;
> +		reg-names = "camisp",
> +		            "cam1",
> +		            "cam2",
> +		            "cam3";
> +		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "cam1",
> +				  "cam2",
> +				  "cam3";
> +		iommus = <&iommu M4U_PORT_CAM_LSCI0>,
> +			 <&iommu M4U_PORT_CAM_LSCI1>,
> +			 <&iommu M4U_PORT_CAM_BPCI>;
> +		#clock-cells = <1>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +		/* Camera CCF */
> +		clocks = <&camsys CLK_CAM_CAM>,
> +			 <&camsys CLK_CAM_CAMTG>;
> +		clock-names = "CAMSYS_CAM_CGPDN",
> +			      "CAMSYS_CAMTG_CGPDN";
> +		mediatek,larb = <&larb3>,
> +				<&larb6>;
> +		mediatek,scp = <&scp>;
> +		memory-region = <&cam_mem_reserved>;
> +	};
> +
> +Reserved memory specific DT entry (see reserved memory binding for more
> +information):
> +
> +Example:
> +SoC specific DT entry:
> +
> +	cam_mem_reserved: cam_mem_region {
> +		compatible = "mediatek,reserve-memory-cam-smem";
> +		no-map;
> +		size = <0 0x01400000>; / *20 MB share mem size */
> +		alignment = <0 0x1000>;
> +		alloc-ranges = <0 0x40000000 0 0x10000000>;
> +	};
> +
> +Mediatek ISP P1 supports a single port node with MIPI-CSI2 bus. It should
> +contain one 'port' child node with child 'endpoint' node. Please refer to
> +the bindings defined in Documentation/devicetree/bindings/media/video-interfaces.txt
> +and Documentation/devicetree/bindings/media/mediatek-seninf.txt.
> +
> +Example:
> +Board specific DT entry:

Don't split examples like this.

> +
> +	&camisp {
> +		port@0 {
> +			seninf_0: endpoint {
> +				remote-endpoint = <&seninf_core>;
> +			};
> +		};
> +	};
> +
> -- 
> 2.18.0
> 
