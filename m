From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] arm/dt: Add a make rule to build dtb for enabled boards
Date: Tue, 5 Apr 2011 08:50:28 -0600
Message-ID: <20110405145028.GD30849@ponder.secretlab.ca>
References: <1301929307-1838-1-git-send-email-shawn.guo@linaro.org>
	<20110405044827.GA28817@ponder.secretlab.ca>
	<20110405070904.GB28171@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110405070904.GB28171-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2011 at 03:09:05PM +0800, Shawn Guo wrote:
> On Mon, Apr 04, 2011 at 10:48:27PM -0600, Grant Likely wrote:
> > On Mon, Apr 04, 2011 at 11:01:47PM +0800, Shawn Guo wrote:
> > > With 'make ARCH=arm dtb', it builds Device Tree Blobs for those boards
> > > enabled by build CONFIG.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > > It's based on commit fe8e6d0b0e601ca0a63fe768d4b812d5a45a9da7
> > > "arm/dt: Add dtb make rule" from Rob Herring.  And it works against
> > > Linaro kernel tree.  But it needs to go through mainline review
> > > before it gets applied.
> > > 
> > > Changes since v1:
> > > * Take suggestion from Rob Herring to move .dts dection into machine
> > >   sepcific Makefile.boot, so that arch/arm/boot/Makefile can be as
> > >   clean as it is.
> > 
> > Looks good, some minor comments below, but I've picked it up and asked
> > Nicolas to merge it.
> > 
> > Cheers,
> > g.
> > 
> > > 
> > >  arch/arm/Makefile                     |    3 +++
> > >  arch/arm/boot/Makefile                |    2 ++
> > >  arch/arm/mach-exynos4/Makefile.boot   |    2 ++
> > >  arch/arm/mach-mx5/Makefile.boot       |    5 +++++
> > >  arch/arm/mach-omap2/Makefile.boot     |    4 ++++
> > >  arch/arm/mach-tegra/Makefile.boot     |    2 ++
> > >  arch/arm/mach-versatile/Makefile.boot |    2 ++
> > >  7 files changed, 20 insertions(+), 0 deletions(-)
> > > 
> > > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > > index d51ab6c..7fd2af9 100644
> > > --- a/arch/arm/Makefile
> > > +++ b/arch/arm/Makefile
> > > @@ -292,6 +292,9 @@ zinstall uinstall install: vmlinux
> > >  %.dtb:
> > >  	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $(boot)/$@
> > >  
> > > +dtb:
> > > +	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $(boot)/$@
> > > +
> > 
> > Since the target is the same, I've merged this rule with the %.dtb
> > rule.  I also renamed the target 'dtbs' because it will build more
> > than one .dtb file.
> > 
> I started with 'dtbs' as target name, and later changed it to 'dtb'
> to align with $(dtb-y).  And 'dtbs' looks truly fine for me, but you
> may want to change commit message accordingly, as there is
> 'make ARCH=arm dtb' in it.

Thanks, fixed in my devicetree/test tree and also added something to
the help text.

g.
