From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and eTSEC2
Date: Sun, 12 Jul 2015 14:51:01 +0800
Message-ID: <20150712065101.GA14354@localhost>
References: <1435213498-21025-1-git-send-email-b18965@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435213498-21025-1-git-send-email-b18965@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alison Wang <b18965@freescale.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, Claudiu Manoil <claudiu.manoil@freescale.com>, Alison Wang <alison.wang@freescale.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 25, 2015 at 02:24:58PM +0800, Alison Wang wrote:
> @@ -391,6 +394,85 @@
>  			reg = <0x0 0x2d24000 0x0 0x4000>;
>  		};
>  
> +		enet0: ethernet@2d10000 {

Most of the vendor specific properties below are undocumented bindings.

Shawn

> +			compatible = "fsl,etsec2";
> +			device_type = "network";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			model = "eTSEC";
> +			fsl,dma-endian-le;
> +			fsl,magic-packet;
> +			fsl,wake-on-filer;
> +			fsl,num_rx_queues = <0x1>;
> +			fsl,num_tx_queues = <0x1>;
> +			local-mac-address = [ 00 00 00 00 00 00 ];
> +			ranges;
> +
> +			queue-group@0 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				reg = <0x0 0x2d10000 0x0 0x8000>;
> +				fsl,rx-bit-map = <0xff>;
> +				fsl,tx-bit-map = <0xff>;
> +				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +		};
> +
> +		enet1: ethernet@2d50000 {
> +			compatible = "fsl,etsec2";
> +			device_type = "network";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			model = "eTSEC";
> +			fsl,dma-endian-le;
> +			fsl,num_rx_queues = <0x1>;
> +			fsl,num_tx_queues = <0x1>;
> +			local-mac-address = [ 00 00 00 00 00 00 ];
> +			ranges;
> +
> +			queue-group@0 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				reg = <0x0 0x2d50000 0x0 0x8000>;
> +				fsl,rx-bit-map = <0xff>;
> +				fsl,tx-bit-map = <0xff>;
> +				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +		};
> +
> +		enet2: ethernet@2d90000 {
> +			compatible = "fsl,etsec2";
> +			device_type = "network";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			model = "eTSEC";
> +			fsl,dma-endian-le;
> +			fsl,num_rx_queues = <0x1>;
> +			fsl,num_tx_queues = <0x1>;
> +			local-mac-address = [ 00 00 00 00 00 00 ];
> +			ranges;
> +
> +			queue-group@0 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				reg = <0x0 0x2d90000 0x0 0x8000>;
> +				fsl,rx-bit-map = <0xff>;
> +				fsl,tx-bit-map = <0xff>;
> +				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
>  		usb@8600000 {
>  			compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
>  			reg = <0x0 0x8600000 0x0 0x1000>;
> -- 
> 2.1.0.27.g96db324
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
