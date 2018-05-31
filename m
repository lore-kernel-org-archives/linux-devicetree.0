Return-Path: <robherring2@gmail.com>
Date: Wed, 30 May 2018 19:49:42 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [v5 3/6] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
 controller bindings
Message-ID: <20180531004942.GA10577@rob-hp-laptop>
References: <20180525111920.24498-1-wen.he_1@nxp.com>
 <20180525111920.24498-3-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525111920.24498-3-wen.he_1@nxp.com>
To: Wen He <wen.he_1@nxp.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Fri, May 25, 2018 at 07:19:17PM +0800, Wen He wrote:
> Document the devicetree bindings for NXP Layerscape qDMA controller
> which could be found on NXP QorIQ Layerscape SoCs.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
> change in v5:
> 	- Replace dts node variable 'queues' to 'fsl,queues' that add vendor prefix
> 
> change in v4:
> 	- Rewrite the bindings document that follows generic DMA bindings file
> 
> change in v3:
> 	- no change
> 
> change in v2:
> 	- Remove indentation
> 	- Add "Should be" before 'fsl,ls1021a-qdma'
> 	- Replace 'channels' by 'dma-channels'
> 	- Replace 'qdma@8390000' by 'dma-controller@8390000'
> 
>  Documentation/devicetree/bindings/dma/fsl-qdma.txt |   41 ++++++++++++++++++++
>  1 files changed, 41 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/fsl-qdma.txt

Reviewed-by: Rob Herring <robh@kernel.org>
