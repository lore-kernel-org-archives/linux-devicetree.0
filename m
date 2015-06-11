From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4] ARM: l2c: add options to overwrite prefetching
 behavior
Date: Thu, 11 Jun 2015 11:47:31 +0200
Message-ID: <20150611114731.23147349@free-electrons.com>
References: <1432941541-18588-1-git-send-email-hauke@hauke-m.de>
	<20150610172100.230c0e71@free-electrons.com>
	<55788F6B.7060406@hauke-m.de>
	<20150611112459.6590ab05@free-electrons.com>
	<20150611093417.GV7557@n2100.arm.linux.org.uk>
	<20150611093907.GW7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150611093907.GW7557-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, Gregory =?UTF-8?B?Q2zDqW1lbnQ=?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Russell,

On Thu, 11 Jun 2015 10:39:07 +0100, Russell King - ARM Linux wrote:

> > > How does your patch handles the fact that the prefetch data and
> > > prefetch instr are cloned between PREFETCH_CTRL and AUX_CTRL ?
> > 
> > It needs my patch.
> 
> ... in fact, please see all the other L2C patches queued in my tree.
> Hauke's patch is designed to be applied on top of these patches, not
> to 4.1-rc directly.

Yes, right. In the mean time, I discovered the discussion you had with
Hauke on the v2 of his patch series, and started looking at your
for-next branch. I wanted to give a test before reporting back, and
it's now done: with "ARM: l2c: write auxiliary control register first"
+ Hauke's patch, it works fine for me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
