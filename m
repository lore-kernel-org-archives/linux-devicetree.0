From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 0/2] Enable VDMA S2MM vertical flip support
Date: Fri, 29 Jun 2018 14:21:05 +0530
Message-ID: <20180629085105.GC22377@vkoul-mobl>
References: <1528875288-9140-1-git-send-email-radhey.shyam.pandey@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528875288-9140-1-git-send-email-radhey.shyam.pandey@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, dan.j.williams@intel.com, appana.durga.rao@xilinx.com, lars@metafoo.de, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13-06-18, 13:04, Radhey Shyam Pandey wrote:
> The AXI VDMA core supports Vertical Flip with S2MM as the path when
> Enable Vertical Flip (Advanced tab) is selected. This patch series add
> DT property for vertical flip and program its state in VDMA start_transfer.

Applied both, thanks

-- 
~Vinod
