From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: of_dma: Correct return code for
 of_dma_request_slave_channel in case !CONFIG_OF
Date: Mon, 16 Nov 2015 09:03:53 +0530
Message-ID: <20151116033353.GU25173@localhost>
References: <1446546490-7432-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446546490-7432-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 03, 2015 at 12:28:10PM +0200, Peter Ujfalusi wrote:
> of_dma_request_slave_channel should return either pointer for valid
> dma_chan or ERR_PTR() error code, NULL is not expected to be returned.

Applied, thanks

-- 
~Vinod
