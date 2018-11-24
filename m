Return-Path: <vkoul@kernel.org>
Date: Sat, 24 Nov 2018 20:08:03 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: dmaengine: dw-dmac: add protection
 control property
Message-ID: <20181124143802.GM3175@vkoul-mobl.Dlink>
References: <9c621e11148a5971e34409d7024c48b783d75b1a.1542471341.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c621e11148a5971e34409d7024c48b783d75b1a.1542471341.git.chunkeey@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 17-11-18, 17:17, Christian Lamparter wrote:
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

Applied this series, thanks.

-- 
~Vinod
