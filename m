From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v8 01/11] ARM: brcmstb: add infrastructure for
	ARM-based Broadcom STB SoCs
Date: Sat, 2 Aug 2014 10:27:56 +0100
Message-ID: <20140802092756.GZ30282@n2100.arm.linux.org.uk>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com> <1405976886-27807-2-git-send-email-computersforpeace@gmail.com> <CAL_Jsq+Nbk7m9KXhG+Chdpvurp75RrvhFR2oE_LGxV444GSe9Q@mail.gmail.com> <20140731022320.GM3711@ld-irv-0074> <20140731084315.GJ30282@n2100.arm.linux.org.uk> <20140731220642.GQ3711@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140731220642.GQ3711@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 31, 2014 at 03:06:42PM -0700, Brian Norris wrote:
> Hi Russell,
> 
> Yes, I noticed this. What I meant is that smp_ops.cpu_die() and
> smp_ops.cpu_kill() are not synchronized.
...
> We're not relying on the L1 cache, though. Don't sync_cache_{r,w}()
> ensure all reads/writes reach at least the L2?

What exactly are you trying to achieve here?

> How does that ensure that the CPU is down by the time the work is
> scheduled? It seems like this would just defer the work long enough that
> it *most likely* has quiesced, but I don't see how this gives us a
> better guarantee. Or maybe I'm missing something. (If so, please do
> enlighten!)

Note that I said a delayed work queue.  The dying CPU runs a predictable
sequence once cpu_die() has been entered - interrupts at the GIC have
been programmed to be routed to other CPUs, interrupts at the CPU are
masked, so the CPU isn't going to be doing anything else except executing
that code path.  So, it's going to be a predictable number of CPU cycles.

That allows you to arrange a delayed workqueue (or a timer) to fire
after a period of time that you can guarantee that the dying CPU has
reached that wfi().

Another point which raises itself in your patch is this:

+       /* Settle-time from Broadcom-internal DVT reference code */
+       udelay(7);

7us looks very precise, but udelay() may not be that precise.  What is
the actual specification?  Does it say "you must wait at least 7us"?

udelay() _may_ return early, especially if it is using the CPU delay
loop to perform the delay - I've explained why this happens previously,
and why it isn't a bug.

If you're using a timer-based delay for udelay() (which you should be
using if you support cpufreq) then the delay should be more accurate,
but it's still good practise to give a little leeway on the figure.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
