From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] Add MFC device tree support
Date: Thu, 16 Aug 2012 18:01:11 +0530
Message-ID: <1345120273-22913-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, ch.naveen@samsung.com, arun.kk@samsung.com, joshi@samsung.com
List-Id: devicetree@vger.kernel.org

This patch incorporates device tree support for the video codec
IP (MFC) present in Exynos series SoCs.
The driver side support for this will be posted as a separate
patch in the linux-media mailing list.

Naveen Krishna Chatradhi (1):
  ARM: EXYNOS: Add MFC device tree support

 .../devicetree/bindings/media/s5p-mfc.txt          |   24 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |   10 ++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   10 ++++++++
 arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
 arch/arm/mach-exynos/mach-exynos4-dt.c             |   22 ++++++++++++++++++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   22 ++++++++++++++++++
 6 files changed, 89 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
