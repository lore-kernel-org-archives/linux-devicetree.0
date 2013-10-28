From: Simon Baatz <gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: dts: remove unneeded linux,default-state
 from led nodes
Date: Mon, 28 Oct 2013 16:17:30 +0100
Message-ID: <20131028151729.GA6972@schnuecks.de>
References: <1381774047-23354-1-git-send-email-jason@lakedaemon.net>
 <20131014182821.GD25095@lunn.ch>
 <20131014183633.GK5402@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131014183633.GK5402-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason, Andrew

On Mon, Oct 14, 2013 at 02:36:33PM -0400, Jason Cooper wrote:
> On Mon, Oct 14, 2013 at 08:28:21PM +0200, Andrew Lunn wrote:
> > On Mon, Oct 14, 2013 at 06:07:27PM +0000, Jason Cooper wrote:
> > > Generally, power LEDs should indicate when power is applied, and go out
> > > once power is removed.  _Not_ annoy the developer with migraine-inducing
> > > blinking reminicent of some badly animated television series designed to
> > > sell sugar to children.
> > > 
> > > On a more serious note, most of these OS-specific properties aren't
> > > necessary and should be removed.  I left two that are legitimately tying
> > > disk LEDs to disk activity.  Other than that, we keep the state the
> > > bootloader left them in until userspace changes the state via sysfs.
> > 
> > Hi Jason
> > 
> > Do you know what happens with "keep" and the bootloader setting the
> > LED to hardware blink? I'm just wondering if some of these default-on,
> > are actually disabling hardware blinking and making it constant on?

This is the reason why I used the default-on in kirkwood-ib62x0.dts
at the time.  The original bootloader did enable hardware blinking. 
(Can't check whether "keep" would at least disable the blinking,
since I don't have the original bootloader on the box anymore)

For obvious reasons, the uboot support for the IB NAS 62x0 does not
copy this behavior from the original uboot. So, it is not
an issue anymore once you upgrade the bootloader.  
 
> hmmm, good question.  I'll let this patch sit for some time since it is
> trivial and doesn't conflict with anything in mvebu/dt.  We'll see if
> anyone says anything.

We can see it as a nice incentive to upgrade the boot loader...

> Regardless of the outcome, 'default-state = "on";' can be used instead
> for that scenario.

Sure.

- Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
