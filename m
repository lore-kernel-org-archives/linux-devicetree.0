From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3 1/2] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
Date: Mon, 15 Jul 2013 12:57:05 -0500
Message-ID: <1373911025.8183.308@snotra>
References: <1373884499-24079-1-git-send-email-hongbo.zhang@freescale.com>
	<1373884499-24079-2-git-send-email-hongbo.zhang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373884499-24079-2-git-send-email-hongbo.zhang@freescale.com>
	(from hongbo.zhang@freescale.com on Mon Jul 15 05:34:58 2013)
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, vakul@freescale.com, Hongbo Zhang <hongbo.zhang@freescale.com>
List-Id: devicetree@vger.kernel.org

On 07/15/2013 05:34:58 AM, hongbo.zhang@freescale.com wrote:
> From: Hongbo Zhang <hongbo.zhang@freescale.com>
> 
> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this  
> patch add
> the device tree nodes for them.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
> ---
>  .../devicetree/bindings/powerpc/fsl/dma.txt        |    8 +-
>  arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi          |   90  
> ++++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi          |   90  
> ++++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        |    4 +-
>  4 files changed, 187 insertions(+), 5 deletions(-)
>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt  
> b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> index 2a4b4bc..8ee5732 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> @@ -76,10 +76,10 @@ Freescale PowerPC 85xx/86xx have on chip general  
> purpose DMA controllers.
> 
>  Required properties:
> 
> -- compatible        : compatible list, contains 2 entries, first is
> +- compatible        : compatible list, contains 3 entries, first is
>  		 "fsl,CHIP-dma", where CHIP is the processor
>  		 (mpc8540, mpc8540, etc.) and the second is
> -		 "fsl,eloplus-dma"
> +		 "fsl,eloplus-dma", the third is "fsl,elo3-dma"

The new device tree nodes have only one compatible in the list, not  
three.  And if you were to both fsl,eloplus-dma and fsl,elo3-dma on the  
same node, fsl,elo3-dma should come first.

>  - reg               : <registers mapping for DMA general status reg>
>  - cell-index        : controller index.  0 for controller @ 0x21000,
>                                           1 for controller @ 0xc000
> @@ -100,7 +100,7 @@ Example:
>  	dma@21300 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
> +		compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma",  
> "fsl,elo3-dma";

In addition to the above issue about ordering, mpc8540 does not have  
elo3.

-Scott
