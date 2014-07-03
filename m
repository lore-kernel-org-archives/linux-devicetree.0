From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH RESEND 05/18] AT91: SAMA5D3: DT: Add shutdown controller
Date: Thu,  3 Jul 2014 16:41:20 +0200
Message-ID: <1404398493-28907-6-git-send-email-maxime.ripard@free-electrons.com>
References: <1404398493-28907-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404398493-28907-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@maxim.org.za, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, dwmw2@infradead.org, dbaryshkov@gmail.com
Cc: Boris Brezillon <boris@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Thomas Petazzoni <thomas@free-electrons.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The SAMA5D3 has a shutdown controller identical to the sam9x5 SoC family.
Declare it in the DT.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sama5d3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index e0b15a6e8897..8bcf1c442c96 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1178,6 +1178,11 @@
 				reg = <0xfffffe00 0x10>;
 			};
 
+			shutdown-controller@fffffe10 {
+				compatible = "atmel,at91sam9x5-shdwc";
+				reg = <0xfffffe10 0x10>;
+			};
+
 			pit: timer@fffffe30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffe30 0xf>;
-- 
2.0.1
