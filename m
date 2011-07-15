From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Is there a binding for IORESOURCE_DMA population?
Date: Sat, 16 Jul 2011 00:32:55 +0800
Message-ID: <20110715163254.GG1840@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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
List-Id: devicetree@vger.kernel.org

It's pretty common on ARM platforms that IORESOURCE_DMA is being used
by platform devices to tell DMA channel/request/event number (either
physical or virtual).  And then drivers simply call function
platform_get_resource() to get that.  Do we have any support for
IORESOURCE_DMA to make it migrate to device tree probe as easy as we
do for IORESOURCE_IRQ?  Or do we have to follow "dma-channel" binding
that is being used on powerpc?

I ask because I do not see too much sense to use dma-channel binding
on ARM platforms.  For specific example like imx-sdma, it has 32
physical channels which are not bonded to any specific devices.
Instead, hardware defines 48 dma events (something like virtual
channels).  Every single event is assigned to specific device by
hardware.  Whenever one device wants to do dma, it just tells its dma
request number.  sdma will find an available physical channel to
do dma.

First of all, using powerpc dma-channel binding on such dma event
seems not reflecting the hardware facts.  Secondly, the binding in
this case (below) looks silly.  Thirdly, device driver need to make
code change for simply getting a dma event number.

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

        dma02: dma-channel@2 {
                compatible = "fsl,sdma-channel";
                reg = <2>;
        };

        dma04: dma-channel@3 {
                compatible = "fsl,sdma-channel";
                reg = <3>;
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
        fsl,ssi-tx-dma-channel = &dma02;
        fsl,ssi-rx-dma-channel = &dma03;
};

Should we get dt infrastructural auto-load IORESOURCE_DMA to make
the thing a lot easier?  Or did I miss anything?

-- 
Regards,
Shawn
