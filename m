From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/4] ARM/ARM64: vexpress: fixes for v4.1
Date: Thu,  7 May 2015 15:45:01 +0100
Message-ID: <1431009905-29265-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd/Olof,

Here are few fixes posted on the list and are scattered around.
So I am sending them as a series so that you can pick them up easily.
Let me know if you prefer a pull request.

Regards,
Sudeep

Robert Schwebel (2):
  ARM: vexpress/ca9: Add unified-cache property to l2 cache node
  ARM: vexpress/ca9: Add interrupt-affinity to the PMU node

Sudeep Holla (2):
  ARM64: juno: add sp810 support and fix sp804 clock frequency
  ARM: vexpress/tc2: Add interrupt-affinity to the PMU node

 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts    |  1 +
 arch/arm/boot/dts/vexpress-v2p-ca9.dts        | 11 ++++++----
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 31 +++++++++++++++++++++++----
 3 files changed, 35 insertions(+), 8 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
