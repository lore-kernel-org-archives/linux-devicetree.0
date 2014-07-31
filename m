From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v8 01/11] ARM: brcmstb: add infrastructure for
	ARM-based Broadcom STB SoCs
Date: Thu, 31 Jul 2014 09:43:15 +0100
Message-ID: <20140731084315.GJ30282@n2100.arm.linux.org.uk>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com> <1405976886-27807-2-git-send-email-computersforpeace@gmail.com> <CAL_Jsq+Nbk7m9KXhG+Chdpvurp75RrvhFR2oE_LGxV444GSe9Q@mail.gmail.com> <20140731022320.GM3711@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140731022320.GM3711@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 30, 2014 at 07:23:20PM -0700, Brian Norris wrote:
> Hi Rob,
> 
> I appreciate your comments, but where were many of these 5 months ago on
> the first 7 revisions? :)
> 
> On a practical note: v9 is already queued for 3.17. Should I send
> patches for the 3.17 cycle (or later) to fixup some of these issues? Or
> would you recommend pulling the patches out of Matt Porter's tree now,
> and reintroducing for 3.18? (I would be much happier with the first.)
> 
> I do note that we at least need to fix allmodconfig ASAP; I'll reply to
> Russell on that one.
> 
> On Wed, Jul 30, 2014 at 12:09:48PM -0500, Rob Herring wrote:
> > On Mon, Jul 21, 2014 at 4:07 PM, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > +
> > > +       per_cpu_sw_state_wr(cpu, 1);
> > 
> > The kernel already tracks the state.
> 
> Yes, but it doesn't synchronize cpu_die() and cpu_kill(). But I see you
> objected below.

Err.

static DECLARE_COMPLETION(cpu_died);

/*
 * called on the thread which is asking for a CPU to be shutdown -
 * waits until shutdown has completed, or it is timed out.
 */
void __cpu_die(unsigned int cpu)
{
        if (!wait_for_completion_timeout(&cpu_died, msecs_to_jiffies(5000))) {
                pr_err("CPU%u: cpu didn't die\n", cpu);
                return;
        }
        printk(KERN_NOTICE "CPU%u: shutdown\n", cpu);
...
        if (!platform_cpu_kill(cpu))
                printk("CPU%u: unable to kill\n", cpu);
}

void __ref cpu_die(void)
{
...
        /*
         * Tell __cpu_die() that this CPU is now safe to dispose of.  Once
         * this returns, power and/or clocks can be removed at any point
         * from this CPU and its cache by platform_cpu_kill().
         */
        complete(&cpu_died);

There _is_ synchronisation between these two.  Your cpu_kill() function
will not be called until we have flushed all data from the dying CPU's
cache.  That's the best we can do, because if we cause the dying CPU to
exit the coherency domain, any kind of locking or completion will no
longer work (neither will your state tracking solution because the L1
caches will no longer snoop.)

> Hmm, I'm pretty sure the synchronization is required for our B15 core.
> If we yank the power before the core has properly quiesced, the whole
> CPU complex will lock up. (Similar story for the power-up while loop you
> complained about above.)

If you need to ensure that the power isn't turned off too soon, how about
using a delayed work queue to do the power-off of the CPU (remembering to
cancel the delayed work queue when powering the CPU back up.)

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
