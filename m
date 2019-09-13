From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: dma: Add documentation for DMA domains
Date: Fri, 13 Sep 2019 15:36:28 +0100
Message-ID: <5d7ba96c.1c69fb81.ee467.32b9@mx.google.com>
References: <20190910115037.23539-1-peter.ujfalusi@ti.com>
 <20190910115037.23539-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910115037.23539-2-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 02:50:35PM +0300, Peter Ujfalusi wrote:
> On systems where multiple DMA controllers available, non Slave (for example
> memcpy operation) users can not be described in DT as there is no device
> involved from the DMA controller's point of view, DMA binding is not usable.
> However in these systems still a peripheral might need to be serviced by or
> it is better to serviced by specific DMA controller.
> When a memcpy is used to/from a memory mapped region for example a DMA in the
> same domain can perform better.
> For generic software modules doing mem 2 mem operations it also matter that
> they will get a channel from a controller which is faster in DDR to DDR mode
> rather then from the first controller happen to be loaded.
> 
> This property is inherited, so it may be specified in a device node or in any
> of its parent nodes.

If a device needs mem2mem dma, I think we should just use the existing 
dma binding. The provider will need a way to define cell values which 
mean mem2mem.

For generic s/w, it should be able to query the dma speed or get a 
preferred one IMO. It's not a DT problem.

We measure memcpy speeds at boot time to select the fastest 
implementation for a chip, why not do that for mem2mem DMA?

> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../devicetree/bindings/dma/dma-domain.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/dma-domain.yaml

Note that you have several errors in your schema. Run 'make dt_bindings_check'.

Rob
