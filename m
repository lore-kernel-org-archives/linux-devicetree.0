From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 0/6] STM32F4 Add RTC & QSPI clocks
Date: Wed, 19 Oct 2016 13:29:04 -0700
Message-ID: <20161019202904.GB8871@codeaurora.org>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <20161018235108.GP8871@codeaurora.org>
 <d878b846-556d-180b-8ebf-2d06646efb58@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d878b846-556d-180b-8ebf-2d06646efb58-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/19, Gabriel Fernandez wrote:
> Hi Stephen,
> 
> 
> On 10/19/2016 01:51 AM, Stephen Boyd wrote:
> >On 10/14, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
> >>Gabriel Fernandez (6):
> >>   clk: stm32f4: Add LSI & LSE clocks
> >>   ARM: dts: stm32f429: add LSI and LSE clocks
> >>   arm: stmf32: Enable SYSCON
> >>   clk: stm32f4: Add RTC clock
> >>   clk: stm32f469: Add QSPI clock
> >>   ARM: dts: stm32f429: Add QSPI clock
> >Can the clk patches be picked without causing problems for
> >existing dt changes? Do you want an ack from clk maintainers
> >instead of us picking the clk patches up? The series has
> >intermingled clk and dts changes so I'm confused.
> >
> 
> Thanks for reviewing.
> 
> Normally DT patches will be taken by STM32 maintainer, but yes there
> is a dependency between patch 1 & 2, so if you push the patch 1 into
> clk-next tree you have to take also patch 2.

Let's break the dependency by making the required property
optional or key off a different compatible string. As it stands
right now applying patch 1 will cause things to break until the
second patch lands which is not great.

> 
> You have to be synchronized with Alexandre Torgue.
> 
> 

I'd prefer zero synchronization. Please just send the clk patches
the next time and leave the stuff for arm-soc out of the patch
series. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
