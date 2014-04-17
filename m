From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] arm: exynos: Add MCPM call-back functions
Date: Thu, 17 Apr 2014 11:20:26 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1404171114370.980@knanqh.ubzr>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com> <1397239311-27717-6-git-send-email-a.kesavan@samsung.com> <alpine.LFD.2.11.1404111426510.980@knanqh.ubzr> <20140414104116.GA3844@e103592.cambridge.arm.com>
 <CAM4voa=-29EsNRCebri1C9D5cWopTT4Ux_0UPGAvdjP60ADZZQ@mail.gmail.com> <20140417095925.GA18864@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140417095925.GA18864-M5GwZQ6tE7x5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Cc: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mark.rutland" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas P Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 17 Apr 2014, Dave Martin wrote:

> On Thu, Apr 17, 2014 at 12:41:22AM +0530, Abhilash Kesavan wrote:
> 
> [...]
> 
> > > The fact that there is no C interface for enabling ACE ports is
> > > deliberate.  For CPUs connected to ACE and managed via MCPM,
> > > it is incorrect to enable CCI via C code, since the safe window
> > > is the window during which all outbound CPUs have reached CLUSTER_DOWN
> > > and all inbound CPUs have not turned their MMU on yet (and thus cannot
> > > execute any general Linux C code).
> > >
> > > There might be scenarios involving GPUs and other non-CPU devices
> > > connected to ACE ports where the device cannot enable CCI snoops
> > > for itself -- but this would require a holding-pen protocol to enable
> > > the device to wait and signal a CPU to enable CCI snoops on the device's
> > > behalf before the device proceeds.  It is not the correct solution for
> > > CPU clusters attached to ACE, precisely because we can be more efficient
> > > in that case.
> > >
> > > In fact, because you implement a power_up_setup method that calls
> > > cci_enable_port_for_self, CCI snoops are actually enabled twice, making
> > > the above code appear redundant.   Have I missed something?
> > When a cluster is being turned off the snoops for both the clusters
> > are being turned off. When the other cluster comes back the snoops are
> > being turned on for the incoming cluster via power_up_setup and here
> > for the other cluster. As previously mentioned, I will be dropping
> > this change.
> 
> That's a fair point.  If there is only one cluster alive, turning off
> snoops for it should be safe, because there is no second cluster for
> it to maintain coherency with.

But that's not that simple as I explained in a previous email.  If the 
other cluster has gone down via cpuidle, it may come back up at any 
moment without warning.  We do have the infrastructure in place to cope 
with possible races handling the CCI within a cluster.  We do not have 
anything for cross cluster races.  And before we do, it is necessary to 
know if it is worth it.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
