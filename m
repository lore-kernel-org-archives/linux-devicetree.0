From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Broadcom STB wake-timer support
Date: Thu, 15 Jun 2017 12:59:02 -0700
Message-ID: <20170615195904.12653-1-f.fainelli@gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <rtc-linux+bncBCH67JWTV4DBBGGORPFAKGQEXLN7FFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:REAL TIME CLOCK RTC SUBSYSTEM" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

This patch series adds support for the Broadcom STB wake-timer. This is a 27Mhz
timer which allows the system to exit S2/S3/S5 sleep states when configured.

The wake-timer has has a long history within our internal/downstream tree, and
Brian authored it in the first place, then Markus added the rtc bits, and then I
cleaned it up for upstream.

Thanks!

Brian Norris (1):
  rtc: brcmstb-waketimer: Add Broadcom STB wake-timer

Florian Fainelli (1):
  dt-bindings: Document the Broadcom STB wake-up timer node

 .../bindings/rtc/brcm,brcmstb-waketimer.txt        |  22 ++
 drivers/rtc/Kconfig                                |  11 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-brcmstb-waketimer.c                | 345 +++++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.txt
 create mode 100644 drivers/rtc/rtc-brcmstb-waketimer.c

-- 
2.9.3

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
