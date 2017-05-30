From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: irq-mvebu-icu: new driver for Marvell ICU
Date: Tue, 30 May 2017 14:33:50 +0200
Message-ID: <20170530143350.6f8563c1@free-electrons.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
        <1496135772-20694-5-git-send-email-thomas.petazzoni@free-electrons.com>
        <20170530121907.GO22219@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530121907.GO22219-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 30 May 2017 13:19:07 +0100, Russell King - ARM Linux wrote:

> I see we're still duplicating work.
> 
> Yes, I know you'll reply with your "your tree is a private tree" blah
> blah, which is fine if you want to keep re-doing work that others have
> done, but it's incredibly inefficient.
> 
> What you call my private tree is the public ARM git tree - hardly
> private.  It's the one which core ARM changes go through.  The mcbin
> changes are in a separate branch of that tree - hardly private by
> any definition of that term.  It's as private as your own
> free-electrons git tree.

None of the changes in this series are core ARM changes, they touch
Device Tree bindings, irqchip drivers and Device Tree files, none of
which you are maintainer for. Your tree therefore has no higher
authority than any other tree, so using the fact that the core ARM
changes go through your tree as an argument to make people believe your
tree is more important than the contributions from other developers is
a very fallacious argument.

> Given that during the previous rounds I was willing to work with you,
> testing your patches and helping the effort along, I find your attitude
> towards me to be very counter-productive - you seem to have a very big
> NIH problem.
> 
> How about working _together_ sharing the effort, rather than competing?
> 
> I have a 31 patch series in my tree cleaning up the Marvell ICU support
> and adding PM support to the driver - obviously too large to post as-is
> for mainline, but intended for the changes to be reviewable.  Obviously
> that was now a total waste of my time.
> 
> I don't see why I should get involved in the future with Armada 8k, it
> seems whatever effort I put in is wasted.

The problem is that you do tons of work on your side, but never submit
anything. Or when you submit something, it's enormous patch series that
hardly get reviewed because they are too big.

I'm sorry, but we can't wait for you to decide if/when you will send
your patch series. There are some topics that we need to make progress
on, and since you're not sending anything, we have to do it at some
point.

It's exactly the same story as the one with the patches sent by Marcin.
The fact that you have a wonderful set of patches in your private
branch doesn't make the upstream kernel move forward.

Once again: patches not submitted to the mailing list simply don't
exist. So if you continue to keep those huge stack of patches out of
tree and don't submit your work more regularly, in fine-grained patches
series, the situation we have today will continue to happen.

We knew that you were doing some work on the ICU, we knew you were
doing some work on gpio/pinctrl, but none of this was ever submitted.
After several months, it was time to move forward on those topics.

If you want to avoid this situation, submit your patches. Early and
often.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
