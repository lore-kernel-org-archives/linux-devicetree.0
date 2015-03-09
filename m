From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Date: Mon, 9 Mar 2015 10:58:43 +0100
Message-ID: <20150309095843.GA31289@pengutronix.de>
References: <1425510624-22250-1-git-send-email-stefan@agner.ch>
 <1425510624-22250-2-git-send-email-stefan@agner.ch>
 <20150306061502.GB10997@pengutronix.de>
 <fdfc84d92bbcb8abc98f2c29e1aa368b@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fdfc84d92bbcb8abc98f2c29e1aa368b@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: geert@linux-m68k.org, dwmw2@infradead.org, computersforpeace@gmail.com, mark.rutland@arm.com, boris.brezillon@free-electrons.com, aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 06, 2015 at 02:31:51PM +0100, Stefan Agner wrote:
> On 2015-03-06 07:15, Sascha Hauer wrote:
> > Hi Stefan,
> > 
> > On Thu, Mar 05, 2015 at 12:10:20AM +0100, Stefan Agner wrote:
> >> +
> >> +static int vf610_nfc_probe_dt(struct device *dev, struct vf610_nfc_config *cfg)
> >> +{
> >> +	struct device_node *np = dev->of_node;
> >> +	int buswidth;
> >> +	u32 clkrate;
> >> +
> >> +	if (!np)
> >> +		return 1;
> >> +
> >> +	cfg->flash_bbt = of_get_nand_on_flash_bbt(np);
> >> +
> >> +	if (!of_property_read_u32(np, "clock-frequency", &clkrate))
> >> +		cfg->clkrate = clkrate;
> > 
> > Normally the clock-frequency property tells the driver at which
> > frequency the device actually is running, not to tell the driver at
> > which frequency the device *should* run. It's strange to use the value
> > of the clock-frequency property as input to clk_set_rate(). Maybe the
> > assigned clock binding is more appropriate here, see
> > Documentation/devicetree/bindings/clock/clock-bindings.txt.
> 
> What we try to do here is to specify the hardware limitations. There
> seem to be some hardware restrictions when it comes to clock
> frequencies. There has been a rather long discussion over at Freescales
> community about it:
> https://community.freescale.com/thread/317074
> 
> Not sure if this is the right way to specify the supported frequencies,
> or should we create a custom property for this, something like
> fsl,max-nfc-frequency = <33000000>?

What's wrong with the assigned clock binding? All you have to do is to
add it to the device node. The rest will be done from the generic clock
framework with no additional driver code.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
