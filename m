From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/2] of: dma: make #dma-cells optional
Date: Thu, 7 Mar 2013 12:04:26 +0530
Message-ID: <20130307063426.GF13370@intel.com>
References: <1362013078-2213-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1362013078-2213-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2013 at 06:57:57PM -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> For controllers with no requests/clients (memory to memory only), the
Change log is truncated...

> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Cc: Dan Williams <djbw@fb.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> ---
>  Documentation/devicetree/bindings/dma/dma.txt |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
> index 8f504e6..d388f06 100644
> --- a/Documentation/devicetree/bindings/dma/dma.txt
> +++ b/Documentation/devicetree/bindings/dma/dma.txt
> @@ -8,9 +8,10 @@ controller.
>  * DMA controller
>  
>  Required property:
> -- #dma-cells: 		Must be at least 1. Used to provide DMA controller
> -			specific information. See DMA client binding below for
> -			more details.
> +- #dma-cells: 		Required for controllers with requests. Optional for
> +			memory to memory only DMA controllers. Must be at least
> +			1. Used to provide DMA controller specific information. 
> +			See DMA client binding below for more details.
>  
>  Optional properties:
>  - dma-channels: 	Number of DMA channels supported by the controller.
> -- 
> 1.7.10.4
> 
