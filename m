From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: irq-mvebu-icu: new driver for Marvell ICU
Date: Tue, 30 May 2017 15:34:45 +0200
Message-ID: <20170530153445.17c98b62@free-electrons.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
        <1496135772-20694-5-git-send-email-thomas.petazzoni@free-electrons.com>
        <20170530121907.GO22219@n2100.armlinux.org.uk>
        <20170530143350.6f8563c1@free-electrons.com>
        <20170530125643.GQ22219@n2100.armlinux.org.uk>
        <20170530132735.GA21646@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530132735.GA21646-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 30 May 2017 15:27:35 +0200, Andrew Lunn wrote:

> > Given the number of patch sets that I have, that is simply an
> > impossibility to do on a continual basis - I have close to 500
> > patches, and there's simply no way to post that number of patches.  
> 
> So you don't expect to every have your 500 patches merged?
> 
> What might help is that you ask for help getting them merged. I know
> of at least 4 groups of people interested in your devlink and 10G PHY
> code. If you handed those patches over to these people, i'm sure we
> could find somebody to post them to the list, deal with the feedback,
> etc, to get them merged. It just needs you to say it is O.K. for
> somebody to take patches from your git tree.
> 
> You are great at writing new code, but terrible at getting it
> merged. So try to find somebody who you trust, who you can hand the
> patches over to, to do the merge work.

For the record: my colleague Boris Brezillon had some time available to
work on SFP support and was willing to help Russell moving things
forward. So he talked with Russell, who as usual said "I'm working on
it".

That was in February. We're in May. Nothing happened.

So I can only agree with Andrew here: Russell you're doing awesome
technical work in terms of writing code, but you don't know how to get
it merged, and you block people trying to help you. So don't be
surprised if other people reinvent the same wheel and get it merged
before you.

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
