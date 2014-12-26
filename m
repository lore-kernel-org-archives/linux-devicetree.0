From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: dts: berlin: add PMU and twd's cpu mask and fix GPIO locations
Date: Fri, 26 Dec 2014 16:57:58 +0800
Message-ID: <1419584281-4811-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches try to improve dts for berlin. One of them enables PMU support
to BG2Q and BG2CD SoCs. One of them adds the missing PPI cpu mask to twd timer
interrupts. The last one corrects the SM GPIOs' location for BG2Q SoC.

Changes since v1:
 - Adds some text to the log of the second commit
 - Adds the patch to fix SM GPIO locations

Jisheng Zhang (3):
  ARM: dts: berlin: add pmu node for BG2Q and BG2CD
  ARM: dts: berlin: add PPI cpu mask to twd timer interrupts
  ARM: dts: berlin: correct BG2Q's SM GPIO location.

 arch/arm/boot/dts/berlin2.dtsi   |  2 +-
 arch/arm/boot/dts/berlin2cd.dtsi |  7 +++-
 arch/arm/boot/dts/berlin2q.dtsi  | 70 ++++++++++++++++++++++------------------
 3 files changed, 46 insertions(+), 33 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
