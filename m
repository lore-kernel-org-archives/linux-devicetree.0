From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v11 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
 support
Date: Thu, 30 Jun 2016 09:56:53 +0530
Message-ID: <20160630042653.GM14945@localhost>
References: <1465486667-30737-1-git-send-email-appanad@xilinx.com>
 <1465486667-30737-2-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465486667-30737-2-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 09, 2016 at 09:07:47PM +0530, Kedareswara rao Appana wrote:

> +	dma_set_mask(&pdev->dev, DMA_BIT_MASK(44));
> +	dma_cap_set(DMA_SG, zdev->common.cap_mask);
> +	dma_cap_set(DMA_MEMCPY, zdev->common.cap_mask);
 
>  /**
> + * struct zynqmp_dma_config - ZYNQMP DMA Configuration structure
> + * @ovrfetch: Overfetch status
> + * @has_sg: Support scatter gather transfers
> + * @ratectrl: Rate control value
> + * @src_issue: Out standing transactions on source
> + * @src_burst_len: Source burst length
> + * @dst_burst_len: Dest burst length
> + */

As discussed in other thread as well, this is no-go for memcpy. Please come
back after removing this

For slave usages use the dma_slave_config

-- 
~Vinod
