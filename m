From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 0/3] Add APM X-Gene SoC RNG device driver
Date: Fri, 22 Aug 2014 16:26:37 -0700
Message-ID: <1408750000-28453-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-qTEPVZfXA3Y@public.gmane.org, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add APM X-Gene SoC RNG device driver.

Feng Kan (3):
  hwrng: xgene: add support for APM X-Gene SoC RNG support
  Documentation: rng: Add X-Gene SoC RNG driver documentation
  arm64: dts: add random number generator dts node to APM X-Gene
    platform.

 Documentation/devicetree/bindings/rng/apm,rng.txt |  17 +
 arch/arm64/boot/dts/apm-storm.dtsi                |  21 ++
 drivers/char/hw_random/Kconfig                    |  13 +
 drivers/char/hw_random/Makefile                   |   1 +
 drivers/char/hw_random/xgene-rng.c                | 423 ++++++++++++++++++++++
 5 files changed, 475 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/apm,rng.txt
 create mode 100644 drivers/char/hw_random/xgene-rng.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
