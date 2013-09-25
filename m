From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/3 v2] clk: keystone: Add common clock drivers
Date: Wed, 25 Sep 2013 12:13:10 -0400
Message-ID: <52430B96.5070702@ti.com>
References: <1377803662-3509-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377803662-3509-1-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mike,

On Thursday 29 August 2013 03:14 PM, Santosh Shilimkar wrote:
> v2:
> - Aligned the bindings as per the list discussion. Removed the additional
> 	parameters by usage of reg-names and additional compatible fields.
> - Addressed all the comments from v1 on drivers.
> - Split the series into clock drivers($subject series) and
> 	platform, dt updates. Will post that one separately.
> 
> Special thanks to Mike and Mark for the detailed review on v1.
> 
> Series is an attempt to add the clock drivers for Keystone SOCs
> based on common clock framework. A PLL drivers taking care of
> SOC PLLs and a gate control driver taking clock management for
> the IPs. The current Keystone based SOCs don' support dynamic power
> management usecases like DVFS, SOC ilde etc and hence most of the
> usage is limited to enabling clocks and finding the current clock
> rate etc.
> 
> Based on to of Mike's dt binding series [1] and tested on Keystone2
> EVM.
>
> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

As aligned off-list, I will revise the series to remove the
dependency with your DT bindings series which still seems to
be under discussion.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
