From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH] spi: dw-mmio: add oftree support
Date: Mon, 17 Mar 2014 09:17:07 +0100
Message-ID: <20140317081707.GQ27506@pengutronix.de>
References: <1394787326-14520-1-git-send-email-s.trumtrar@pengutronix.de>
 <20140314161403.GN25870@e106331-lin.cambridge.arm.com>
 <20140314162614.GW366@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140314162614.GW366@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi!

On Fri, Mar 14, 2014 at 04:26:14PM +0000, Mark Brown wrote:
> On Fri, Mar 14, 2014 at 04:14:03PM +0000, Mark Rutland wrote:
> 
> > > +Synopsys DesignWare SPI master controller.
> > > +
> > > +Required properties:
> > > +- compatible : "snps,dw-spi-mmio"
> 
> > Is there not a better name than "dw-spi-mmio"?
> 
> > What's the full name of the device, as on a datasheet? Is there no model
> > number?
> 
> It's a Synopsis Designware IP block rather than a part - Google suggests
> DW_apb_ssi.

That seems to be the correct IP block, so I will change the compatible to
"snps,dw-apb-ssi".

Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
