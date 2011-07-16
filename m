From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sat, 16 Jul 2011 17:19:32 +0200
Message-ID: <201107161719.32543.arnd@arndb.de>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107161409.46719.arnd@arndb.de>
	<20110716143456.GA2374@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110716143456.GA2374-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 16 July 2011, Shawn Guo wrote:
> Though I do not understand what you said about channel numbers within
> within the parent dma controller, I do think the dma has something
> in common with 'interrupt-controller', and we can has a property like
> 'dma-channels' under the node of devices that are dma clients to contain
> the their channel/event numbers, just like property 'interrupts'
> containing devices' IRQ number.

I think that would be ok, and it's basically what I tried to express.

> Then like that IRQ number is decoded and populated into IORESOURCE_IRQ
> by device tree infrastructural code, we can also do the same into
> IORESOURCE_DMA.  In that case, drivers do not need any code change for
> getting dma channel/event numbers from device tree, as
> platform_get_resource(pdev, IORESOURCE_DMA) still works for them.

But I really don't think there is value in using IORESOURCE_DMA for this.
We don't have the code to manage DMA resources for more than one DMA
controller AFAICT, and I think we should not add it. Globally
unique interrupt numbers cause us a lot of trouble and we go to great
lengths to fake them on modern devices. It would be much better
not to have them visible in the OS, and I don't want to add them to
a modern API like the dmaengine.

> Right now, I have the following as the solution.  I do not prefer to
> it as much as I prefer to IORESOURCE_DMA solution, but I think it's
> better than that huge and meaningless dma-channel node list.
> 
> ssi@83fcc000 { /* SSI1 */
>         compatible = "fsl,imx51-ssi", "fsl,imx1-ssi";
>         reg = <0x83fcc000 0x4000>;
>         interrupts = <29>;
>         fsl,dma-events = <29 28 27 26>; /* TX0 RX0 TX1 RX1 */
>         fsl,ssi-uses-dma;
> };
> 
> of_property_read_u32_array(pdev->dev.of_node, "fsl,dma-events",
>                            dma_events, ARRAY_SIZE(dma_events));
> 

Why fsl,dma-events? A driver consuming a DMA channel should not
need to care if it's an freescale DMA controller or something else.

I also don't like the drivers having to decode that property themselves.
If you want bindings for dma channels, they should be implementation
indepedent and work as easily as possible with the dmaengine API.

I would turn the above into 

ssi@83fcc000 { /* SSI1 */
         compatible = "fsl,imx51-ssi", "fsl,imx1-ssi";
         reg = <0x83fcc000 0x4000>;
         interrupts = <29>;
	 dma-parent = &fsldma1;
         dma-channels = <29 28 27 26>; /* TX0 RX0 TX1 RX1 */
};

struct dma_chan *tx0_chan = of_dma_find_chan(ssidev->dev, 0);
struct dma_chan *rx0_chan = of_dma_find_chan(ssidev->dev, 1);
struct dma_chan *tx1_chan = of_dma_find_chan(ssidev->dev, 2);
struct dma_chan *rx1_chan = of_dma_find_chan(ssidev->dev, 3);

	Arnd
