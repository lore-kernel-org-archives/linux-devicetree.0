Return-Path: <robherring2@gmail.com>
Date: Sat, 17 Nov 2018 09:32:47 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: dmaengine: dw-dmac: add protection
 control property
Message-ID: <20181117153247.GA21745@bogus>
References: <a8cd42ce348ed6a21580815f25ab1590aaa6acf3.1541866004.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8cd42ce348ed6a21580815f25ab1590aaa6acf3.1541866004.git.chunkeey@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <vireshk@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, 10 Nov 2018 17:28:30 +0100, Christian Lamparter wrote:
> This patch for the DesignWare AHB Central
> Direct Memory Access Controller adds the dma
> protection control property:
> 	"snps,dma-protection-control"
> 
> as well as the properties specific values defines into
> a new include file: include/dt-bindings/dma/dw-dmac.h
> 
> Note: The protection control signals are one-to-one
> mapped to the AHB HPROT[1:3] signals for this controller.
> The HPROT0 (Data Access) is always hardwired to 1.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> I've included the "Reviewed-by" from the v1 in this patch for now.
> But if a new issue comes up regarding the updates, please let me know.
> ---
>  Documentation/devicetree/bindings/dma/snps-dma.txt |  4 ++++
>  MAINTAINERS                                        |  4 +++-
>  include/dt-bindings/dma/dw-dmac.h                  | 14 ++++++++++++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/dma/dw-dmac.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
