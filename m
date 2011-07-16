From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sat, 16 Jul 2011 15:57:49 +0800
Message-ID: <20110716075748.GI1840@S2100-06.ap.freescale.net>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<CAOZdJXVeM4Axf=TC4qKNHyqb=iDoDceGr-xjLNpD20WfL2h46Q@mail.gmail.com>
	<201107152011.41546.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201107152011.41546.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2011 at 08:11:41PM +0200, Arnd Bergmann wrote:
> On Friday 15 July 2011 18:45:38 Tabi Timur-B04825 wrote:
> > 
> > On Fri, Jul 15, 2011 at 11:32 AM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > 
> > > First of all, using powerpc dma-channel binding on such dma event
> > > seems not reflecting the hardware facts.  Secondly, the binding in
> > > this case (below) looks silly.  Thirdly, device driver need to make
> > > code change for simply getting a dma event number.
> > 
> > Take a look at p1022ds.dts or mpc8610hpcd.dts.  We create separate DMA
> > channel nodes on Freescale PowerPC parts because the channels really
> > are independent.  On these two boards, some of the DMA channels are
> > used by the async DMA driver, and two of the channels are used by the
> > audio driver.
> 
> I think this is much better than using IORESOURCE_DMA fields, which
> basically are only well-defined for PC-style i8237 DMA controllers
> used in stuff like floppy drives and ISA sound cards.
> 
> However, we should find a way to standardize finding the dma_chan
> for an platform_device based on a phandle. Maybe a little helper
> that will scan a well-known property (dma-channels?) for phandles
> to a device_node that is backing a struct dma_chan.
> 
If I understand this correctly, this is something I demonstrated in
the initial message.  I do not think we always have individual
device_node for each channel (struct dma_chan).  The most common
situation is all channels are backed by one device_node (dmaengine).

As I stated in the initial message, (for i.mx sdma example) the
problem is 'struct dma_chan' stands for a physical dma channel, while
all platform_device has is a virtual channel number (known as sdma
event) assigned by hardware.  This virtual channel can only be
dynamically mapped to a physical one by sdma driver.  That said there
is no way for us to specify a physical channel in device tree.  We can
only specify the virtual one there.  (I think this is kinda common,
and sdma is just one example.)

i.mx sdma has 32 physically channels and 48 virtual ones (events).
If we go the way you are suggesting, we will have to have 48 nodes
under sdma node just for giving event number, and then have
dma-channels property of device specifying the phanldles to these
event nodes belonging to it.

So we get something like below, which looks silly to me.

sdma@83fb0000 {
        #address-cells = <1>;
        #size-cells = <0>;
        compatible = "fsl,imx51-sdma", "fsl,imx35-sdma";
        reg = <0x83fb0000 0x4000>;
        interrupts = <6>;
        fsl,sdma-ram-script-name = "sdma-imx51.bin";

        dma00: dma-channel@0 {
                compatible = "fsl,sdma-channel";
                reg = <0>;
        };

        dma01: dma-channel@1 {
                compatible = "fsl,sdma-channel";
                reg = <1>;
        };

        ......

        dma47: dma-channel@47 {
                compatible = "fsl,sdma-channel";
                reg = <47>;
        };
};

ssi@83fcc000 { /* SSI1 */
        compatible = "fsl,imx51-ssi", "fsl,imx1-ssi";
        reg = <0x83fcc000 0x4000>;
        interrupts = <29>;
        fsl,ssi-uses-dma;
        dma-channels = <&dma00, &dma01>;
};

Did I state the problem clear?  Or am I missing anything?

-- 
Regards,
Shawn
