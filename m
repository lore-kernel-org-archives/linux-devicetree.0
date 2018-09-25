From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] ARM: dts: add omap3-gta04a5one to Makefile
Date: Tue, 25 Sep 2018 08:04:24 +0200
Message-ID: <6a9c49e78f93333f288f302ba880dc05308a5e0f.1537855461.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, tony@atomide.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

We have defined a new DTS and it should be compiled.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b5bd3de87c33..8cb78264adee 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -649,6 +649,7 @@ dtb-$(CONFIG_ARCH_OMAP3) += \
 	omap3-gta04a3.dtb \
 	omap3-gta04a4.dtb \
 	omap3-gta04a5.dtb \
+	omap3-gta04a5one.dtb \
 	omap3-ha.dtb \
 	omap3-ha-lcd.dtb \
 	omap3-igep0020.dtb \
-- 
2.12.2
