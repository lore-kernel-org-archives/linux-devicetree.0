From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] rtc: rtc-pic32: Add PIC32 real time clock driver
Date: Thu, 25 Feb 2016 19:20:38 +0100
Message-ID: <20160225182038.GJ12073@piout.net>
References: <1456421449-18225-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456421449-18225-2-git-send-email-joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/02/2016 at 10:30:44 -0700, Joshua Henderson wrote :
> This driver adds support for the PIC32 real time clock and calendar
> peripheral:
> 	- reading and setting time
> 	- alarms provided by dedicated IRQ
> 
> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> ---
> Changes since v2:
> 	- Fix rework bug causing unecessary retries for gettime.
> 	- Word commit message to be more precise.
> Changes since v1:
> 	- Fix checkpatch.pl --strict issues.
> 	- Fix alpabetical makefile ordering.
> 	- Specify consistent license.
> 	- General formatting cleanup.
> 	- Drop unecessary flags_lock.
> 	- Replace ugly gogo with do while.
> 	- Remove unecessary checks on time when setting alarm.
> 	- Don't initialize the RTC in probe.
> ---
>  drivers/rtc/Kconfig     |   10 ++
>  drivers/rtc/Makefile    |    1 +
>  drivers/rtc/rtc-pic32.c |  411 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 422 insertions(+)
>  create mode 100644 drivers/rtc/rtc-pic32.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
