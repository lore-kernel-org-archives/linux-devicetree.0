From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sat, 16 Jul 2011 20:54:21 +0000
Message-ID: <4E21FA7C.2000602@freescale.com>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<20110716144026.GB2374@S2100-06.ap.freescale.net>
	<4E21F22C.3020804@freescale.com> <201107162244.47740.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201107162244.47740.arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Content-ID: <D37E1C4844AC1E44BAD3606845B03F7F-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
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
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Arnd Bergmann wrote:
> But that would mean that the code interpreting that property has to
> know about the specific dmaengine implementation, and needs to be
> changed every time we add a new one.

And like I said, the SSI driver will already need to know the specifics of 
the DMA controller.  The PowerPC device tree node for the SSI already 
works this way:

             ssi@15000 {
                     compatible = "fsl,mpc8610-ssi";
                     cell-index = <0>;
                     reg = <0x15000 0x100>;
                     interrupts = <75 2 0 0>;
                     fsl,mode = "i2s-slave";
                     codec-handle = <&wm8776>;
                     fsl,playback-dma = <&dma00>;
                     fsl,capture-dma = <&dma01>;
                     fsl,fifo-depth = <15>;
                     fsl,ssi-asynchronous;
              };

On PowerPC, the SSI driver knows that "fsl,playback-dma" points to a 
Freescale e500 DMA controller channel node.  The driver currently does not 
work with any other DMA controller.  This is what needs to be fixed.

> Alternatively, you'd end up with the device drivers having to
> read the properties themselves to get to the number and pass
> that to the common dmaengine code.

The SSI won't be able to use any common DMA engine code, because DMA needs 
to be set up in a very specific way for audio.

-- 
Timur Tabi
Linux kernel developer at Freescale
