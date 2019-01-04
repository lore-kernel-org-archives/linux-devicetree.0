From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v6 1/7] dmaengine: xilinx_dma: commonize DMA copy size
 calculation
Date: Fri, 4 Jan 2019 20:29:24 +0530
Message-ID: <20190104145924.GG13372@vkoul-mobl.Dlink>
References: <20181120153151.18024-1-andrea.merello@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120153151.18024-1-andrea.merello@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Merello <andrea.merello@gmail.com>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, radhey.shyam.pandey@xilinx.com
List-Id: devicetree@vger.kernel.org

On 20-11-18, 16:31, Andrea Merello wrote:
> This patch removes a bit of duplicated code by introducing a new
> function that implements calculations for DMA copy size, and
> prepares for changes to the copy size calculation that will
> happen in following patches.

Applied all, thanks
-- 
~Vinod
