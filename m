From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH v9 2/2] dmaengine: Add Xilinx zynqmp dma engine driver support
Date: Mon, 30 May 2016 11:47:01 +0530
Message-ID: <CAKfKVtE-2rYVmCK1OOzitayH7AzUQHnspoEv6RBLCxUJVnVksg@mail.gmail.com>
References: <1463123033-5443-1-git-send-email-appanad@xilinx.com>
	<1463123033-5443-2-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463123033-5443-2-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, Moritz Fischer <moritz.fischer@ettus.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, luis@debethencourt.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

> + */
> +static void zynqmp_dma_update_desc_to_ctrlr(struct zynqmp_dma_chan *chan,
> +                                     struct zynqmp_dma_desc_sw *desc)
> +{
> +       dma_addr_t addr;
> +
> +       addr = desc->src_p;
> +       writel(addr, chan->regs + ZYNQMP_DMA_SRC_START_LSB);
> +       writel(upper_32_bits(addr), chan->regs + ZYNQMP_DMA_SRC_START_MSB);
Can we combine the two writes to a 64bit write.
It may be helpful on 64-bit systems.


> +       addr = desc->dst_p;
> +       writel(addr, chan->regs + ZYNQMP_DMA_DST_START_LSB);
> +       writel(upper_32_bits(addr), chan->regs + ZYNQMP_DMA_DST_START_MSB);
> +}
