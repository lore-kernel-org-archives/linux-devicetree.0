From: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Forcing PIO mode instead of DMA via DT property
Date: Tue, 24 Jul 2012 14:49:52 +0000
Message-ID: <ACB6D0C0104CFF42A45A5D82A0DD4F3D079B7AA7@039-SN2MPN1-013.039d.mgd.msft.net>
References: <201207222328.27008.marex@denx.de>
 <20120723054758.C622C200263@gemini.denx.de>
 <ACB6D0C0104CFF42A45A5D82A0DD4F3D079B6B36@039-SN2MPN1-013.039d.mgd.msft.net>
 <201207240617.31565.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207240617.31565.marex-ynQEQJNshbs@public.gmane.org>
Content-Language: en-US
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
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: "pavel-ynQEQJNshbs@public.gmane.org" <pavel-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Marek Vasut [mailto:marex-ynQEQJNshbs@public.gmane.org]
> Sent: Tuesday, July 24, 2012 9:48 AM
> To: Aggrwal Poonam-B10812
> Cc: Wolfgang Denk; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; pavel-ynQEQJNshbs@public.gmane.org
> Subject: Re: Forcing PIO mode instead of DMA via DT property
> 
> Dear Aggrwal Poonam-B10812,
> 
> > > -----Original Message-----
> > > From: Wolfgang Denk [mailto:wd-ynQEQJNshbs@public.gmane.org]
> > > Sent: Monday, July 23, 2012 11:18 AM
> > > To: Aggrwal Poonam-B10812
> > > Cc: Marek Vasut; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; pavel-ynQEQJNshbs@public.gmane.org
> > > Subject: Re: Forcing PIO mode instead of DMA via DT property
> > >
> > > Dear Poonam,
> > >
> > > In message <ACB6D0C0104CFF42A45A5D82A0DD4F3D079B4DAE@039-SN2MPN1-
> > >
> > > 013.039d.mgd.msft.net> you wrote:
> > > > > I'm trying to implement a driver that can do both DMA and PIO,
> > > > > and it would be nice if the user was able to select the mode (on
> > > > > a per-bus
> > > > > basis) using the DT.
> > > > > The PIO mode can reduce the overhead in some cases and therefore
> > > > > be better choice than the DMA (for example when most transfers
> > > > > move only very few data, or when board-specific hardware
> > > > > properties kick
> > >
> > > in).
> > >
> > > > > I was thinking about using some "manf,use-pio" DT property, but
> > > > > I haven't found any such example yet, so I wonder if this is a
> > > > > good
> > >
> > > idea.
> > >
> > > > Not sure, but as far as I understand device tree is to publish the
> > > > hardware  capabilities, not the user choice/configuration.
> > > > One option would be to put a compile time flag in the driver,
> > > > which prefers  PIO than DMA.
> > > > I believe by default DMA is the first preference.
> > >
> > > We just had such a situation, where PIO had to be used on a specific
> > > bus, because due to a hardware problem (board design error) DMA
> > > would crash the system.  Yet the same driver/kernel would work fine
> > > with DMA on other buses / boards.  OK, this was on x86, so DT would
> > > not have helped, but I think a bus-specific property of being able
> > > to do DMA (or not) might indeed make sense for the DT.
> >
> > In that case probably we can use QUIRKS like broken-dma. I see this in
> > the sdhc driver in Linux. On P2020 chip(rev 1.0) of FSL DMA was broken
> > so we used this to force PIO.
> 
> Do you please happen to have any sample of such DT binding for reference?
Sorry cannot find the DT bindings in upstream, probably this issue was not there in P2020 Rev2.0 hence so.
I can cite a node from FSL old SDK
sdhci@2e000 {
			compatible = "fsl,p2020-esdhc", "fsl,esdhc";
			reg = <0x2e000 0x1000>;
			interrupts = <72 0x2>;
			interrupt-parent = <&mpic>;
			fsl,sdhci-adjust-timeout;
			/* Filled in by U-Boot */
			clock-frequency = <0>;
		};



You can look at drivers/mmc/host/sdhci-of-esdhc.c which handles various quirks.

Regards
Poonam
> 
> Best regards,
> Marek Vasut
