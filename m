From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/6] rtc: at91sam9: add DT support
Date: Tue,  9 Sep 2014 11:30:29 +0200
Message-ID: <1410255035-26775-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds DT support to the atmel at91sam9 RTC driver.

It also removes any machine specific inclusions to prepare the migration
to multi platform kernel support, and retain the slow clock to prevent
the CCF from disabling it at the end of boot.

Best Regards,

Boris

Changes since v1:
 - remove non CCF specific case by adding the appropriate clk_lookup
   entries in arch/arm/mach-at91/<soc-name>.c files

Boris BREZILLON (6):
  rtc: at91sam9: remove references to mach specific headers
  rtc: at91sam9: use standard readl/writel functions instead of raw
    versions
  rtc: at91sam9: add DT support
  ARM: at91: add clk_lookup entry for RTT devices
  rtc: at91sam9: use clk API instead of relying on AT91_SLOW_CLOCK
  rtc: at91sam9: add DT bindings documentation

 .../devicetree/bindings/rtc/atmel,at91sam9-rtc.txt | 20 +++++++
 arch/arm/mach-at91/at91sam9260.c                   |  2 +
 arch/arm/mach-at91/at91sam9261.c                   |  2 +
 arch/arm/mach-at91/at91sam9263.c                   |  4 ++
 arch/arm/mach-at91/at91sam9g45.c                   |  2 +
 arch/arm/mach-at91/at91sam9rl.c                    |  2 +
 arch/arm/mach-at91/clock.c                         |  2 +-
 arch/arm/mach-at91/clock.h                         |  1 +
 drivers/rtc/rtc-at91sam9.c                         | 63 ++++++++++++++++++----
 9 files changed, 87 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
