From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Generic communication of boot loader state to the OS
Date: Tue, 26 Aug 2014 19:43:43 +0100
Message-ID: <20140826184343.GM4078@leverpostej>
References: <CAKON4Oz-PRgXyNKj=T9ymzOOhCMPjBMdYdE1Mr1CHWv3boskiw@mail.gmail.com>
 <20140826171658.GJ4078@leverpostej>
 <CAKON4OyENsHnPc528zLnimVY-B2x6-gdBQ6iyYHO60PgHdnvWg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRMFBMIXEGBB2NK6OPQKGQEAHVGI7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAKON4OyENsHnPc528zLnimVY-B2x6-gdBQ6iyYHO60PgHdnvWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
Content-Disposition: inline
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 26, 2014 at 07:31:09PM +0100, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On Tue, Aug 26, 2014 at 1:16 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > Hi Jon,
> >
> > On Tue, Aug 26, 2014 at 05:10:00PM +0100, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> New thread split off from the simple-framebuffer discussion....
> >>
> >> Is there a generic, underlying problem here that needs to be solved?
> >> AFAIK no one has designed a general purpose mechanism for
> >> communicating boot loader state to the OS. There is the existing
> >> device tree <chosen> node but it is limited compared to what is
> >> needed. Maybe we should step back and first design a good solution to
> >> this basic problem. Then specific solutions for things like
> >> framebuffers would fall out of the basic design.
> >
> > I think the fundamental problem here is unfortunately far too abstract
> > for the general solution to be any more concrete. The solution to "we
> > don't communicate boot state" is "we should communicate boot state".
> >
> > We can perhaps come up with general guidelines (for instance, the clock
> > subsystem has assigned-* properties), but I don't think there's a
> > one-size-fits-all solution.
> 
> I think it worth taking some time to consider if a one-size-fits-all
> solution exists for the general issues of communicating between the
> boot loader and the OS. Things are a lot better now, but I can
> remember have 20K byte long kernel command lines in the past.  Some
> random thoughts...

As I mentioned, I think we can set general guidelines. Some information
is just going to be device-specific, so enforcing a particular format
for everything is going to get in the way. There's no reason there can't
be common conventions, however.

> Do we even need a kernel command line any more?

I quite like being able to override options for test purposes, but we
don't necessarily have to require a non-empty command line.

> Could EARLY_PRINTK be made automatic with cooperation from the bootloader?

I believe Rob Herring's earlycon patches can set up an earlycon based on
stdout-path.

> Can we make it all the way from the boot loader to the GUI without
> having the display flash from mode setting?

If we communicate the display mode and the configuration of the clocks,
regulators, and memory allocations, probably. We already have the basic
bindings for all of these, so I think the bulk of the work would be
convincing the subsystems to do interact in the right way.

> Can I not auto-negotiate network links speed twice (a slow process)?

Perhaps. It depends on what information your particular network
controller setup needs to pass along (perhaps nothing whatsoever).

> Can 23 years of different solutions be collapsed into a general framework?

I think the only common thing here is that something in a subsystem
needs to parse the DT early and act on it. We already have initcalls.

Thanks,
Mark.
