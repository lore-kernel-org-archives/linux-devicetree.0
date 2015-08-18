From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] PL08x DT bindings and LPC18xx DMA support
Date: Tue, 18 Aug 2015 22:12:51 +0530
Message-ID: <20150818164251.GW13546@localhost>
References: <1436616727-4847-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436616727-4847-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 11, 2015 at 02:12:03PM +0200, Joachim Eastwood wrote:
> Hi Vinod,
> 
> This is the non-RFC version of the patch set with only a few changes.
> Hope this can go in for 4.3. Changes to the DT for LPC18xx/43xx will
> go thru arm-soc once this get accepted.
> 
> 
> This patch set aims to add support for DMA on the NXP LPC18xx/43xx
> (Cortex-M3/M4) platform. The platform has a PL080 controller with a
> mux in front of the DMA request lines. This setup is quite common
> and can be found on most other, if not all, NXP LPC devices.
> 
> Patch set adds DT support for the PL08x dmaengine driver and a DMA
> router driver for the LPC18xx/43xx DMA multiplexer.

Applied, thanks

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
