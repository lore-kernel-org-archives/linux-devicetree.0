From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V5 1/4] arm/dt: add basic mx51 device tree support
Date: Thu, 17 Mar 2011 23:05:04 -0600
Message-ID: <20110318050504.GC18545@angua.secretlab.ca>
References: <1300290701-9433-1-git-send-email-jason.hui@linaro.org>
	<1300290701-9433-2-git-send-email-jason.hui@linaro.org>
	<20110317163732.GB9597@angua.secretlab.ca>
	<20110318021918.GC26951@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110318021918.GC26951-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 18, 2011 at 10:19:19AM +0800, Shawn Guo wrote:
> On Thu, Mar 17, 2011 at 10:37:32AM -0600, Grant Likely wrote:
> > On Wed, Mar 16, 2011 at 11:51:38PM +0800, Jason Liu wrote:
> > > Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  arch/arm/mach-mx5/Kconfig               |    8 ++++
> > >  arch/arm/mach-mx5/Makefile              |    1 +
> > >  arch/arm/mach-mx5/board-dt.c            |   64 +++++++++++++++++++++++++++++++
> > >  arch/arm/mach-mx5/clock-dt.c            |   52 +++++++++++++++++++++++++
> > >  arch/arm/plat-mxc/include/mach/common.h |    1 +
> > >  5 files changed, 126 insertions(+), 0 deletions(-)
> > 
> > I've picked up this series into my devicetree/test branch.  I still
> 
> Have you done that yet?  I just checked and did not see it.  I'm
> waiting for it to start the next spin of my patch sets.

I just hadn't pushed it out.  I've done so now.  Sorry for the delay.

g.
