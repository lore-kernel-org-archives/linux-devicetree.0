From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] Linux common clock framework: device with many clocks
Date: Fri, 16 May 2014 12:23:37 -0700
Message-ID: <CAPtuhTissRRQ6bPG0pp_e-NZ+ReaMtxWefAGq2kjFEcdmh_LEg@mail.gmail.com>
References: <CANCKTBuOK41=ZxHcDRthc0uc81-nDr_66veeQvUDNjsKq85OSw@mail.gmail.com>
 <20140430231307.GA10250@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140430231307.GA10250-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 30, 2014 at 4:13 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi,

Thanks for Cc'ing me Mark.

>
> On Wed, Apr 30, 2014 at 09:39:11PM +0100, Jim Quinlan wrote:
>> In most examples of .dtsi files I have perused, a device is associated with
>> typically one clock, maybe two.  In the SoC I'm working on, some devices
>> need to turn off multiple clocks for PM, as many as 13.   The driver gets
>> the clocks from the device tree, and when the driver wants to turn off
>> clocks to the device, it loops through all 13 clocks.
>>
>> I'm wondering if is possible to abstract a group of many clocks into one
>> "software clock". Invoking clk_disable() on said software clock would
>> effect the iteration of clk_disable() on all 13 of the clocks it governs.
>>  Enabling would effect clk_enable() on all 13.  This would make the driver
>> writer's life a little simpler.
>>
>> I've looked at the Linux Common Clock Framework, and it doesn't really
>> accommodate multiple active parents as it's somewhat contrary to its
>> design.  Also, playing with the innards of clk.c is ill-advised.  Should I
>> just stick to putting iteration over the clocks in all my drivers, or is
>> there a better way?
>
> This doesn't strike me as a DT issue. The DT should describe all the
> clocks that a given block takes, and the representation of said clocks
> in the DT is completely separate matter from the management of said
> clocks in any given driver.
>
> If you want a helpful abstraction for combining clocks for management
> purposes you'd be better off talking to Mike Turquette (CC'd), as he's
> in charge of the common clock framework.

Jim emailed me privately. Here is my response for posterity:



On Wed, May 7, 2014 at 8:59 AM, Jim Quinlan <jquinlan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Hi Mike,

Hi Jim,

<snip>

> In most examples of .dtsi files I have perused, a device is associated with
> typically one clock, maybe two.  In the SoC I'm working on, some devices
> need to turn off multiple clocks for PM, as many as 13.   The driver gets
> the clocks from the device tree, and when the driver wants to turn on/off
> clocks to the device, it loops through all 13 clocks.

Is it possible for you to share a data sheet or TRM for this part? I'd
like to better understand your 13 clock requirement.

Is your device driver upstream? If not, can you share a link to bcom's
public vendor git tree with the driver in question?

> I'm wondering if is possible to abstract a group of many clocks into one
> "software clock". Invoking clk_disable() on said software clock would
> effect the iteration of clk_disable() on all 13 of the clocks it governs.

I oppose "software clocks", "virtual clocks" or any kind of struct clk
that doesn't map onto real clock hardware directly.

> Enabling would effect clk_enable() on all 13.  This would make the driver
> writer's life a little simpler.

What you are asking for is an abstraction. We already have this in the
form of Runtime PM where a driver calls pm_runtime_get() and
pm_runtime_put() without having to worry about the details of enabling
and disabling those 13 clocks. Runtime PM is *the* abstraction you are
looking for.

You should check out the RPM stuff as well as the power_domain and
gen_pd stuff. OMAP, SH-Mobile and Ux500 have interesting
implementations of all of this stuff for rather complex SoCs.

> I've looked at the Linux Common Clock Framework, and it doesn't really
> accommodate multiple active parents as it's somewhat contrary to its
> design.  Also, playing with the innards of clk.c is ill-advised.  Should I
> just stick to putting iteration over the clocks in all my drivers, or is
> there a better way?

Can you elaborate on "multiple active parents"? What does that mean?

Regards,
Mike



>
> Cheers,
> Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
