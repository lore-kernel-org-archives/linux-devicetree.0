From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC 2/2] mux: mmio-based syscon mux controller
Date: Wed, 19 Apr 2017 17:27:20 +0200
Message-ID: <1492615640.2970.145.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <20170413154812.19597-2-p.zabel@pengutronix.de>
         <58fd5844-f24a-37cc-be81-26a716251860@gmail.com>
         <1492602613.2970.92.camel@pengutronix.de>
         <e4d4b515-e799-9594-f88a-de9d8a5d14bb@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4d4b515-e799-9594-f88a-de9d8a5d14bb@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wed, 2017-04-19 at 13:58 +0200, Peter Rosin wrote:
> On 2017-04-19 13:50, Philipp Zabel wrote:
> > On Thu, 2017-04-13 at 18:09 -0700, Steve Longerbeam wrote:
> >>
> >> On 04/13/2017 08:48 AM, Philipp Zabel wrote:
> >>> This adds a driver for mmio-based syscon multiplexers controlled by a
> >>> single bitfield in a syscon register range.
> >>>
> >>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> >>> ---
> >>>   drivers/mux/Kconfig      |  13 +++++
> >>>   drivers/mux/Makefile     |   1 +
> >>>   drivers/mux/mux-syscon.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++
> >>>   3 files changed, 144 insertions(+)
> >>>   create mode 100644 drivers/mux/mux-syscon.c
> >>>
> >>> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> >>> index 86668b4d2fc52..a5e6a3b01ac24 100644
> >>> --- a/drivers/mux/Kconfig
> >>> +++ b/drivers/mux/Kconfig
> >>> @@ -43,4 +43,17 @@ config MUX_GPIO
> >>>   	  To compile the driver as a module, choose M here: the module will
> >>>   	  be called mux-gpio.
> >>>   
> >>> +config MUX_SYSCON
> >>
> >> my preference would be CONFIG_MUX_MMIO.
> >>
> >>> +	tristate "MMIO bitfield-controlled Multiplexer"
> >>
> >> "MMIO register bitfield-controlled Multiplexer"
> >>
> >> The rest looks good to me.
> > 
> > I'll change those. mux-syscon.c should probably be renamed to
> > mux-mmio.c, too.
> 
> I think I disagree. But I'm not familiar with syscon so I don't know.
> IIUC, syscon uses regmap to do mmio and this driver requires syscon
> to get at the regmap, and in the end this driver doesn't know anything
> about mmio. All it knows is syscon/regmap.

That is a good point. Right now there is nothing MMIO about the driver
except for the hardware that I want it to handle.

>  If some warped syscon
> thing shows up that wraps something other than mmio in its regmap,
> this driver wouldn't care about it. And syscon is something that
> is also known in the DT world. Given that, I think everything in this
> driver should be named syscon and not mmio.
> 
> Or?

Well, ...

the driver could be extended to do actual MMIO if the syscon is not
found. This would work only if it has exclusive access to its register.

On the other hand, the driver could also be made to match against
    compatible = "bitfield-mux",
for example, and allow handling muxes inside SPI or I2C controlled MFD
devices that provide a syscon regmap, as you describe:

	spi-host {
		mfd-device {
			compatible = "some-spi-regmap-device";

			mux {
				compatible = "bitfield-mux";
			};
		};
	};

regards
Philipp
