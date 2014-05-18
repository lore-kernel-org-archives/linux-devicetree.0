From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [RFC PATCH] ARM: dts: am33xx: Re-arrange the USB dt to reflect
 the h/w configuration
Date: Sat, 17 May 2014 21:09:08 -0300
Message-ID: <20140518000908.GA2092@arch.cereza>
References: <1399617068-19826-1-git-send-email-george.cherian@ti.com>
 <20140514215034.GL27426@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140514215034.GL27426@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: George Cherian <george.cherian@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux@arm.linux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, bcousson@baylibre.com, bigeasy@linutronix.de, yegorslists@googlemail.com, balbi@ti.com
List-Id: devicetree@vger.kernel.org

Hello Tony,

On 14 May 02:50 PM, Tony Lindgren wrote:
> * George Cherian <george.cherian@ti.com> [140508 23:34]:
> > Re arrange the USB dt for AM33xx to take it a bit closer
> > to the hardware configuration.
> > 
[..]
> 
> Is this just a cosmetic change or is this trying to workaround
> some edma related init order issue?
> 

This was an attempt from George to workaround an that happens when
the musb_am335x module is removed. However, we've agreed to prevent
the removal instead. I've just (re)sent a patch for it:

See: [PATCH for v3.15] usb: musb: Fix panic upon musb_am335x module removal

AFAIK, this fixes a serious problem so I've marked it for stable.

For the DMA init order issue, I've done a new patch that forces the
probe order in the driver. I'll post that soon.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
