From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: irq-mvebu-icu: new driver for Marvell ICU
Date: Tue, 30 May 2017 13:56:43 +0100
Message-ID: <20170530125643.GQ22219@n2100.armlinux.org.uk>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496135772-20694-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170530121907.GO22219@n2100.armlinux.org.uk>
 <20170530143350.6f8563c1@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170530143350.6f8563c1-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 30, 2017 at 02:33:50PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 30 May 2017 13:19:07 +0100, Russell King - ARM Linux wrote:
> 
> > I see we're still duplicating work.
> > 
> > Yes, I know you'll reply with your "your tree is a private tree" blah
> > blah, which is fine if you want to keep re-doing work that others have
> > done, but it's incredibly inefficient.
> > 
> > What you call my private tree is the public ARM git tree - hardly
> > private.  It's the one which core ARM changes go through.  The mcbin
> > changes are in a separate branch of that tree - hardly private by
> > any definition of that term.  It's as private as your own
> > free-electrons git tree.
> 
> None of the changes in this series are core ARM changes, they touch
> Device Tree bindings, irqchip drivers and Device Tree files, none of
> which you are maintainer for. Your tree therefore has no higher
> authority than any other tree, so using the fact that the core ARM
> changes go through your tree as an argument to make people believe your
> tree is more important than the contributions from other developers is
> a very fallacious argument.
> 
> > Given that during the previous rounds I was willing to work with you,
> > testing your patches and helping the effort along, I find your attitude
> > towards me to be very counter-productive - you seem to have a very big
> > NIH problem.
> > 
> > How about working _together_ sharing the effort, rather than competing?
> > 
> > I have a 31 patch series in my tree cleaning up the Marvell ICU support
> > and adding PM support to the driver - obviously too large to post as-is
> > for mainline, but intended for the changes to be reviewable.  Obviously
> > that was now a total waste of my time.
> > 
> > I don't see why I should get involved in the future with Armada 8k, it
> > seems whatever effort I put in is wasted.
> 
> The problem is that you do tons of work on your side, but never submit
> anything. Or when you submit something, it's enormous patch series that
> hardly get reviewed because they are too big.

The choice is between a large series of patches, where each patch makes
one incremental change, or a smaller series where each patch makes a
big number of changes combined.

It is my belief (and also requested by others) that patches that make
only one incremental change at a time are easier to review than a smaller
set of patches that make many changes.  This means large patch series.

> I'm sorry, but we can't wait for you to decide if/when you will send
> your patch series. There are some topics that we need to make progress
> on, and since you're not sending anything, we have to do it at some
> point.

I don't have the bandwidth to constantly post and re-post patches all
the time, especially when it's not clear whether they're even appropriate.
In the case of the ICU, I had come to the conclusion that we don't
need support for the ICU, as the default mappings setup by the firmware
appear to be sufficient for everything.

> Once again: patches not submitted to the mailing list simply don't
> exist. So if you continue to keep those huge stack of patches out of
> tree and don't submit your work more regularly, in fine-grained patches
> series, the situation we have today will continue to happen.

Given the number of patch sets that I have, that is simply an
impossibility to do on a continual basis - I have close to 500
patches, and there's simply no way to post that number of patches.

> We knew that you were doing some work on the ICU, we knew you were
> doing some work on gpio/pinctrl, but none of this was ever submitted.
> After several months, it was time to move forward on those topics.

Right, so try _talking_ to me - like Hans had done over the long
weekend, asking what was happening with the dw-hdmi CEC driver
(which I'm now working on publishing a patch set for.)  The only
way to deal with the amount of patches I have is based on requests
from people.

> If you want to avoid this situation, submit your patches. Early and
> often.

That's quite impossible for me as explained above - I've tried for
years to reduce the number of patches, and I've yet to succeed.  The
only way I think I can do it is to basically stop and delete the
git tree, and walk away from the kernel completely.  That's obviously
not going to happen.

What I'm asking for is some give-and-take co-operation.  I've pulled
patches from your tree for the SDHCI and ethernet support that you
haven't emailed out in order to keep things moving forward, yet you
seem to be completely unwilling to reciprocate.  That makes it very
difficult to work co-operatively.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
