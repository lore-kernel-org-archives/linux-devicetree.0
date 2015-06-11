From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v4] ARM: l2c: add options to overwrite prefetching
 behavior
Date: Thu, 11 Jun 2015 10:39:07 +0100
Message-ID: <20150611093907.GW7557@n2100.arm.linux.org.uk>
References: <1432941541-18588-1-git-send-email-hauke@hauke-m.de>
 <20150610172100.230c0e71@free-electrons.com>
 <55788F6B.7060406@hauke-m.de>
 <20150611112459.6590ab05@free-electrons.com>
 <20150611093417.GV7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150611093417.GV7557-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, Gregory =?iso-8859-1?Q?Cl=E9ment?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 10:34:17AM +0100, Russell King - ARM Linux wrote:
> On Thu, Jun 11, 2015 at 11:24:59AM +0200, Thomas Petazzoni wrote:
> > Dear Hauke Mehrtens,
> > 
> > On Wed, 10 Jun 2015 21:26:35 +0200, Hauke Mehrtens wrote:
> > 
> > > Thanks for asking, I did not know Russell's patch process, but Florian
> > > guided me and now it is submitted, see
> > > http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8391/1
> > 
> > I tested your patch, and I'm not sure how it can work for you, because
> > the changes made to the PREFETCH_CTRL register on the data/instruction
> > prefetch bits are later overridden by changes made to the AUX_CTRL
> > register.
> 
> There's also a patch I sent on May 14th which needs to be applied for this
> to work, and fixes the above.
> 
> > How does your patch handles the fact that the prefetch data and
> > prefetch instr are cloned between PREFETCH_CTRL and AUX_CTRL ?
> 
> It needs my patch.

... in fact, please see all the other L2C patches queued in my tree.
Hauke's patch is designed to be applied on top of these patches, not
to 4.1-rc directly.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
