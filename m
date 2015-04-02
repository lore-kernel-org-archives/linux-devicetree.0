From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH 2/4] ARM: sti: stih410-clocks: Identify
 critical clocks as always-on
Date: Thu, 2 Apr 2015 09:00:36 +0100
Message-ID: <20150402080036.GA3567@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org>
 <1425071674-16995-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425071674-16995-3-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Fri, 27 Feb 2015, Lee Jones wrote:

> Lots of platforms contain clocks which if turned off would prove fatal.
> The only way to recover is to restart the board(s).  This driver takes
> references to clocks which are required to be always-on in order to
> prevent the common clk framework from trying to turn them off during
> the clk_disabled_unused() procedure.
> In this patch we are identifying clocks, which if gated would render
> the STiH410 development board unserviceable.

Can you also add <clk_s_c0_flexgen CLK_PROC_STFE> to the list of always
on clocks for stih407 and stih410?

This clock is slightly unusual in that the clock doesn't need to be on
at boot, but once enabled by the kernel, can't be disabled without causing
the system to hang.

So slightly different from the others, but I would prefer to keep balanced
enable/disable calls in the tsin driver, in case this (bug?) goes away
on future SoC's.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
