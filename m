From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v3 7/8] rtc: st: add new driver for ST's
 LPC RTC
Date: Wed, 25 Feb 2015 11:19:11 +0000
Message-ID: <20150225111910.GX8656@n2100.arm.linux.org.uk>
References: <1424260154-12868-1-git-send-email-lee.jones@linaro.org>
 <1424260154-12868-8-git-send-email-lee.jones@linaro.org>
 <20150223101223.GA14142@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150223101223.GA14142@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 23, 2015 at 10:12:23AM +0000, Peter Griffin wrote:
> I think all the writel IO accessors in this driver can be replaced
> with the *_relaxed variant. This will avoid the overhead of taking a
> spinlock in the l2 outer cache part of writel.

You're really operating on old information.  With much improved L2 cache
support code which went in a year or so ago, for the popular L2 cache
controllers, we don't take a spinlock anymore - we just write to the
register directly.

The spinlock is only present for L2C-220 controllers, which are rare.

Moreover, taking the spinlock is only expensive if you have things like
lockdep enabled, otherwise it should be inline and will be fast.

However, using the _relaxed variants where we can get away with weaker
ordering of the writes to the device is a good thing nevertheless.  I'm
just pointing out that your reasoning above is wrong.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
