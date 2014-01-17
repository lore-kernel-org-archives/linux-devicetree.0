From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] Add Xilinx AXI Video DMA Engine driver
Date: Fri, 17 Jan 2014 17:32:17 +0200
Message-ID: <1389972737.7619.14.camel@smile>
References: <1389894803-4147-1-git-send-email-sthokal@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389894803-4147-1-git-send-email-sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-01-16 at 23:23 +0530, Srikanth Thokala wrote:
> Hi,
> 
> This is the driver for Xilinx AXI Video Direct Memory Access Engine.
> It is a soft IP core, which provides high-bandwidth direct memory
> access between memory and AXI4-Stream video type target peripherals 
> including peripherals which support AXI4-Stream Video Protocol. The
> core provides efficient two dimensional DMA operations with independent
> asynchronous read and write channel operation.
> 
> For more information on the IP, please refer to
> http://www.xilinx.com/support/documentation/ip_documentation/axi_vdma/v6_1/pg020_axi_vdma.pdf
> 
> This patch also provides a test client, which assumes read and write channels
> of the core are configured in a back-to-back connection.  It transfers 
> data on the write channel, read and verify the data on the read channel. 
> 
>  drivers/dma/xilinx/xilinx_vdma_test.c              |  629 ++++++++

What about to modify dmatest.c accordingly to your needs?
I see no much sense to have another copy of that in the tree.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
