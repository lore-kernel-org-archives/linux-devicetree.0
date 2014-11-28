From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/3] add Display support for exynos3250 Rinato board
Date: Fri, 28 Nov 2014 20:39:48 +0900
Message-ID: <1417174791-7339-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: airlied@linux.ie, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, kgene.kim@samsung.com, thierry.reding@gmail.com, Inki Dae <inki.dae@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch series adds Display support for exynos3250 Rinato board.
For this, it adds fimd, MIPI-DSI and Panel device nodes to
exynos3250-rinato dts file, and adds a s6e63j0x03 Amoled panel device
driver which is based on MIPI-DSI bus.

Inki Dae (3):
  ARM: dts: add fimd device support for exynos3250-rinato
  drm/panel: add s6e63j0x03 LCD Panel driver
  ARM: dts: add Panel device support for exynos3250-rinato

 arch/arm/boot/dts/exynos3250-rinato.dts  |   70 +++
 drivers/gpu/drm/panel/Kconfig            |    6 +
 drivers/gpu/drm/panel/Makefile           |    1 +
 drivers/gpu/drm/panel/panel-s6e63j0x03.c |  693 ++++++++++++++++++++++++++++++
 4 files changed, 770 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-s6e63j0x03.c

-- 
1.7.9.5
