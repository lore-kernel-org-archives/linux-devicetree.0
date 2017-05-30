From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: irq-mvebu-icu: new driver for Marvell ICU
Date: Tue, 30 May 2017 15:28:59 +0200
Message-ID: <20170530152859.6b439de5@free-electrons.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
        <1496135772-20694-5-git-send-email-thomas.petazzoni@free-electrons.com>
        <20170530121907.GO22219@n2100.armlinux.org.uk>
        <20170530143350.6f8563c1@free-electrons.com>
        <20170530125643.GQ22219@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530125643.GQ22219-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 30 May 2017 13:56:43 +0100, Russell King - ARM Linux wrote:

> > The problem is that you do tons of work on your side, but never submit
> > anything. Or when you submit something, it's enormous patch series that
> > hardly get reviewed because they are too big.  
> 
> The choice is between a large series of patches, where each patch makes
> one incremental change, or a smaller series where each patch makes a
> big number of changes combined.
> 
> It is my belief (and also requested by others) that patches that make
> only one incremental change at a time are easier to review than a smaller
> set of patches that make many changes.  This means large patch series.

I was obviously not suggesting to artificially reduce the number of
patches by making each patch bigger.

Instead, I was suggesting to post things more regularly. I.e instead of
developing a full-featured solution that solves all problems, but
remains behind the scenes for months, post a minimal solution first
(which is often a smaller patch series) and sent post incremental patch
series to improve on top of it.

> I don't have the bandwidth to constantly post and re-post patches all
> the time, especially when it's not clear whether they're even appropriate.
> In the case of the ICU, I had come to the conclusion that we don't
> need support for the ICU, as the default mappings setup by the firmware
> appear to be sufficient for everything.

So why on earth do you care and yell about me posting ICU-related
patches ?

We do have reasons to believe that it is necessary, and that the
default mappings setup by the firmware will not be sufficient on the
long term, which is why we want to add ICU support.

> > Once again: patches not submitted to the mailing list simply don't
> > exist. So if you continue to keep those huge stack of patches out of
> > tree and don't submit your work more regularly, in fine-grained patches
> > series, the situation we have today will continue to happen.  
> 
> Given the number of patch sets that I have, that is simply an
> impossibility to do on a continual basis - I have close to 500
> patches, and there's simply no way to post that number of patches.

So why do you complain when others submit patches if you do not?

What you're doing with 500 patches out of tree that you do not have the
bandwidth to upstream is exactly what vendors are doing with their evil
vendor trees. But at least they don't complain when others actually
submit patches to get them merged upstream.

> > We knew that you were doing some work on the ICU, we knew you were
> > doing some work on gpio/pinctrl, but none of this was ever submitted.
> > After several months, it was time to move forward on those topics.  
> 
> Right, so try _talking_ to me - like Hans had done over the long
> weekend, asking what was happening with the dw-hdmi CEC driver
> (which I'm now working on publishing a patch set for.)  The only
> way to deal with the amount of patches I have is based on requests
> from people.

We have already talked about the ICU months ago, you were working on
it. Several months later, still no patches on the mailing list.

If I had asked you again, you would have told me "I have ICU patches I
intend to send". But since you haven't submitted them for several
months, it was time to do something about it.

Sorry, but your behavior of "I have things available and supported in
my private branch, so don't step on my toes" simply doesn't work,
because you never submit your work, as you admit yourself.

> That's quite impossible for me as explained above - I've tried for
> years to reduce the number of patches, and I've yet to succeed.  The
> only way I think I can do it is to basically stop and delete the
> git tree, and walk away from the kernel completely.  That's obviously
> not going to happen.
> 
> What I'm asking for is some give-and-take co-operation.  I've pulled
> patches from your tree for the SDHCI and ethernet support that you
> haven't emailed out in order to keep things moving forward, yet you
> seem to be completely unwilling to reciprocate.  That makes it very
> difficult to work co-operatively.

The big difference is that the SDHCI and Ethernet patches we have done
have been submitted and merged, just like everything we do for the
support of Marvell platforms.

On the other end, your ICU patches have never been submitted and merged.
So whenever you tell me that you are working on a topic, I don't trust
that this topic will actually move forward upstream because you keep
everything in your private branch, which is totally useless.

So until you insist keeping everything in your private branch, people
will keep ignoring whatever you are doing.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
