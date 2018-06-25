From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/5] dt-bindings: dmaengine: xilinx_dma: drop has-sg
 property
Date: Mon, 25 Jun 2018 11:30:13 -0600
Message-ID: <20180625173013.GA2268@rob-hp-laptop>
References: <20180625092724.22164-1-andrea.merello@gmail.com>
 <20180625092724.22164-5-andrea.merello@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180625092724.22164-5-andrea.merello@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Merello <andrea.merello@gmail.com>
Cc: vkoul@kernel.org, dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2018 at 11:27:24AM +0200, Andrea Merello wrote:
> This property is not needed anymore, because the driver now autodetects it.
> Delete references in documentation.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> ---
> Changes in v2:
> 	- cc DT maintainer
> Changes in v3:
> 	- cc DT maintainerS/ML
> ---
>  Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
