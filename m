From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4] dma: Add Xilinx AXI Direct Memory Access Engine
 driver support
Date: Wed, 15 Oct 2014 16:00:36 +0100
Message-ID: <20141015150036.GF20034@leverpostej>
References: <1413374436-14410-1-git-send-email-sthokal@xilinx.com>
 <20141015124527.GA20034@leverpostej>
 <20141015133248.GQ1638@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141015133248.GQ1638-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 15, 2014 at 02:32:48PM +0100, Vinod Koul wrote:
> On Wed, Oct 15, 2014 at 01:45:28PM +0100, Mark Rutland wrote:
> > Hi,
> > 
> > On Wed, Oct 15, 2014 at 01:00:36PM +0100, Srikanth Thokala wrote:
> > > This is the driver for the AXI Direct Memory Access (AXI DMA)
> > > core, which is a soft Xilinx IP core that provides high-
> > > bandwidth direct memory access between memory and AXI4-Stream
> > > type target peripherals.
> > > 
> > > This module works on Zynq (ARM Based SoC) and Microblaze platforms.
> > > 
> > > Signed-off-by: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > Changes in v4:
> > > - Add direction field to VDMA descriptor structure and removed from
> > >   channel structure to avoid duplication.
> > > - Check for DMA idle condition before changing the configuration.
> > > - Residue is being calculated in complete_descriptor() and is reported
> > >   to slave driver.
> > > 
> > > Changes in v3:
> > > - Rebased on 3.16-rc7
> > > 
> > > Changes in v2:
> > > - Simplified the logic to set SOP and APP words in prep_slave_sg().
> > > - Corrected function description comments to match the return type.
> > > - Fixed some minor comments as suggested by Andy, Thanks.
> > 
> > This patch has come without the necessary device tree binding document,
> > and I was not able to find an existing binding document upstream (I
> > searched for "xlnx,axi-dma-1.00.a" and "axi-dma").
> which tree did you grep. 

Torvalds'

> This is present in slave-dmaengine.git 
> 
> commit ddc643630f5deb1995d191719086b64873c67a44
> Author: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Date:   Mon Jul 28 17:47:48 2014 +0530
> 
>     dma: Add Xilinx AXI DMA DT Binding Documentation
> 
>     Device-tree binding documentation of Xilinx DMA Engine
> 
>     Signed-off-by: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>     Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>     Signed-off-by: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

I see. Thanks for the pointer.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
