From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/7] ARM: SMP: common "pen" secondary release method
Date: Fri, 28 Mar 2014 21:47:04 +0000
Message-ID: <20140328214703.GV7528@n2100.arm.linux.org.uk>
References: <1396041180-29897-1-git-send-email-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396041180-29897-1-git-send-email-elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shiraz.hashim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 28, 2014 at 04:12:53PM -0500, Alex Elder wrote:
> This series proposes creating a single implementation of the "pen
> release" (or spin-table) mechanism for starting secondary CPUs on
> ARM SMP systems.  This mechanism is currently implemented at least 5
> times in the kernel, each essentially identical to the other.  There
> are other machines that use this method, but slight differences make
> it necessary to incorporate further work in order to accomodate them
> with a single set of functions.

As I've already said, I have strong objections against anything which
"officialises" this holding-pen approach to secondary CPUs and encourages
it's cargo cult programming with respect to it.  I've already made my
views abundantly clear on this subject many times, and they haven't
changed.  I've indicated some clear technical reasons why it should
not be encouraged.

By moving this crap it into core code, you're giving it a stronger
endorsement that it's a right way to deal with bringing CPUs online.
It isn't.  It must not be encouraged.

> This work began with integrating SMP support for a Broadcom SoC.
> The code I started was another copy of the "pen release" code.

... which just goes to show how people cargo-cult program all the
time - and don't really have a clue what the hell they're doing.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
