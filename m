From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: dmaengine: dma-common: Change
 dma-channel-mask to uint32-array
Date: Tue, 1 Oct 2019 08:40:15 -0500
Message-ID: <20191001134015.GA14840@bogus>
References: <20190930114055.29315-1-peter.ujfalusi@ti.com>
 <20190930114055.29315-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190930114055.29315-2-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 30 Sep 2019 14:40:53 +0300, Peter Ujfalusi wrote:
> Make the dma-channel-mask to be usable for controllers with more than 32
> channels.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/dma/dma-common.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
