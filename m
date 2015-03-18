From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH_V3 2/3] dma: jz4780: add driver for the Ingenic JZ4780
 DMA controller
Date: Wed, 18 Mar 2015 16:49:27 +0530
Message-ID: <20150318111927.GJ32683@intel.com>
References: <1424954614-12589-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1424954614-12589-3-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20150316104646.GM32683@intel.com>
 <55086D68.1000303@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55086D68.1000303@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex@alex-smith.me.uk
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 06:07:36PM +0000, Zubair Lutfullah Kakakhel wrote:
> >> +static uint32_t jz4780_dma_transfer_size(unsigned long val, int *ord)
> >> +{
> >> +	*ord = ffs(val) - 1;
> >> +
> >> +	/* 8 byte transfer sizes unsupported so fall back on 4. */
> > okay falling back is not a good idea, same applies for default in
> > jz4780_dma_width(). The slave dma parameters are match with devices, so
> > programming something which you dont support, falling back or using defaults
> > is not a good idea
> How bad of an idea is it and what is a better way?
> I see similar stuff in imx-dma and dma-jz4740.
> 
> And my jz4740-mmc driver (I add jz4780 support and use it to test this dma driver mainly)
> falls back on defaults after it requests a larger transfer size.
Well emmc it might work, but consider you did fall back on audio playback,
you will get crapped out audio, or a SPI transfer.

That is why falling back causes issues, so right way would be return error
and have driver fixed for it

-- 
~Vinod
