From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dma: Add Spreadtrum SC9860 DMA
 controller
Date: Mon, 24 Jul 2017 12:52:46 -0500
Message-ID: <20170724175246.fgqtls664zmg4r4y@rob-hp-laptop>
References: <63f2b93b3e484862f736e37d6d422b5566637163.1500361078.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63f2b93b3e484862f736e37d6d422b5566637163.1500361078.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: vinod.koul@intel.com, mark.rutland@arm.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 03:06:11PM +0800, Baolin Wang wrote:
> This patch adds the binding documentation for Spreadtrum SC9860 DMA
> controller device.
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
>  Documentation/devicetree/bindings/dma/sprd-dma.txt |   41 ++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sprd-dma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/sprd-dma.txt b/Documentation/devicetree/bindings/dma/sprd-dma.txt
> new file mode 100644
> index 0000000..3ccf776
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/sprd-dma.txt
> @@ -0,0 +1,41 @@
> +* Spreadtrum DMA controller
> +
> +This driver follows the generic DMA bindings defined in dma.txt.

s/driver/binding/

With that,

Acked-by: Rob Herring <robh@kernel.org>
