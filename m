From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/3] mmc: add support for power-on sequencing through DT
Date: Tue, 21 Jan 2014 08:25:51 +0100
Message-ID: <20140121072550.GU16215@pengutronix.de>
References: <1390190215-22700-1-git-send-email-olof@lixom.net>
 <1390190215-22700-2-git-send-email-olof@lixom.net>
 <20140121072447.GC19940@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140121072447.GC19940@pengutronix.de>
Sender: linux-mmc-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-mmc@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, chris@printf.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.ok, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 08:24:47AM +0100, Sascha Hauer wrote:
> On Sun, Jan 19, 2014 at 07:56:53PM -0800, Olof Johansson wrote:
> > +Card power and reset control:
> > +The following properties can be specified for cases where the MMC
> > +peripheral needs additional reset, regulator and clock lines. It is for
> > +example common for WiFi/BT adapters to have these separate from the main
> > +MMC bus:
> > +  - card-reset-gpios: Specify GPIOs for card reset (reset active low)
> 
> We have GPIO_ACTIVE_LOW/HIGH. No need to hardcode this.

Fabio already spotted that. Sorry for the noise.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
