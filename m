From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Watchdog support for Armada 375/38x SoC
Date: Wed, 12 Mar 2014 15:43:12 -0600
Message-ID: <20140312214312.GA14357@obsidianresearch.com>
References: <1394658715-2017-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394658715-2017-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 06:11:47PM -0300, Ezequiel Garcia wrote:

> I've pushed a branch so people can test this easily, e.g. ensuring
> no regressions on Dove, Kirkwood and A370/XP:
> 
> https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_a385_a375_v3

This branch worked for me, the watchdog functioned as expected.

# killall -STOP wdt...
..
.
orion_wdt: Oops: Watchdog Timeout
CPU: 0 PID: 0 Comm: swapper Not tainted 3.14.0-rc1-00205-g666e53f-dirty #1
[..]
<REBOOT>

I got these two oddball messages during boot though:

irq: Cannot allocate irq_descs @ IRQ26, assuming pre-allocated
irq: Cannot allocate irq_descs @ IRQ61, assuming pre-allocated

Probably unrelated to the watchdog.. Unfortunately I've run out of
time right now to investigate.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
