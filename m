From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RESEND PATCH v4] clk: stm32h7: Add stm32h743 clock driver
Date: Wed, 28 Jun 2017 08:59:56 -0700
Message-ID: <20170628155956.GA5316@codeaurora.org>
References: <1496818794-14771-1-git-send-email-gabriel.fernandez@st.com>
 <20170621220703.GI4493@codeaurora.org>
 <110cf67f-e1d6-1f99-953c-6b9639bb4910@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <110cf67f-e1d6-1f99-953c-6b9639bb4910-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/27, Gabriel FERNANDEZ wrote:
> 
> 
> On 06/22/2017 12:07 AM, Stephen Boyd wrote:
> > readl_poll_timeout?
> >
> if i use readl_poll_timeout (wich use 'ktime_get()') it can be 
> operational only after the selection of clocksource ? (device_initcall).
> And then if a driver turn on a clock before, it could blocked the linux 
> console ?
> 

Ok. I wonder if we could add some sort of starting check to
readl_poll_timeout() that tests system_state for booting vs.
scheduling? That should be sufficient to handle this case?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
