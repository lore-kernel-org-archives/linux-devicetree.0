From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: dma: ti-edma: Document
 dma-channel-mask for EDMA
Date: Tue, 1 Oct 2019 08:40:31 -0500
Message-ID: <20191001134031.GA15324@bogus>
References: <20190930114055.29315-1-peter.ujfalusi@ti.com>
 <20190930114055.29315-3-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190930114055.29315-3-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 30 Sep 2019 14:40:54 +0300, Peter Ujfalusi wrote:
> Similarly to paRAM slots, channels can be used by other cores.
> 
> The common dma-channel-mask property can be used for specifying the
> available channels.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/dma/ti-edma.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
