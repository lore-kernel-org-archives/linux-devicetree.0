From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH v4 0/5] Renesas R-Car Gen2 Common Clock Framework arch/ support
Date: Wed, 11 Dec 2013 15:05:11 +0100
Message-ID: <1386770716-21610-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This is a repost of the arch patches from the "[PATCH v3 0/8] Renesas R-Car
Gen2 Common Clock Framework support" patch series. The first three patches in
that series have been reposted separately in the "[PATCH v4 0/3] Renesas R-Car
Gen2 Common Clock Framework drivers" series to get merged through Mike
Turquette's tree, while this series will go through the ARM SoC tree.

I've asked Mike to provide a stable branch when merging the CCF driver
patches.

Laurent Pinchart (5):
  ARM: shmobile: r8a7790: Add clock index macros for DT sources
  ARM: shmobile: r8a7791: Add clock index macros for DT sources
  ARM: shmobile: r8a7790: Add clocks
  ARM: shmobile: r8a7790: Reference clocks
  ARM: shmobile: r8a7791: Add clocks

 arch/arm/boot/dts/r8a7790.dtsi            | 328 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7791.dtsi            | 313 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/r8a7790-clock.h | 100 +++++++++
 include/dt-bindings/clock/r8a7791-clock.h | 105 ++++++++++
 4 files changed, 846 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a7790-clock.h
 create mode 100644 include/dt-bindings/clock/r8a7791-clock.h

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
