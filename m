From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Clk drivers for NXP LPC18xx family
Date: Tue, 12 May 2015 15:31:26 -0700
Message-ID: <20150512223126.GA14873@codeaurora.org>
References: <1430170693-28303-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430170693-28303-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/27, Joachim Eastwood wrote:
> This patch set adds support for the two main clock peripherals in the
> LPC18xx/43xx MCU family.
> 
> The Clock Generation Unit (CGU) is the base source of all clocks. It has
> five external inputs and contains PLLs, dividers and muxes. The outputs
> from the CGU are then routed to a Clock Control Unit (CCU) and a few
> peripherals directly. There are two CCUs in the MCU. The CCU is a
> collection of gates and a few dividers that sits between the CGU and
> most of the peripherals.
> 
> Which clocks that are available depends on the specific device and it's
> peripherals. It's possible in DT to setup the routing between the CGU
> and the CCUs.

Is there any reason why this uses CLK_OF_DECLARE over the
platform device model? Typically we have CLK_OF_DECLARE for cases
where a provider needs to be up and running early during boot for
hardware that can't probe defer (i.e. timers, irq controllers).
Otherwise we should be able to use the standard linux device
model to probe clk providers. It looks like the clocksource is
using something from CCU, but perhaps CGU isn't "special" and
could be using device model.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
