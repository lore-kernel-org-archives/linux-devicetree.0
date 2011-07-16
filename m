From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sat, 16 Jul 2011 22:44:47 +0200
Message-ID: <201107162244.47740.arnd@arndb.de>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<20110716144026.GB2374@S2100-06.ap.freescale.net>
	<4E21F22C.3020804@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E21F22C.3020804-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 16 July 2011 22:18:53 Tabi Timur-B04825 wrote:
> ssi@83fcc000 { /* SSI1 */
>           compatible = "fsl,imx51-ssi", "fsl,imx1-ssi";
>           reg = <0x83fcc000 0x4000>;
>           interrupts = <29>;
>          dma-parent = &fsldma1;
>           dma-channels = <29 28 27 26>; /* TX0 RX0 TX1 RX1 */
> };
> 
> However, I would use less generic property names, like 
> "fsl,ssi-dma-parent" or something like that.

But that would mean that the code interpreting that property has to
know about the specific dmaengine implementation, and needs to be
changed every time we add a new one.

Alternatively, you'd end up with the device drivers having to
read the properties themselves to get to the number and pass
that to the common dmaengine code.

Neither way looks like a sufficiently generic solution to me.

	Arnd
