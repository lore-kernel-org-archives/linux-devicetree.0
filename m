From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Document MediaTek I3C master
 bindings
Date: Wed, 24 Jul 2019 14:21:19 -0600
Message-ID: <20190724202119.GA26566@bogus>
References: <1562677762-24067-1-git-send-email-qii.wang@mediatek.com>
 <1562677762-24067-2-git-send-email-qii.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1562677762-24067-2-git-send-email-qii.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qii Wang <qii.wang@mediatek.com>
Cc: bbrezillon@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, leilk.liu@mediatek.com, liguo.zhang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 09, 2019 at 09:09:21PM +0800, Qii Wang wrote:
> Document MediaTek I3C master DT bindings.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   48 ++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> 
> diff --git a/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> new file mode 100644
> index 0000000..d32eda6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> @@ -0,0 +1,48 @@
> +Bindings for MediaTek I3C master block
> +=====================================
> +
> +Required properties:
> +--------------------
> +- compatible: shall be "mediatek,i3c-master"

Needs to be SoC specific.

> +- reg: physical base address of the controller and apdma base, length of
> +  memory mapped region.
> +- reg-names: shall be "main" for master controller and "dma" for apdma.
> +- interrupts: the interrupt line connected to this I3C master.
> +- clocks: shall reference the i3c and apdma clocks.
> +- clock-names: shall include "main" and "dma".
> +
> +Mandatory properties defined by the generic binding (see
> +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +
> +- #address-cells: shall be set to 3
> +- #size-cells: shall be set to 0
> +
> +Optional properties defined by the generic binding (see
> +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +
> +- i2c-scl-hz
> +- i3c-scl-hz
> +
> +I3C device connected on the bus follow the generic description (see
> +Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> +
> +Example:
> +
> +	i3c0: i3c@1100d000 {
> +		compatible = "mediatek,i3c-master";
> +		reg = <0x1100d000 0x1000>,
> +		      <0x11000300 0x80>;
> +		reg-names = "main", "dma";
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&infracfg CLK_INFRA_I3C0>,
> +			 <&infracfg CLK_INFRA_AP_DMA>;
> +		clock-names = "main", "dma";
> +		#address-cells = <3>;
> +		#size-cells = <0>;
> +		i2c-scl-hz = <100000>;
> +
> +		nunchuk: nunchuk@52 {
> +			compatible = "nintendo,nunchuk";
> +			reg = <0x52 0x0 0x10>;
> +		};
> +	};
> -- 
> 1.7.9.5
> 
