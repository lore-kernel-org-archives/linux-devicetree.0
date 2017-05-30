From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: irq-mvebu-icu: new driver for Marvell ICU
Date: Tue, 30 May 2017 16:03:20 +0200
Message-ID: <20170530140320.GA22758@lunn.ch>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496135772-20694-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170530121907.GO22219@n2100.armlinux.org.uk>
 <20170530143350.6f8563c1@free-electrons.com>
 <20170530125643.GQ22219@n2100.armlinux.org.uk>
 <20170530132735.GA21646@lunn.ch>
 <20170530134226.GR22219@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170530134226.GR22219-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

1;4601;0cOn Tue, May 30, 2017 at 02:42:26PM +0100, Russell King - ARM Linux wrote:
> On Tue, May 30, 2017 at 03:27:35PM +0200, Andrew Lunn wrote:
> > So you don't expect to every have your 500 patches merged?
> 
> Correct.
> 
> > What might help is that you ask for help getting them merged. I know
> > of at least 4 groups of people interested in your devlink and 10G PHY
> > code.
> 
> As I've repeatedly explained - and it's called phylink, not devlink -

Sorry, my error. To many different -link things in the network stack.

> the SFP support is not ready due to the SFP+ stuff needing a complete
> rewrite of that code, which has been delayed because of delays on
> SolidRun's side to provide SFP+ hardware.

Linux has a long history of reworking stuff in tree, when it has been
shown to be inadequate in its first version. So long as the device
tree binding does not need incompatible changes, this reworking is not
an issue. My guess is, a lot of people have SFP sockets, not
SFP+. Lets get SFP merged, and then rework it in tree to add SFP+.

> Much of the changes for that happened during the last month, but are
> currently rather dirty and incomplete, but are in a working state.
> As you know, I had been pushing out the 10G PHY changes as quickly as
> netdev copes with them during the previous kernel cycle.  The rate of
> patch merging was completely insufficient to get the 10G support into
> netdev - with it taking a week or longer between patches posted and
> the merge happening.

netdev is the fastest tree i've worked in to get stuff merged. It
averages around 3 days. But it requires both sides to be very active,
submitters and reviewers.

> > You are great at writing new code, but terrible at getting it
> > merged.
> 
> Yes, because I find it very very time consuming and frustrating to
> deal with other people - it's really not easy.

So as i suggested, outsource that part of the work.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
