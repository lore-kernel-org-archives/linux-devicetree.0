Return-Path: <vkoul@kernel.org>
Date: Wed, 4 Sep 2019 10:23:13 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] dt-bindings: dmaengine: dma-common: Fix the
 dma-channel-mask property
Message-ID: <20190904045313.GY2672@vkoul-mobl>
References: <1566988223-14657-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566988223-14657-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 28-08-19, 19:30, Yoshihiro Shimoda wrote:
> The commit b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas
> for the generic DMA bindings") changed the property from
> dma-channel-mask to dma-channel-masks. So, this patch fixes it.

Applied, thanks

-- 
~Vinod
