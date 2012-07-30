From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: Forcing PIO mode instead of DMA via DT property
Date: Mon, 30 Jul 2012 16:00:44 +0200
Message-ID: <201207301600.45000.marex@denx.de>
References: <201207222328.27008.marex@denx.de>
 <201207240617.31565.marex@denx.de>
 <ACB6D0C0104CFF42A45A5D82A0DD4F3D079B7AA7@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ACB6D0C0104CFF42A45A5D82A0DD4F3D079B7AA7-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "pavel-ynQEQJNshbs@public.gmane.org" <pavel-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Aggrwal Poonam-B10812,

[...]

> > > > We just had such a situation, where PIO had to be used on a specific
> > > > bus, because due to a hardware problem (board design error) DMA
> > > > would crash the system.  Yet the same driver/kernel would work fine
> > > > with DMA on other buses / boards.  OK, this was on x86, so DT would
> > > > not have helped, but I think a bus-specific property of being able
> > > > to do DMA (or not) might indeed make sense for the DT.
> > > 
> > > In that case probably we can use QUIRKS like broken-dma. I see this in
> > > the sdhc driver in Linux. On P2020 chip(rev 1.0) of FSL DMA was broken
> > > so we used this to force PIO.
> > 
> > Do you please happen to have any sample of such DT binding for reference?
> 
> Sorry cannot find the DT bindings in upstream, probably this issue was not
> there in P2020 Rev2.0 hence so. I can cite a node from FSL old SDK
> sdhci@2e000 {
> 			compatible = "fsl,p2020-esdhc", "fsl,esdhc";
> 			reg = <0x2e000 0x1000>;
> 			interrupts = <72 0x2>;
> 			interrupt-parent = <&mpic>;
> 			fsl,sdhci-adjust-timeout;
> 			/* Filled in by U-Boot */
> 			clock-frequency = <0>;
> 		};
> 
> 
> 
> You can look at drivers/mmc/host/sdhci-of-esdhc.c which handles various
> quirks.

Ok, so you suggest we add such a property or what is the conclusion please?

Best regards,
Marek Vasut
