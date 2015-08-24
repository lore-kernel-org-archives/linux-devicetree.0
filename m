From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] doc: dt: Add interrupt parent to Xilinx AXI DMA
 instantation example.
Date: Mon, 24 Aug 2015 08:42:27 +0200
Message-ID: <55DABCD3.60806@xilinx.com>
References: <1440174775-14470-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440174775-14470-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, michal.simek@xilinx.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, soren.brinkmann@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/21/2015 06:32 PM, Moritz Fischer wrote:
> This patch adds 'interrupt-parent' properties to the instantation example in
> the docs for the devicetree bindings of the Xilinx AXI DMA driver.
> 
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> index 2291c40..7c956e9 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> @@ -19,6 +19,7 @@ Required child node properties:
>  - compatible: It should be either "xlnx,axi-dma-mm2s-channel" or
>  	"xlnx,axi-dma-s2mm-channel".
>  - interrupts: Should contain per channel DMA interrupts.
> +- interrupt-parent: Should contain interrupt parent.
>  - xlnx,datawidth: Should contain the stream data width, take values
>  	{32,64...1024}.
>  
> @@ -36,11 +37,13 @@ axi_dma_0: axidma@40400000 {
>  	dma-channel@40400000 {
>  		compatible = "xlnx,axi-dma-mm2s-channel";
>  		interrupts = < 0 59 4 >;
> +		interrupt-parent = <&intc>;
>  		xlnx,datawidth = <0x40>;
>  	} ;
>  	dma-channel@40400030 {
>  		compatible = "xlnx,axi-dma-s2mm-channel";
>  		interrupts = < 0 58 4 >;
> +		interrupt-parent = <&intc>;
>  		xlnx,datawidth = <0x40>;
>  	} ;
>  } ;
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
