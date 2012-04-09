From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Mon, 9 Apr 2012 14:14:28 +0000
Message-ID: <201204091414.28918.arnd@arndb.de>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <20120406234955.840F73E1323@localhost>
 <alpine.DEB.2.00.1204091418400.23719@marmot.wormnet.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.DEB.2.00.1204091418400.23719-5X291BYdrx55rAo4AelP/Ydd74u8MsAO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 09 April 2012, Jamie Lentin wrote:
> On Fri, 6 Apr 2012, Grant Likely wrote:
> > These two lines are dangerous.  It is not safe to 'select' Kconfig
> > symbols that have 'depends' constraints.  Otherwise, the symbol will
> > get forced on without it's dependencies.
> >
> > Typically other code handles this by creating blank "HAVE_*" symbols
> > that the needed symbol can do something like "default y if HAVE_*"
> >
> 
> Okay I didn't realise this, thanks. The options in question aren't
> hard dependencies per-se, but no serial or NAND support is probably a
> mistake, so added them here to avoid a certain amount of shooting in foot.
> 
> What's the etiquette in this situation? Adding HAVE_* seems excessive,
> would selecting them in kirkwood_defconfig make more sense? Or would it
> simply be covered by having a reasonable config on my website or suchlike?

Either way works. We don't prevent people from shooting themselves in the
foot in Kconfig, there are plenty of ways to do that already (e.g. disabling
network support on a headless system). There should be a defconfig
for each platform, so just make sure 'make kirkwood_defconfig' enables
everything you need and works on your system, it should be the
superset of all kirkwood based systems and users can disable the
stuff they don't need.

	Arnd
