From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Fri, 15 Jul 2011 20:11:41 +0200
Message-ID: <201107152011.41546.arnd@arndb.de>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<CAOZdJXVeM4Axf=TC4qKNHyqb=iDoDceGr-xjLNpD20WfL2h46Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOZdJXVeM4Axf=TC4qKNHyqb=iDoDceGr-xjLNpD20WfL2h46Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 15 July 2011 18:45:38 Tabi Timur-B04825 wrote:
> 
> On Fri, Jul 15, 2011 at 11:32 AM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > First of all, using powerpc dma-channel binding on such dma event
> > seems not reflecting the hardware facts.  Secondly, the binding in
> > this case (below) looks silly.  Thirdly, device driver need to make
> > code change for simply getting a dma event number.
> 
> Take a look at p1022ds.dts or mpc8610hpcd.dts.  We create separate DMA
> channel nodes on Freescale PowerPC parts because the channels really
> are independent.  On these two boards, some of the DMA channels are
> used by the async DMA driver, and two of the channels are used by the
> audio driver.

I think this is much better than using IORESOURCE_DMA fields, which
basically are only well-defined for PC-style i8237 DMA controllers
used in stuff like floppy drives and ISA sound cards.

However, we should find a way to standardize finding the dma_chan
for an platform_device based on a phandle. Maybe a little helper
that will scan a well-known property (dma-channels?) for phandles
to a device_node that is backing a struct dma_chan.

	Arnd
