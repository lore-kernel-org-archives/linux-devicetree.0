From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit controls from a pipeline
Date: Sun, 26 Mar 2017 19:44:21 +0300
Message-ID: <4361814.FnnCy4E7XB@avalon>
References: <20170303230645.GR21222@n2100.armlinux.org.uk> <20170314004533.3b3cd44b@vento.lan> <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.orgsakar
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Tuesday 14 Mar 2017 08:55:36 Hans Verkuil wrote:
> On 03/14/2017 04:45 AM, Mauro Carvalho Chehab wrote:
> > Hi Sakari,
> > 
> > I started preparing a long argument about it, but gave up in favor of a
> > simpler one.
> > 
> > Em Mon, 13 Mar 2017 14:46:22 +0200 Sakari Ailus escreveu:
> >> Drivers are written to support hardware, not particular use case.
> > 
> > No, it is just the reverse: drivers and hardware are developed to
> > support use cases.
> > 
> > Btw, you should remember that the hardware is the full board, not just the
> > SoC. In practice, the board do limit the use cases: several provide a
> > single physical CSI connector, allowing just one sensor.
> > 
> >>> This situation is there since 2009. If I remember well, you tried to
> >>> write such generic plugin in the past, but never finished it, apparently
> >>> because it is too complex. Others tried too over the years.
> >> 
> >> I'd argue I know better what happened with that attempt than you do. I
> >> had a prototype of a generic pipeline configuration library but due to
> >> various reasons I haven't been able to continue working on that since
> >> around 2012.
> > ...
> > 
> >>> The last trial was done by Jacek, trying to cover just the exynos4
> >>> driver. Yet, even such limited scope plugin was not good enough, as it
> >>> was never merged upstream. Currently, there's no such plugins upstream.
> >>> 
> >>> If we can't even merge a plugin that solves it for just *one* driver,
> >>> I have no hope that we'll be able to do it for the generic case.
> >> 
> >> I believe Jacek ceased to work on that plugin in his day job; other than
> >> that, there are some matters left to be addressed in his latest patchset.
> > 
> > The two above basically summaries the issue: the task of doing a generic
> > plugin on userspace, even for a single driver is complex enough to
> > not cover within a reasonable timeline.
> > 
> > From 2009 to 2012, you were working on it, but didn't finish it.
> > 
> > Apparently, nobody worked on it between 2013-2014 (but I may be wrong, as
> > I didn't check when the generic plugin interface was added to libv4l).
> > 
> > In the case of Jacek's work, the first patch I was able to find was
> > 
> > written in Oct, 2014:
> > 	https://patchwork.kernel.org/patch/5098111/
> > 	(not sure what happened with the version 1).
> > 
> > The last e-mail about this subject was issued in Dec, 2016.
> > 
> > In summary, you had this on your task for 3 years for an OMAP3
> > plugin (where you have a good expertise), and Jacek for 2 years,
> > for Exynos 4, where he should also have a good knowledge.
> > 
> > Yet, with all that efforts, no concrete results were achieved, as none
> > of the plugins got merged.
> > 
> > Even if they were merged, if we keep the same mean time to develop a
> > libv4l plugin, that would mean that a plugin for i.MX6 could take 2-3
> > years to be developed.
> > 
> > There's a clear message on it:
> > 	- we shouldn't keep pushing for a solution via libv4l.
> 
> Or:
> 	- userspace plugin development had a very a low priority and
> 	  never got the attention it needed.
>
> I know that's *my* reason. I rarely if ever looked at it. I always assumed
> Sakari and/or Laurent would look at it. If this reason is also valid for
> Sakari and Laurent, then it is no wonder nothing has happened in all that
> time.

The reason is also valid for me. I'd really love to work on the userspace 
side, but I just can't find time at the moment.

> We're all very driver-development-driven, and userspace gets very little
> attention in general. So before just throwing in the towel we should take
> a good look at the reasons why there has been little or no development: is
> it because of fundamental design defects, or because nobody paid attention
> to it?
> 
> I strongly suspect it is the latter.
> 
> In addition, I suspect end-users of these complex devices don't really care
> about a plugin: they want full control and won't typically use generic
> applications. If they would need support for that, we'd have seen much more
> interest. The main reason for having a plugin is to simplify testing and
> if this is going to be used on cheap hobbyist devkits.
> 
> An additional complication is simply that it is hard to find fully supported
> MC hardware. omap3 boards are hard to find these days, renesas boards are
> not easy to get, freescale isn't the most popular either. Allwinner,
> mediatek, amlogic, broadcom and qualcomm all have closed source
> implementations or no implementation at all.
> 
> I know it took me a very long time before I had a working omap3.
> 
> So I am not at all surprised that little progress has been made.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
