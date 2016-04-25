From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 5/7] arm64/perf: Access pmu register using
 <read/write>_sys_reg
Date: Mon, 25 Apr 2016 14:12:39 +0100
Message-ID: <20160425131238.GA30830@arm.com>
References: <1461243525-13603-1-git-send-email-ashoks@broadcom.com>
 <1461243525-13603-6-git-send-email-ashoks@broadcom.com>
 <20160425130637.GA29160@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160425130637.GA29160-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 02:06:37PM +0100, Will Deacon wrote:
> On Thu, Apr 21, 2016 at 05:58:43AM -0700, Ashok Kumar wrote:
> > changed pmu register access to make use of <read/write>_sys_reg
> > from sysreg.h instead of accessing them directly.
> > 
> > Signed-off-by: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  arch/arm64/kernel/perf_event.c | 33 ++++++++++++++++-----------------
> >  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> This doesn't apply on top of -rc1 + the first four patches in your series.
> What am I missing?

... the kvm changes, which we merged for -rc2. Sorry for the noise, I'll
base this on -rc3 (to match the for-next/core branch).

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
