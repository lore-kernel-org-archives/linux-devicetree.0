From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v6] MTD: LPC32xx SLC NAND driver
Date: Thu, 7 Jun 2012 09:11:08 +0100
Message-ID: <20120607081108.GO8262@n2100.arm.linux.org.uk>
References: <1338974414-5308-1-git-send-email-stigge@antcom.de> <1338989921.6875.50.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1338989921.6875.50.camel@sauron.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 06, 2012 at 04:38:41PM +0300, Artem Bityutskiy wrote:
> On Wed, 2012-06-06 at 11:20 +0200, Roland Stigge wrote:
> > +#else
> > +#define lpc32xx_nand_resume NULL
> > +#define lpc32xx_nand_suspend NULL
> > +#endif
> 
> 0, not NULL.

Err, what planet are you on there.  These are _pointers_ to functions,
so using a _pointer_ is more correct than using an _integer_.
