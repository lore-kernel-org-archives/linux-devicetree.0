Return-Path: <SRS0=gS19=JJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751442AbeFWMds (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 23 Jun 2018 08:33:48 -0400
Date: Sat, 23 Jun 2018 18:03:39 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH resend] dmaengine: rcar-dmac: Document R8A77990 bindings
Message-ID: <20180623123339.GY27187@vkoul-mobl>
References: <1529496097-10629-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529496097-10629-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, horms@verge.net.au, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On 20-06-18, 14:01, Ulrich Hecht wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> Renesas R-Car E3 (R8A77990) SoC also has the R-Car gen2/3 compatible DMA
> controllers, so document the SoC specific binding.
> 
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This didn't apply for Vinod before, but now it seems to. If it still does
> not, please tell me what tree to base this on.

It applied for me this time so applied thanks.
Typically it should apply cleanly on dmaengine-next

-- 
~Vinod
