From: Nishanth Menon <nm@ti.com>
Subject: [RFC PATCH 5/7] ARM: dts: OMAP4: Add PRM interrupt
Date: Thu, 5 Jun 2014 22:35:59 -0500
Message-ID: <1402025761-16831-6-git-send-email-nm@ti.com>
References: <1402025761-16831-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1402025761-16831-1-git-send-email-nm@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Rajendra Nayak <rnayak@ti.com>, Paul Walmsley <paul@pwsan.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

Provide OMAP4 interrupt number for PRM

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm/boot/dts/omap4.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 7e26d22..6d2827f 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -129,6 +129,7 @@
 		prm: prm@4a306000 {
 			compatible = "ti,omap4-prm";
 			reg = <0x4a306000 0x3000>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 
 			prm_clocks: clocks {
 				#address-cells = <1>;
-- 
1.7.9.5

