From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 2/2] ARM: shmobile: armadillo: Set vccq_sdhi0 regulator type in DT
Date: Thu, 28 Nov 2013 16:44:53 +0100
Message-ID: <1385653493-9952-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1385653493-9952-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1385653493-9952-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The mandatory regulator-type property is missing, add it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
index 7b80f19..013a7cd 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
@@ -53,6 +53,8 @@
 		regulator-name = "SDHI0 VccQ";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-type = "voltage";
+
 		vin-supply = <&vcc_sdhi0>;
 
 		enable-gpio = <&pfc 74 GPIO_ACTIVE_HIGH>;
-- 
1.8.3.2

