From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 2/3] ARM: dts: add Netronix E60K02 board common file
Date: Fri, 11 Oct 2019 17:22:14 +0200
Message-ID: <20191011152214.v6lq6itwf5lp6j7q@pengutronix.de>
References: <20191010192357.27884-1-andreas@kemnade.info>
 <20191010192357.27884-3-andreas@kemnade.info>
 <20191011065609.6irap7elicatmsgg@pengutronix.de>
 <20191011094148.1376430e@aktux>
 <20191011142927.GA11490@bogus>
 <20191011170147.1b3c4b25@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011170147.1b3c4b25@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, mark.rutland@arm.com, marex@denx.de, devicetree@vger.kernel.org, andrew.smirnov@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, angus@akkea.ca, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, manivannan.sadhasivam@linaro.org, j.neuschaefer@gmx.net, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 19-10-11 17:05, Andreas Kemnade wrote:
> On Fri, 11 Oct 2019 09:29:27 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Fri, Oct 11, 2019 at 09:41:48AM +0200, Andreas Kemnade wrote:
> > > On Fri, 11 Oct 2019 08:56:09 +0200
> > > Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >   
> > > > Hi Andreas,
> > > > 
> > > > On 19-10-10 21:23, Andreas Kemnade wrote:  
> > > > > The Netronix board E60K02 can be found some several Ebook-Readers,
> > > > > at least the Kobo Clara HD and the Tolino Shine 3. The board
> > > > > is equipped with different SoCs requiring different pinmuxes.
> > > > > 
> > > > > For now the following peripherals are included:
> > > > > - LED
> > > > > - Power Key
> > > > > - Cover (gpio via hall sensor)
> > > > > - RC5T619 PMIC (the kernel misses support for rtc and charger
> > > > >   subdevices).
> > > > > - Backlight via lm3630a
> > > > > - Wifi sdio chip detection (mmc-powerseq and stuff)
> > > > > 
> > > > > It is based on vendor kernel but heavily reworked due to many
> > > > > changed bindings.
> > > > > 
> > > > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > > > ---
> > > > > Changes in v3:
> > > > > - better led name
> > > > > - correct memory size
> > > > > - comments about missing devices
> > > > > 
> > > > > Changes in v2:
> > > > > - reordered, was 1/3
> > > > > - moved pinmuxes to their actual users, not the parents
> > > > >   of them
> > > > > - removed some already-disabled stuff
> > > > > - minor cleanups    
> > > > 
> > > > You won't change the muxing, so a this dtsi can be self contained?
> > > >   
> > > So you want me to put a big 
> > > #if defined(MX6SLL)   
> > 
> > Not sure what the comment meant, but no, don't do this. C defines in dts 
> > files are for symbolic names for numbers and assembling bitfields and 
> > that's it.
> 
> yes, that is also my opinion. For now, there is only one user
> of this .dtsi, but I have another one in preparation. That is the
> reason for splitting things between .dts and .dtsi to avoid such ugly
> ifdefs

Then IMHO the pnictrl-* entries shouldn't appear in the dsti.

Regards,
  Marco

> Regards,
> Andreas



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
