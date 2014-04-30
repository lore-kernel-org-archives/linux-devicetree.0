From: Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC] Linux common clock framework: device with many clocks
Date: Wed, 30 Apr 2014 16:39:11 -0400
Message-ID: <CANCKTBuOK41=ZxHcDRthc0uc81-nDr_66veeQvUDNjsKq85OSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In most examples of .dtsi files I have perused, a device is associated with
typically one clock, maybe two.  In the SoC I'm working on, some devices
need to turn off multiple clocks for PM, as many as 13.   The driver gets
the clocks from the device tree, and when the driver wants to turn off
clocks to the device, it loops through all 13 clocks.

I'm wondering if is possible to abstract a group of many clocks into one
"software clock". Invoking clk_disable() on said software clock would
effect the iteration of clk_disable() on all 13 of the clocks it governs.
 Enabling would effect clk_enable() on all 13.  This would make the driver
writer's life a little simpler.

I've looked at the Linux Common Clock Framework, and it doesn't really
accommodate multiple active parents as it's somewhat contrary to its
design.  Also, playing with the innards of clk.c is ill-advised.  Should I
just stick to putting iteration over the clocks in all my drivers, or is
there a better way?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
