From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v6 6/6] ARM: at91/dt: sama5d2_xplained: Add fast_restart node
Date: Mon, 8 Aug 2016 18:05:05 +0800
Message-ID: <1470650705-31418-7-git-send-email-wenyou.yang@atmel.com>
References: <1470650705-31418-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470650705-31418-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Add fast_restart node as a pmc's child node to support fast startup
signal configuration.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

Changes in v6:
 - Add a new patch to support a new DT_MACHINE for SAMA5D2.

Changes in v5:
 - due to the DT property expression change, update the fast restart
   node's property.

Changes in v4:
 - add fast_restart node to the DT file.

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
index eb4f1ac..714fd82 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -110,6 +110,25 @@
 		};
 
 		apb {
+			pmc: pmc@f0014000 {
+				pmc_fast_restart {
+					compatible = "atmel,sama5d2-pmc-fast-startup";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					atmel,wakeup-rtc-timer;
+
+					wkpin: input@0 {
+						reg = <0>;
+					};
+
+					gmac_wol: input@10 {
+						reg = <10>;
+						atmel,wakeup-active-high;
+					};
+				};
+			};
+
 			spi0: spi@f8000000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_spi0_default>;
-- 
2.7.4
