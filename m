From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
 controller bindings
Date: Thu, 11 Oct 2018 17:08:45 -0500
Message-ID: <20181011220845.GA20860@bogus>
References: <20181011094655.45707-1-peng.ma@nxp.com>
 <20181011094655.45707-7-peng.ma@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181011094655.45707-7-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Ma <peng.ma@nxp.com>
Cc: vkoul@kernel.org, leoyang.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org, dan.j.williams@intel.com, zw@zh-kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 11, 2018 at 05:46:55PM +0800, Peng Ma wrote:
> Document the devicetree bindings for NXP Layerscape qDMA controller
> which could be found on NXP QorIQ Layerscape SoCs.
> 
> Signed-off-by: Peng Ma <peng.ma@nxp.com>

What happened to the version from Wen He that was on v7 and that I 
already gave my Reviewed-by on?

> ---
>  Documentation/devicetree/bindings/dma/fsl-qdma.txt |   53 ++++++++++++++++++++
>  1 files changed, 53 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/fsl-qdma.txt
