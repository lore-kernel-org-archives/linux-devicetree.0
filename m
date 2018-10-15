From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 1/7] dmaengine: fsldma: Replace DMA_IN/OUT by
 FSL_DMA_IN/OUT
Date: Mon, 15 Oct 2018 22:37:11 +0530
Message-ID: <20181015170711.GK2400@vkoul-mobl>
References: <20181011094655.45707-1-peng.ma@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181011094655.45707-1-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Ma <peng.ma@nxp.com>
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, dan.j.williams@intel.com, zw@zh-kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

On 11-10-18, 17:46, Peng Ma wrote:
> From: Wen He <wen.he_1@nxp.com>
> 
> This patch implement a standard macro call functions is
> used to NXP dma drivers.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>

Please read Documentation/process/submitting-patches.rst, we expect each
patch you send to have your signed off and signed off from orignal
authors

Also as Rob pointed out this patch series should be v8 or so as this is
following the previous work submitted to the list

Please also indicated changes from last rev which help in the review.


-- 
~Vinod
