From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: arm: cpus/cpu nodes
 bindings updates
Date: Sat, 14 Sep 2013 09:49:27 +0200
Message-ID: <20130914074927.GA23705@lunn.ch>
References: <1376559743-31848-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1376559743-31848-2-git-send-email-lorenzo.pieralisi@arm.com>
 <520CE665.8060907@gmail.com>
 <20130815152238.GF17839@e102568-lin.cambridge.arm.com>
 <20130913165708.GC5408@e102568-lin.cambridge.arm.com>
 <52337AEC.9080302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52337AEC.9080302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 13, 2013 at 03:51:56PM -0500, Rob Herring wrote:
> On 09/13/2013 11:57 AM, Lorenzo Pieralisi wrote:
> > Hi Rob, all,
> > 
> > On Thu, Aug 15, 2013 at 04:22:38PM +0100, Lorenzo Pieralisi wrote:
> >> [adding Andrew, Gregory and Thomas to check the Marvell compatible names]
> >>
> >> On Thu, Aug 15, 2013 at 03:32:05PM +0100, Rob Herring wrote:
> >>> On 08/15/2013 04:42 AM, Lorenzo Pieralisi wrote:
> >>>> In order to extend the current cpu nodes bindings to newer CPUs
> >>>> inclusive of AArch64 and to update support for older ARM CPUs this
> >>>> patch updates device tree documentation for the cpu nodes bindings.
> >>>>
> >>>> Main changes:
> >>>>     - adds 64-bit bindings
> >>>>     - define usage of #address-cells
> >>>>     - defines behaviour on pre and post v7 uniprocessor systems
> >>>>     - adds ARM 11MPcore specific reg property definition
> >>>>
> >>>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/cpus.txt | 424 ++++++++++++++++++++++---
> >>>>  1 file changed, 377 insertions(+), 47 deletions(-)
> >>>>
> >>>
> >>> The binding looks mostly fine to me.
> > 
> > These bindings have still not received an ACK, and need review by
> > Marvell guys in copy for the new compatible strings below.
> 
> If you can't get comment, then leave them out if they are not used
> already. If they are used, then tough shit when they want to change.

Hi Rob

We are working on it. Hope to be able to comment soon.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
