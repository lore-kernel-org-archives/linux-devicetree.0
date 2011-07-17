From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sun, 17 Jul 2011 17:04:17 +0200
Message-ID: <201107171704.17779.arnd@arndb.de>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<4E22E66D.5010809@freescale.com>
	<20110717142838.GI2374@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110717142838.GI2374-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 17 July 2011 16:28:39 Shawn Guo wrote:
> I was not part of creating imx-ssi.  But I guess that Sascha (Cc-ed)
> might have strong reasons for creating it rather than reusing fsl-ssi.
> I really doubt that missing device-tree on ARM platform is the only
> reason resulting two ssi drivers.
> 
> I'm also not a fan of consolidating device driver between fsl mpc and
> imx family, especially I had a try on eSDHC and saw something ugly
> and negative feedback from people.
> 
> http://article.gmane.org/gmane.linux.kernel.mmc/7832
> http://article.gmane.org/gmane.linux.kernel.mmc/8202
> 
> So unless someone initiates the consolidation of fsl-ssi and imx-ssi,
> I will keep going option b).  If the consolidation is reasonable and
> possible, it can happen anytime no matter whether device-tree is
> added for imx-ssi or not.

I think this sort of driver consolidation is generally a good thing, but
it requires that the consolidated driver is clearly better than either
of the two original drivers. People are generally very attached to the
code they maintain and don't like to see their work getting replaced
by the same thing done differently. However, there are lots of
disadvantages to having multiple drivers for the same hardware and
we clearly want to have only one if we only need one.

How we get there depends a lot on the situation, and with the esdhc
driver, there wasn't that much duplication: Your patch actually
added more code than it removed and it added a number of #ifdef
sections were not present in the original drivers.

	Arnd
