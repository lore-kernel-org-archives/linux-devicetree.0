From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: use cs-gpios for cros_ec_spi
Date: Mon, 19 Jun 2017 17:47:40 -0700
Message-ID: <20170620004739.GA67314@google.com>
References: <1497331543-8565-1-git-send-email-jeffy.chen@rock-chips.com>
 <1497331543-8565-4-git-send-email-jeffy.chen@rock-chips.com>
 <20170613175043.GC9026@google.com>
 <20170613182225.smahsf3jzvbc7w7z@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170613182225.smahsf3jzvbc7w7z-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Forgot to follow up here:

On Tue, Jun 13, 2017 at 07:22:25PM +0100, Mark Brown wrote:
> On Tue, Jun 13, 2017 at 10:50:44AM -0700, Brian Norris wrote:
> > On Tue, Jun 13, 2017 at 01:25:43PM +0800, Jeffy Chen wrote:
> > > The cros_ec requires CS line to be active after last message. But the CS
> > > would be toggled when powering off/on rockchip spi, which breaks ec xfer.
> > > Use GPIO CS to prevent that.
> 
> > I suppose this change is fine. (At least, I don't have a good reason not
> > to do this.)
> 
> > But I still wonder whether this is something that the SPI core can be
> > expected to handle. drivers/mfd/cros_ec_spi.c already sets the
> > appropriate trans->cs_change bits, to ensure CS remains active in
> > between certain messages (all under spi_bus_lock()). But you're
> > suggesting that your bus controller may deassert CS if you runtime
> > suspend the device (e.g., in between messages).
> 
> > So, is your controller just peculiar? Or should the SPI core avoid
> > autosuspending the bus controller when it's been instructed to keep CS
> > active? Any thoughts Mark?
> 
> This sounds like the controller being unusual - though frankly the
> ChromeOS chip select usage is also odd so it's fairly rare for something
> like this to come up.  I'd not expect a runtime suspend to loose the pin
> state, though possibly through use of pinctrl rather than the
> controller.

I haven't personally verified this behavior (it probably wouldn't be too
hard to rig up a test driver to hold CS low while allowing the
controller to autosuspend? spidev can do this?), but Rockchip folks seem
to have concluded this.

I suppose I'm fine with relying on cs-gpios as a workaround.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
