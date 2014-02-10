From: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Subject: Re: [PATCH v6 05/19] watchdog: orion: Make sure the watchdog is
 initially stopped
Date: Mon, 10 Feb 2014 10:57:00 -0600
Message-ID: <20140210105700.16955eu5u42a9xoo@67.228.131.205>
References: <1391707226-18258-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391707226-18258-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <52F43ED0.4050808@roeck-us.net> <20140207104044.GA11063@localhost>
 <20140207174314.GB16263@obsidianresearch.com>
 <20140210122223.GF10872@localhost>
 <20140210104850.48324szjwjihb7cw@67.228.131.205>
 <20140210165405.GF15607@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140210165405.GF15607@localhost>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:

> On Mon, Feb 10, 2014 at 10:48:50AM -0600, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org wrote:
>> Quoting Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>>
>> > On Fri, Feb 07, 2014 at 10:43:14AM -0700, Jason Gunthorpe wrote:
>> >> On Fri, Feb 07, 2014 at 07:40:45AM -0300, Ezequiel Garcia wrote:
>> >>
>> >> > Well, this is related to the discussion about the bootloader not
>> >> > reseting the watchdog properly, provoking spurious watchdog triggering.
>> >> >
>> >> > Jason Gunthorpe explained [1] that we needed a particular sequence:
>> >> >
>> >> >  1. Disable WDT
>> >> >  2. Clear bridge
>> >> >  3. Enable WDT
>> >> >
>> >> > We added the irq handling to satisfy (2), and the watchdog  
>> stop for (1).
>> >>
>> >> The issue here is the driver configures two 'machine kill' elements:
>> >> the PANIC IRQ and the RstOut setup.
>> >>
>> >> Before configuring either of those the driver needs to ensure that any
>> >> old watchdog events are cleared out of the HW. We must not get a
>> >> spurious event.
>> >>
>> >> I agree not disabling an already functional and properly configured
>> >> counter from the bootloader is desirable.
>> >>
>> >> So lets break it down a bit..
>> >>
>> >> 1) The IRQ:
>> >>   It looks like the cause bit latches high on watchdog timer
>> >>   expiration but has no side effect unless it is unmasked.
>> >>
>> >>   The new IRQ flow code ensures the bit is cleared during request_irq
>> >>   so no old events can trigger the IRQ. Thus it is solved now.
>> >>
>> >
>> > Agreed.
>> >
>> >> 3) The timer itself:
>> >>   The WDT is just a general timer with an optional hookup to the
>> >>   rst control. If it is harmlessly counting but not resetting we need
>> >>   to stop that before enabling rst out.
>> >>
>> >
>> > Actually, the current flow is to:
>> >
>> > 1. Disable rst out and then disable the counter, in probe().
>> >
>> > 2. Enable the counter, and then enable rst out, in start().
>> >
>> >> So, how about this for psuedo-code in probe:
>> >>
>> >> if (readl(RSTOUTn) & WDRstOutEn)
>> >> {
>> >>     /* Watchdog is configured and may be down counting,
>> >>        don't touch it */
>> >>     request_irq(..);
>> >> }
>> >> else
>> >> {
>> >>     /* Watchdog is not configured, fully disable the timer
>> >>        and configure for watchdog operation. */
>> >>     disable_watchdog();
>> >>     request_irq();
>> >>     writel(RSTOUTn), .. WDRstOutEn);
>> >> }
>> >>
>> >
>> > Sounds good, although it seems to me it's actually simpler:
>> >
>> >   /* Let's make sure the watchdog is fully stopped, unless
>> >    * it's explicitly enabled and running
>> >    */
>> >   if ( !(wdt_rst_out_en && wdt_timer_enabled) ) {
>> >     watchdog_stop();
>> >   }
>> >
>>
>>      if (!wdt_rst_out_en || !wdt_timer_enabled)
>>          watchdog_stop();
>>
>> seems to be a bit easier to understand.
>>
>
> Yeah, I was actually planning to have a orion_wdt_enabled() function
> to get the running and enabled status. Looks cleaner I think.
>
> 	if (!orion_wdt_enabled())
> 		watchdog_stop();
>
> So the idea is OK?
>
Sounds good to me.

> I'll push the new series in a short while. Unfortunately, this change
> means I have to rebase almost all the series, because I introduce the
> orion watchdog struct :-(

Just trying to keep you busy :-)

Guenter


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
