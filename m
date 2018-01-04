From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/8] ARM: sun9i: SMP support with Multi-Cluster Power
 Management
Date: Thu, 4 Jan 2018 18:04:09 +0000
Message-ID: <20180104180409.GD12239@red-moon>
References: <20180104143754.2425-1-wens@csie.org>
 <20180104145838.qk5sbtg3vjg33txt@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180104145838.qk5sbtg3vjg33txt-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 03:58:38PM +0100, Maxime Ripard wrote:
> On Thu, Jan 04, 2018 at 10:37:46PM +0800, Chen-Yu Tsai wrote:
> > This is v2 of my sun9i SMP support with MCPM series which was started
> > over two years ago [1]. We've tried to implement PSCI for both the A80
> > and A83T. Results were not promising. The issue is that these two chips
> > have a broken security extensions implementation. If a specific bit is
> > not burned in its e-fuse, most if not all security protections don't
> > work [2]. Even worse, non-secure access to the GIC become secure. This
> > requires a crazy workaround in the GIC driver which probably doesn't work
> > in all cases [3].
> > 
> > Nicolas mentioned that the MCPM framework is likely overkill in our
> > case [4]. However the framework does provide cluster/core state tracking
> > and proper sequencing of cache related operations. We could rework
> > the code to use standard smp_ops, but I would like to actually get
> > a working version in first.
> > 
> > Much of the sunxi-specific MCPM code is derived from Allwinner code and
> > documentation, with some references to the other MCPM implementations,
> > as well as the Cortex's Technical Reference Manuals for the power
> > sequencing info.
> > 
> > One major difference compared to other platforms is we currently do not
> > have a standalone PMU or other embedded firmware to do the actually power
> > sequencing. All power/reset control is done by the kernel. Nicolas
> > mentioned that a new optional callback should be added in cases where the
> > kernel has to do the actual power down [5]. For now however I'm using a
> > dedicated single thread workqueue. CPU and cluster power off work is
> > queued from the .{cpu,cluster}_powerdown_prepare callbacks. This solution
> > is somewhat heavy, as I have a total of 10 static work structs. It might
> > also be a bit racy, as nothing prevents the system from bringing a core
> > back before the asynchronous work shuts it down. This would likely
> > happen under a heavily loaded system with a scheduler that brings cores
> > in and out of the system frequently. In simple use-cases it performs OK.
> 
> It all looks sane to me
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

It does not to me, sorry. You do not need MCPM (and workqueues) to
do SMP bring-up.

Nico explained why, just do it:

commit 905cdf9dda5d ("ARM: hisi/hip04: remove the MCPM overhead")

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
