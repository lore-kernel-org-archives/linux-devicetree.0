From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: media: Add binding for MT2712
 MIPI-CSI2
Date: Mon, 29 Apr 2019 17:53:15 -0500
Message-ID: <20190429225315.GA23589@bogus>
References: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
 <1555407015-18130-2-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1555407015-18130-2-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 05:30:01PM +0800, Stu Hsieh wrote:
> Add MIPI-CSI2 dt-binding for Mediatek MT2712 SoC
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../bindings/media/mediatek-mipicsi-camsv.txt | 53 ++++++++++++++++++
>  .../media/mediatek-mipicsi-common.txt         | 19 +++++++
>  .../bindings/media/mediatek-mipicsi.txt       | 54 +++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
> new file mode 100644
> index 000000000000..5f34974f12ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
> @@ -0,0 +1,53 @@
> +* Mediatek MIPI-CSI2 receiver camsv
> +
> +Mediatek MIPI-CSI2 receiver camsv transfer data to DRAM in Mediatek SoCs
> +
> +Required properties:
> +- reg : physical base address of the mipicsi receiver registers and length of
> +  memory mapped region.

Looks like 2 regions in the example. What are they?

> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.

1 clock?

> +- interrupts : interrupt number to the interrupt controller.
> +
> +Example:
> +	seninf1_mux_camsv0: seninf_mux_camsv@15002100 {
> +		reg = <0 0x15002120 0 0x40>,
> +		      <0 0x15004000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
> +		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf2_mux_camsv1: seninf_mux_camsv@15002500 {
> +		reg = <0 0x15002520 0 0x40>,
> +		      <0 0x15005000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
> +		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf3_mux_camsv2: seninf_mux_camsv@15002900 {
> +		reg = <0 0x15002920 0 0x40>,
> +		      <0 0x15006000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
> +		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf4_mux_camsv3: seninf_mux_camsv@15002D00 {
> +		reg = <0 0x15002D20 0 0x40>,
> +		      <0 0x15007000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
> +		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf5_mux_camsv4: seninf_mux_camsv@15003100 {
> +		reg = <0 0x15003120 0 0x40>,
> +		      <0 0x15008000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
> +		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf6_mux_camsv5: seninf_mux_camsv@15003500 {
> +		reg = <0 0x15003520 0 0x40>,
> +		      <0 0x15009000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
> +		interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_LOW>;
> +	
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
> new file mode 100644
> index 000000000000..a67c744b75f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
> @@ -0,0 +1,19 @@
> +* Mediatek MIPI-CSI2 receiver common
> +
> +Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs
> +
> +Required properties:
> +- compatible: should be "mediatek,mt2712-mipicsi-common"
> +- reg : physical base address of the mipicsi receiver registers and length of
> +  memory mapped region.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.

How many clocks and what are they?

> +
> +
> +Example:
> +	mipicsi: mipicsi@15002000 {
> +		compatible = "mediatek,mt2712-mipicsi-common", "syscon";
> +		reg = <0 0x15002000 0 0x10>;
> +		clocks = <&imgsys CLK_IMG_SENINF_CAM_EN>,
> +			 <&imgsys CLK_IMG_SENINF_SCAM_EN>;
> +	};
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> new file mode 100644
> index 000000000000..24741ed62b25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> @@ -0,0 +1,54 @@
> +* Mediatek MIPI-CSI2 receiver
> +
> +Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs
> +
> +Required properties:
> +- compatible: should be "mediatek,mt2712-mipicsi"
> +- reg : physical base address of the mipicsi receiver registers and length of
> +  memory mapped region.

How many regions?

> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,larb: must contain the local arbiters in the current Socs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.

How many?

> +- mediatek,seninf_mux_camsv: seninf_mux_camsv the data go through of the mipicsi port

s/_/-/

How many entries?

> +- mediatek,mipicsiid: the id of the mipicsi port

What is this for? We generally don't do device indexes in DT.

> +- mediatek,mipicsi: the common component of the two mipicsi port
> +
> +Example:
> +	mipicsi0: mipicsi@10217000 {
> +		compatible = "mediatek,mt2712-mipicsi";
> +		mediatek,mipicsi = <&mipicsi>;
> +		iommus = <&iommu0 M4U_PORT_CAM_DMA0>,
> +			 <&iommu0 M4U_PORT_CAM_DMA1>;
> +		mediatek,larb = <&larb2>;
> +		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
> +
> +		mediatek,seninf_mux_camsv = <&seninf1_mux_camsv0
> +					     &seninf2_mux_camsv1
> +					     &seninf3_mux_camsv2
> +					     &seninf4_mux_camsv3>;
> +		reg = <0 0x10217000 0 0x60>,
> +		      <0 0x15002100 0 0x4>,
> +		      <0 0x15002300 0 0x100>;
> +		mediatek,mipicsiid = <0>;
> +		status="disabled";

Don't show status in examples.

> +	};
> +
> +	mipicsi1: mipicsi@10218000 {
> +		compatible = "mediatek,mt2712-mipicsi";
> +		mediatek,mipicsi = <&mipicsi>;
> +		iommus = <&iommu0 M4U_PORT_CAM_DMA2>;
> +		mediatek,larb = <&larb2>;
> +		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
> +		mediatek,seninf_mux_camsv = <&seninf5_mux_camsv4
> +					     &seninf6_mux_camsv5>;
> +		reg = <0 0x10218000 0 0x60>,
> +		      <0 0x15002500 0 0x4>,
> +		      <0 0x15002700 0 0x100>;
> +		mediatek,mipicsiid = <1>;
> +		status="disabled";
> +	};
> \ No newline at end of file

Fix this.

> -- 
> 2.18.0
> 
