From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sat, 16 Jul 2011 14:09:46 +0200
Message-ID: <201107161409.46719.arnd@arndb.de>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107152011.41546.arnd@arndb.de>
	<20110716075748.GI1840@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110716075748.GI1840-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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

On Saturday 16 July 2011 09:57:49 Shawn Guo wrote:
> If I understand this correctly, this is something I demonstrated in
> the initial message.  I do not think we always have individual
> device_node for each channel (struct dma_chan).  The most common
> situation is all channels are backed by one device_node (dmaengine).
> 
> As I stated in the initial message, (for i.mx sdma example) the
> problem is 'struct dma_chan' stands for a physical dma channel, while
> all platform_device has is a virtual channel number (known as sdma
> event) assigned by hardware.  This virtual channel can only be
> dynamically mapped to a physical one by sdma driver.  That said there
> is no way for us to specify a physical channel in device tree.  We can
> only specify the virtual one there.  (I think this is kinda common,
> and sdma is just one example.)

My assumption was that you would create a device_node for each channel
in the device tree source, but not necessarily have a platform_device
for each of them.

> i.mx sdma has 32 physically channels and 48 virtual ones (events).
> If we go the way you are suggesting, we will have to have 48 nodes
> under sdma node just for giving event number, and then have
> dma-channels property of device specifying the phanldles to these
> event nodes belonging to it.
> 
> So we get something like below, which looks silly to me.
> 
> sdma@83fb0000 {
>         #address-cells = <1>;
>         #size-cells = <0>;
>         compatible = "fsl,imx51-sdma", "fsl,imx35-sdma";
>         reg = <0x83fb0000 0x4000>;
>         interrupts = <6>;
>         fsl,sdma-ram-script-name = "sdma-imx51.bin";
> 
>         dma00: dma-channel@0 {
>                 compatible = "fsl,sdma-channel";
>                 reg = <0>;
>         };
> 
>         dma01: dma-channel@1 {
>                 compatible = "fsl,sdma-channel";
>                 reg = <1>;
>         };
> 
>         ......
> 
>         dma47: dma-channel@47 {
>                 compatible = "fsl,sdma-channel";
>                 reg = <47>;
>         };
> };
> 
> ssi@83fcc000 { /* SSI1 */
>         compatible = "fsl,imx51-ssi", "fsl,imx1-ssi";
>         reg = <0x83fcc000 0x4000>;
>         interrupts = <29>;
>         fsl,ssi-uses-dma;
>         dma-channels = <&dma00, &dma01>;
> };
> 
> Did I state the problem clear?  Or am I missing anything?

Right, this is what I had in mind. I think this is reasonable.
If you need so many channels, the device tree will be huge already,
so this doesn't add that much bloat either.

Another option would be to add a 'dma-parent' property akin to the
interrupt-parent property and then just refer to the channel
numbers within the parent dma controller.
I guess you would prefer something like that in order to keep the
device tree source more compact, right?

The only disadvantage I can see there is slighty more complex code
that is needed to find the appropriate channel, but certainly not
out of the ordinary.

	Arnd
