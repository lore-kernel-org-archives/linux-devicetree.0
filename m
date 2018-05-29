Return-Path: <vkoul@kernel.org>
Date: Tue, 29 May 2018 10:19:25 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v5 1/6] dmaengine: fsldma: Replace DMA_IN/OUT by FSL_DMA_IN/OUT
Message-ID: <20180529044925.GD5666@vkoul-mobl>
References: <20180525111920.24498-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525111920.24498-1-wen.he_1@nxp.com>
To: Wen He <wen.he_1@nxp.com>
Cc: dmaengine@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 25-05-18, 19:19, Wen He wrote:
> This patch implenment a standard macro call functions is
> used to NXP dma drivers.

Well that patch seems to do a bit more than replace DMA_IN/OUT by FSL_DMA_IN/OUT
care to explain those. best would be to do a patch which does replace and then
add new things in separate patch, easier to review

-- 
~Vinod
