From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Add basic device tree support for mx53 loco board
Date: Thu, 31 Mar 2011 10:50:48 -0600
Message-ID: <20110331165048.GJ26709@ponder.secretlab.ca>
References: <1301387820-18299-1-git-send-email-jason.hui@linaro.org>
	<2CF7613B9822A943BEF13EF7ACEC5BD1173561@039-SN1MPN1-001.039d.mgd.msft.net>
	<20110331035215.GC21226@ponder.secretlab.ca>
	<20110331163615.GA25866@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110331163615.GA25866-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
Cc: "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liu Hui-R64343 <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2011 at 12:36:16AM +0800, Shawn Guo wrote:
> Hi Grant,
> 
> On Wed, Mar 30, 2011 at 09:52:15PM -0600, Grant Likely wrote:
> > On Tue, Mar 29, 2011 at 10:34:12AM +0000, Liu Hui-R64343 wrote:
> > > Hi, Grant,
> > > The two patches for mx51/mx53 DT support have the same issue, which 
> > > is the S-O-B will be missed when you git am. Let me know if you want me
> > > re-send the two patches or you would take care when you am it? Thanks,
> > 
> > I fixed it up.  Don't worry about it.
> > 
> I'm little confused by the Kconfig changes in this patch.  I saw your
> comments on SMDKV310 patch as below.  But this patch was accepted with
> MX5_DT_COMMON selected, which in turn selects USE_OF and
> PROC_DEVICETREE.

I picked up a bunch of these patches even though there were little
things that should probably be fixed up.  I'll get it all resolved
before I ask Nicolas to pull.

> 
> --- quota begins ---
> > diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> > index a021b52..78f5924 100644
> > --- a/arch/arm/mach-exynos4/Kconfig
> > +++ b/arch/arm/mach-exynos4/Kconfig
> > @@ -123,6 +123,7 @@ config MACH_SMDKV310
> >  	select EXYNOS4_SETUP_I2C1
> >  	select EXYNOS4_SETUP_KEYPAD
> >  	select EXYNOS4_SETUP_SDHCI
> > +	select USE_OF
> 
> I would drop this bit (I dropped it from my branch when I applied the
> patch).  Device tree support remains an optional feature.  Instead it
> can be enabled by default in the defconfig (or however the config is
> managed for the kernel package)
> --- quota ends ---
> 
> BTW, are you silently renaming the original devicetree/test branch
> to devicetree/test-2.6.38 and using new devicetree/test for Nicolas
> to pull Linaro bits?  If that is the case, what branch
> devicetree/arm-linaro-2.6.38-rebuilt will be for?

devicetree/test is /always/ an unstable branch that I try to keep as
close to Linus' tree as possible.  I usually rebase for every -rc
release.  devicetree/arm is based on devicetree/test, but it is
published in a way that means it can always be merged.

Also, which devicetree/test is pretty much "anything goes", I'm a lot
more careful about which patches I actually publish to devicetree/arm.

devicetree/arm-linaro-2.6.38 is the tree that I used previously for
asking Nicolas to pull.  I created
devicetree/arm-linaro-2.6.38-rebuilt solely for the purpose of
Nicolas' new rebuilt branch, but now I hear that he isn't going to use
that tree, so I'll push the latest changes into the
devicetree/arm-linaro-2.6.38 branch too.

You should be using devicetree/arm for anything targeted at upstream,
and devicetree/arm-linaro-2.6.38 for anything targeted at the 11.05
release.

g.
