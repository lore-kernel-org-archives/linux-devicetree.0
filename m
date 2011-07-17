From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sun, 17 Jul 2011 14:57:44 +0000
Message-ID: <4E22F867.5090707@freescale.com>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107152011.41546.arnd@arndb.de>
	<20110716075748.GI1840@S2100-06.ap.freescale.net>
	<201107161409.46719.arnd@arndb.de>
	<20110716143456.GA2374@S2100-06.ap.freescale.net>
	<4E21A392.3010608@freescale.com>
	<20110717074159.GF2374@S2100-06.ap.freescale.net>
	<4E22E66D.5010809@freescale.com>
	<20110717142838.GI2374@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110717142838.GI2374-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Content-ID: <803797377A01A14BAD683955ADC8A295-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Shawn Guo wrote:
> I was not part of creating imx-ssi.  But I guess that Sascha (Cc-ed)
> might have strong reasons for creating it rather than reusing fsl-ssi.

Not really:

http://mailman.alsa-project.org/pipermail/alsa-devel/2009-November/023425.html

Sascha created imx-ssi because he didn't even notice my driver was already 
there!

> I really doubt that missing device-tree on ARM platform is the only
> reason resulting two ssi drivers.

Yes, it is!  If we had had device tree support on ARM back then, imx-ssi 
would never have existed.

> I'm also not a fan of consolidating device driver between fsl mpc and
> imx family, especially I had a try on eSDHC and saw something ugly
> and negative feedback from people.
>
> http://article.gmane.org/gmane.linux.kernel.mmc/7832
> http://article.gmane.org/gmane.linux.kernel.mmc/8202

That feedback would not have stopped me from merging the two.  It looks 
like some minor concerns that could have been addressed.

> So unless someone initiates the consolidation of fsl-ssi and imx-ssi,
> I will keep going option b).  If the consolidation is reasonable and
> possible, it can happen anytime no matter whether device-tree is
> added for imx-ssi or not.

If you try to update the imx-ssi driver to support device trees, you'll 
have to convince the ASoC team to override my NAKs.

-- 
Timur Tabi
Linux kernel developer at Freescale
