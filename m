From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Tue, 19 Jul 2011 17:16:56 +0200
Message-ID: <201107191716.56203.arnd@arndb.de>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<20110717154730.GK2374@S2100-06.ap.freescale.net>
	<4E230802.9030805@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E230802.9030805-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 17 July 2011, Tabi Timur-B04825 wrote:
> Shawn Guo wrote:
> > Ok, I will take this as a serious warning, and start evaluating the
> > driver consolidation.  I will absolutely need you help along the way.
> > At least, when we get there, I need your favor to test mpc platform,
> > as I do not have the access at all.
> 
> Absolutely.  I've been waiting a long time for someone to come along and 
> help me unify the drivers.  As you know, there's very little collaboration 
> between the ARM and PowerPC groups inside Freescale.

I've looked a bit at the two drivers, and it seems to me that both
would benefit from taking aspects from the other one.

Shawn, when you start the consolidation, I think it would be good
to first eliminate all the minor differences like variable names
and header file contents, always using the cleaner or more generic
version for each aspect. I've had some good success using 'vimdiff'
for similar work, which gives you a side-by-side representation of
the two files. There are evidently some more fundamental differences
like the DMA usage, but I think it's easier to leave them for
a later stage.

In some cases, you will have to abstract the differences between
the hardware like the mmio accessors that are not common between
powerpc and arm yet.

I also think that it would be useful to add the same device tree based
probing to the imx driver that is in the fsl one.

	Arnd
