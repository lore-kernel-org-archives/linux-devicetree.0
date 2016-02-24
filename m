From: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [lkp] [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 24 Feb 2016 21:50:22 +0900
Message-ID: <20160224125022.GA516@swordfish>
References: <87fuwk1c0o.fsf@yhuang-dev.intel.com>
 <20160223131538.GA2048@swordfish>
 <20160223155331.GA448@swordfish>
 <20160224011941.GA7683@swordfish>
 <20160224114614.GY3305@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160224114614.GY3305-KsEp0d+Q8qECVLCxKZUutA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel test robot <ying.huang-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, lkp-JC7UmRfGjtg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Calvin Owens <calvinowens-b10kYP2dOMg@public.gmane.org>, Dave Jones <davej-rdkfGonbjUTCLXcRTR1eJlpr/1R2p/CL@public.gmane.org>, Kyle McMartin <kyle-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kara <jack-IBi9RG/b67k@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On (02/24/16 12:46), Petr Mladek wrote:
[..]
> > and you get the NMI watchdog softlockup because you have a whole bunch of
> > 
> >    "of_overlay_destroy: Could not find overlay #6"
> >    "### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6"
> > 
> > messages to print. seems that somehitng just pushes them in a loop.
> > there are too many of them:
> 
> This sounds like a reasonable explanation. It seems that
> of_unittest_destroy_tracked_overlays() really ended in an infinite
> loop.
> 
> But I am still curious why the softlookup points to
> 
> [   33.497718] EIP is at vprintk_emit+0x1ea/0x600
> 
> Also there is on the stack
> 
> [   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
> [   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
> [   33.497744]  [<c06fdf6e>] printk+0x11/0x13
> [   33.497744]  [<c06fdf6e>] printk+0x11/0x13
> [   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
> [   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
> [   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
> [   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
> 
> I would expect that the soft lookup happens in console_unlock()
> called with IRQs disabled. It seems to me that of_unittest_overlay()
> is called with IRQs enabled.

watchdog has two different parts: hrtimer part (via IRQ) checks the
touch_ts and wakeups the updater smpboot kthread; and updater kthread,
that updates touch_ts. to get a lockup you can just keep the preemption
disabled for 20+ seconds, so updater kthread will not update touch_ts.
the next hrtimer irq will detect lockup. and the .config we have is

CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

that can add up to the issue.

(well, at least watchdog was working this way the last time I saw it).


> I want to be sure that the patch in printk() did not introduce
> a deadlock that is visible only under a high printk load.

sure. I did additional intensive tests today, and saw no issues.
schematically, something like this:

	u64 start = local_lock() >> 31UL:

	{ preempt_disable(), local_irq_save() }
	while (1) {
		u64 now = local_clock() >> 31UL;
		if (now - start > TIMEOUT)
			goto out;
		pr_err(">>>>>\n");
	}
out:
	{ preempt_enable(), local_irq_restore() }


> I guess that the softlookup was not visible before the
> printk patch was applied. I wonder if the patch made something
> worse. It was supposed to improve things but...

I think the softlockup under the given conditions (endless printk and
no preemption) will show up regardless the patches being applied; but
I see you point, of course.

	-ss
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
