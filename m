From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: [PATCH] ARM: dts: OMAP4. fix missing omap4-sdp-es23plus.dtb in dtbs target
Date: Thu, 23 May 2013 17:45:28 +0200
Message-ID: <1369323928-4971-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Florian Vaussard <florian.vaussard@epfl.ch>
List-Id: devicetree@vger.kernel.org

When making the dtbs target, omap4-sdp-es23plus.dtb is not built.

Signed-off-by: Florian Vaussard <florian.vaussard@epfl.ch>
---
 arch/arm/boot/dts/Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b9f7121..d55cb26 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -149,6 +149,7 @@ dtb-$(CONFIG_ARCH_OMAP2PLUS) += omap2420-h4.dtb \
 	omap4-panda-es.dtb \
 	omap4-var-som.dtb \
 	omap4-sdp.dtb \
+	omap4-sdp-es23plus.dtb \
 	omap5-evm.dtb \
 	am335x-evm.dtb \
 	am335x-evmsk.dtb \
-- 
1.7.5.4

