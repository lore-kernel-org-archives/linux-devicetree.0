From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: kernel: fix nr_cpu_ids check in DT logical map init
Date: Thu, 22 Nov 2012 15:33:36 +0000
Message-ID: <20121122153337.083D73E129E@localhost>
References: <1353516176-12929-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20121122120843.GA16972@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121122120843.GA16972-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Nov 2012 12:08:43 +0000, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Russell,
> 
> On Wed, Nov 21, 2012 at 04:42:56PM +0000, Lorenzo Pieralisi wrote:
> > If a kernel is configured with a DT containing more /cpu nodes than
> > nr_cpu_ids, the number of cpus must be capped in the DT parsing
> > code. Current code carries out the check, but fails to cap the
> > value and the check is executed after the cpu logical index is used,
> > which can lead to memory corruption due to index overflow.
> > 
> > This patch refactors the check against nr_cpu_ids and move it before
> > any computed index is used in the parsing code.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > Reported-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > ---
> > Russell,
> > 
> > while refactoring the DT loop over nodes, I unfortunately missed this niggle
> > in the parsing loop that Mark reported. Here is the fix, sorry for the
> > additional commit, if it is ok for you I will add it to your patch system.
> > 
> > Apologies and thanks,
> > Lorenzo
> > 
> >  arch/arm/kernel/devtree.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> > index aaf9add..70f1bde 100644
> > --- a/arch/arm/kernel/devtree.c
> > +++ b/arch/arm/kernel/devtree.c
> > @@ -139,10 +139,14 @@ void __init arm_dt_init_cpu_maps(void)
> >  			i = cpuidx++;
> >  		}
> >  
> > -		tmp_map[i] = hwid;
> > -
> > -		if (cpuidx > nr_cpu_ids)
> > +		if (WARN(cpuidx > nr_cpu_ids, "DT /cpu %u nodes greater than "
> > +					       "max cores %u, capping them\n",
> > +					       cpuidx, nr_cpu_ids)) {
> > +			cpuidx = nr_cpu_ids;
> >  			break;
> > +		}
> > +
> > +		tmp_map[i] = hwid;
> >  	}
> >  
> >  	if (WARN(!bootcpu_valid, "DT missing boot CPU MPIDR[23:0], "
> 
> If it looks fine to you, can I queue this simple fix in your patch
> system please ?
> 
> Thanks and apologies for the extra commit,
> Lorenzo

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
