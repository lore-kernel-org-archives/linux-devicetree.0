From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 0/3] dmaengine: bcm2835: support dma channel 11 to 14
Date: Tue, 19 Apr 2016 21:03:20 +0530
Message-ID: <20160419153320.GT2274@localhost>
References: <1460381349-14408-1-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460381349-14408-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 11, 2016 at 01:29:06PM +0000, kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org wrote:
> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
> 
> Right now the dma engine officially supports dma channel 11 and 12.
> But the use of dma channel 12 immediately stalls the system.
> 
> The reason is that the interrupt assigned right now to dma channel 11
> is actually a shared interrupt for dma channels 11 to 12.
> So whenever the dma channel 12, 13 or 14 is used, it triggers the interrupt
> for dma 11 which only clears the interrupt flag for dma channel 11.
> This results in the interrupt 11 is triggered all the time.
> 
> On top the requesting dma channel12 (and the corresponding irq) triggers
> an immeditate stall of the system, because for the 12th interrupt
> any dma channel will trigger also this interrupt - even if the dma channel
> is controlled by the firmware.
> 
> As the description in the default device-tree is (for the above reasons)
> wrong a new means had to get devised that allows correct representation
> of the mapping between interrupts and dma channels.
> 
> For this the existing (but unused) device-tree property "interrupt-names"
> is used to define the mapping.
> 
> Implementing shared interrupts is another necessity when using dma channel
> 11 to 14, so it is a part of this patch.

Applied, thanks

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
