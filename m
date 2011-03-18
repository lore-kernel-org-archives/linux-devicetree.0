From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V5 1/4] arm/dt: add basic mx51 device tree support
Date: Fri, 18 Mar 2011 10:19:19 +0800
Message-ID: <20110318021918.GC26951@S2100-06.ap.freescale.net>
References: <1300290701-9433-1-git-send-email-jason.hui@linaro.org>
	<1300290701-9433-2-git-send-email-jason.hui@linaro.org>
	<20110317163732.GB9597@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110317163732.GB9597-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2011 at 10:37:32AM -0600, Grant Likely wrote:
> On Wed, Mar 16, 2011 at 11:51:38PM +0800, Jason Liu wrote:
> > Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/mach-mx5/Kconfig               |    8 ++++
> >  arch/arm/mach-mx5/Makefile              |    1 +
> >  arch/arm/mach-mx5/board-dt.c            |   64 +++++++++++++++++++++++++++++++
> >  arch/arm/mach-mx5/clock-dt.c            |   52 +++++++++++++++++++++++++
> >  arch/arm/plat-mxc/include/mach/common.h |    1 +
> >  5 files changed, 126 insertions(+), 0 deletions(-)
> 
> I've picked up this series into my devicetree/test branch.  I still

Have you done that yet?  I just checked and did not see it.  I'm
waiting for it to start the next spin of my patch sets.

> have comments, but it has come a long way and I'm happy enough with it
> to start carrying it.  Future patches can either build on top of this
> series, or completely replace it (your choice).
> 

-- 
Regards,
Shawn
