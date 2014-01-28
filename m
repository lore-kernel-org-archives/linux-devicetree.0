From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [Patch v3 2/2] dmaengine: qcom_bam_dma: Add device tree binding
Date: Tue, 28 Jan 2014 13:50:35 -0600
Message-ID: <20140128195035.GB18930@qualcomm.com>
References: <1390890471-14882-1-git-send-email-agross@codeaurora.org>
 <1390890471-14882-3-git-send-email-agross@codeaurora.org>
 <52E772DF.6000604@metafoo.de>
 <4697306.PPWWh8UGTE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4697306.PPWWh8UGTE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 28, 2014 at 10:16:53AM +0100, Arnd Bergmann wrote:
> On Tuesday 28 January 2014 10:05:35 Lars-Peter Clausen wrote:
> > > +
> > > +Clients must use the format described in the dma.txt file, using a three cell
> > > +specifier for each channel.
> > > +
> > > +The three cells in order are:
> > > +  1. A phandle pointing to the DMA controller
> > > +  2. The channel number
> > > +  3. Direction of the fixed unidirectional channel
> > > +     0 - Memory to Device
> > > +     1 - Device to Memory
> > > +     2 - Device to Device
> > > +
> > 
> > Why does the direction needs to be specified in specifier? I see two
> > options, either the direction per is fixed in hardware. In that case the DMA
> > controller node should describe which channel is which direction. Or the
> > direction is not fixed in hardware and can be changed at runtime in which
> > case it should be set on a per descriptor basis.
> 
> Normally the direction is implied by dmaengine_slave_config().
> Note that neither the dma slave API nor the generic DT binding
> can actually support device-to-device transfers, since this
> normally implies using two dma-request lines rather than one.
> 
> There might be a case where the direction is required in order
> to allocate a channel, because the engine has specialized channels
> per direction, and might connect any of them to any dma request
> line. This does not seem to be the case for "bam", because
> the DMA specifier already contains a specific channel number, not
> a request line or slave ID number.
> 

In the case of BAM, the channels are hardcoded based on the attached peripheral.
For instance, if the BAM is attached to the BLSP UART, channel 0 is uart0-RX,
channel 1 is uart0-TX, channel 2 is uart1-RX... etc, etc.  So not only is the
direction hardcoded, but also the function.

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
