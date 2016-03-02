From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [lkp] [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 2 Mar 2016 19:41:59 +0900
Message-ID: <20160302104159.GA646@swordfish>
References: <87fuwk1c0o.fsf@yhuang-dev.intel.com>
 <20160223131538.GA2048@swordfish>
 <20160223155331.GA448@swordfish>
 <20160224011941.GA7683@swordfish>
 <20160224114614.GY3305@pathway.suse.cz>
 <20160224125022.GA516@swordfish>
 <20160224151242.GA2254@swordfish>
 <20160225051005.GA884@swordfish>
 <20160302103006.GB3166@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160302103006.GB3166@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, kernel test robot <ying.huang@linux.intel.com>, lkp@01.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Calvin Owens <calvinowens@fb.com>, Dave Jones <davej@codemonkey.org.uk>, Kyle McMartin <kyle@kernel.org>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: devicetree@vger.kernel.org

On (03/02/16 11:30), Petr Mladek wrote:
> On Thu 2016-02-25 14:10:05, Sergey Senozhatsky wrote:
> > CONFIG_PREEMPT_NONE=y
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > # CONFIG_PREEMPT is not set
> > CONFIG_PREEMPT_COUNT=y
> 
> I was curious why your patch actually did not help to avoid the
> softlockup. The infinite printk loop was called in a safe context,
> CONFIG_PREEMPT_COUNT=y, so it did set console_may_schedule = 1.
> 
> But it never got console_sem, never called console_unlock()
> and never called cond_resched() there. So, it never got preempted
> in the PREEMPT_NONE kernel. The console_sem was owned by
> another process that was busy handling the flood of messages.
> 
> Note that the infinite cycle calling printk() might be interrupted anywhere
> by the NMI watchdog. It explains why the original report pointed
> at the beginning of the printk. It was not a deadlock.
> I got the softlockup on random locations here.
> 
> Also it is not the classic softlockup in console_unlock().
> The process handling the console actually could sleep if it
> has console_may_schedule = 1. This is why console_unlock()
> did not appeared in the softlockup backtrace.
> 
> 
> Conclusion:
> 
> Sergey is correct and his patches are innocent here.

thank you, Petr!


> Sergey, if you send the fix for
> of_unittest_destroy_tracked_overlays(), please add me into CC.

of course, will try to send it out tonight.


> PS: I am sorry for the noise and that it took me so long to shake my
> head around this problem. Thanks a lot for patience.

no problem at all. thank you. the more we double check it - the better.

	-ss
