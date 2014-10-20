From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4] dma: Add Xilinx AXI Direct Memory Access Engine driver support
Date: Mon, 20 Oct 2014 21:37:14 +0200
Message-ID: <4301925.4pMHXMXqA4@wuerfel>
References: <1413374436-14410-1-git-send-email-sthokal@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413374436-14410-1-git-send-email-sthokal@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Srikanth Thokala <sthokal@xilinx.com>, vinod.koul@intel.com, dan.j.williams@intel.com, michals@xilinx.com, grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, svemula@xilinx.com, linux-kernel@vger.kernel.org, anirudh@xilinx.com, dmaengine@vger.kernel.org, appanad@xilinx.com
List-Id: devicetree@vger.kernel.org

On Wednesday 15 October 2014 17:30:36 Srikanth Thokala wrote:
> @@ -15,6 +15,9 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  
> +/* Number of AXI DMA APP Words */
> +#define XILINX_DMA_NUM_APP_WORDS       5
> +
>  /**
>   * struct xilinx_vdma_config - VDMA Configuration structure
>   * @frm_dly: Frame delay
> @@ -41,7 +44,21 @@ struct xilinx_vdma_config {
>         int ext_fsync;
>  };
>  
> +/**
> + * struct xilinx_dma_config - DMA Configuration structure
> + * @coalesc: Interrupt coalescing threshold
> + * @delay: Delay counter
> + * @reset: Reset Channel
> + */
> +struct xilinx_dma_config {
> +       int coalesc;
> +       int delay;
> +       int reset;
> +};
> +
>  int xilinx_vdma_channel_set_config(struct dma_chan *dchan,
>                                         struct xilinx_vdma_config *cfg);
> +int xilinx_dma_channel_set_config(struct dma_chan *dchan,
> +                                       struct xilinx_dma_config *cfg);
>  

You add this to a global header file, but I don't see any uses outside
of the driver itself. Please move all of this into the driver itself
and remove the header file.

	Arnd
