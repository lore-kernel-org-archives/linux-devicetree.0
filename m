From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] clocksource: Add clockevent support to NPS400 driver
Date: Fri, 21 Oct 2016 17:08:59 +0200
Message-ID: <20161021150859.GB5553@mai>
References: <1476370350-3853-1-git-send-email-noamca@mellanox.com>
 <1476370350-3853-4-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476370350-3853-4-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 13, 2016 at 05:52:30PM +0300, Noam Camus wrote:
> From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> Till now we used clockevent from generic ARC driver.
> This was enough as long as we worked with simple multicore SoC.
> When we are working with multithread SoC each HW thread can be
> scheduled to receive timer interrupt using timer mask register
> (TSI1).
> 
> This patch will provide a way to control clock events per
> HW thread.

The description is not very clear. Can you elaborate ?
 
> Driver can be used from device tree by:
> compatible = "ezchip,nps400-timer0" <-- for clocksource
> compatible = "ezchip,nps400-timer1" <-- for clockevent
> 
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---

[ ... ]

> -static int __init nps_setup_clocksource(struct device_node *node,
> -					struct clk *clk)
> +static void __init nps_setup_clocksource(struct device_node *node)

CLOCKSOURCE_OF_DECLARE is expecting an int __init (*func)(struct device_node *)

This function returns void at the beginning then it is not changed and returns
an error value.

linux/drivers/clocksource/timer-nps.c: In function ‘nps_setup_clocksource’:
linux/drivers/clocksource/timer-nps.c:77:10: warning: ‘return’ with a value, in function returning void
   return ret;
          ^
linux/drivers/clocksource/timer-nps.c:89:9: warning: ‘return’ with a value, in function returning void
  return ret;
         ^
linux/drivers/clocksource/timer-nps.c: At top level:
linux/drivers/clocksource/timer-nps.c:92:216: warning: comparison of distinct pointer types lacks a cast

Don't submit changes which are not correctly compiled / tested, except you want to live
dangerously and watch your karma collapse.

I will let you fix this before reviewing the patches in details.

BTW, have a look at the hotplug callbacks, they changed to a finite state machine [1] and their usage
changed [2].

  -- Daniel

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=710d60cbf1b312a8075a2158cbfbbd9c66132dcc
[2] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=eb0a9d8c672dc01db41352afa646405d035ee7a4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
