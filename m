From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] dmaengine: imx-sdma: Add DMA event remapping for
 imx6sx-sdma
Date: Mon, 27 Apr 2015 09:09:34 +0200
Message-ID: <20150427070934.GX6325@pengutronix.de>
References: <1429076351-4429-1-git-send-email-nicoleotsuka@gmail.com>
 <20150420094541.GL6325@pengutronix.de>
 <20150420173433.GA6920@Asurada>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150420173433.GA6920@Asurada>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: vinod.koul@intel.com, fabio.estevam@freescale.com, b38343@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 20, 2015 at 10:34:33AM -0700, Nicolin Chen wrote:
> Hi Sascha,
> 
> Thank you for the comments.
> 
> On Mon, Apr 20, 2015 at 11:45:41AM +0200, Sascha Hauer wrote:
> > On Tue, Apr 14, 2015 at 10:39:11PM -0700, Nicolin Chen wrote:
> > > The SDMA on imx6sx has a few DMA event remapping configurations
> > > inside the GPR (General Purpose Register) of that SoC. When users
> > > want to use a non-default DMA event, they need to configure the
> > > GPR register. So this patch gives an interface of the GPR and
> > > implements it in the SDMA driver so as to finish the DMA event
> > > remapping.
> > > 
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> 
> > > diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> > > index dc8d3aa..03315a6 100644
> > > --- a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> > > +++ b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> > > @@ -8,6 +8,7 @@ Required properties:
> > >        "fsl,imx51-sdma"
> > >        "fsl,imx53-sdma"
> > >        "fsl,imx6q-sdma"
> > > +      "fsl,imx6sx-sdma"
> > >    The -to variants should be preferred since they allow to determine the
> > >    correct ROM script addresses needed for the driver to work without additional
> > >    firmware.
> > > @@ -19,6 +20,14 @@ Required properties:
> > >  - fsl,sdma-ram-script-name : Should contain the full path of SDMA RAM
> > >    scripts firmware
> > >  
> > > +Optional properties:
> > > +- fsl, sdma-event-remap : List of one or more DMA event remapping
> > > +  configurations. Its format: <&gpr addr shift val>
> > > +	gpr : the gpr phandle
> > > +	addr : the register address of the GPR
> > > +	shift : the bit shift of the GPR register
> > > +	val : the value of that bit
> > 
> > This binding allows arbitrary register writes to the GPR register space.
> > I don't think we want to allow that. A binding for this if necessary at
> > all must be higher level.
> 
> I was actually wondering where could be the best place to put this in.
> But I couldn't figure out a better place than this driver while being
> worried about the violation as you mentioned.
> 
> But what could be that higher level?

This gpr register effectivly increases the number of event IDs
available by muxing them with existing event IDs. Looking at the SDMA
event mapping table we have:

0 UART6 UART6 Rx FIFO; controlled by IOMUXC register GPR0[0]
1 ADC1 / I2C4 ADC1 DMA request ;Muxed I2C4 DMA event by IOMUXC register GPR0[1]
  ADC1 DMA request
2 IOMUX / CSI2 Muxed with external DMA pad #1, controlled by IOMUXC
  register GPR0[20].
...
47 UART6 UART6 Tx FIFO; controlled by IOMUXC register GPR0[19]

So I would extend that list by additional entries for the muxed dma
events. event 48 then means event 0 alternative, with GPR0[0] set to 1.

BTW. Using defines for the SDMA events like done nowadays for clocks and
other stuff would improve readability, especially when the list of dma
events gets extended by non obvious numbers which do not directly map
to hardware numbers.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
