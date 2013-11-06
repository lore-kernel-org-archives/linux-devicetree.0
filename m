From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Fwd: [PATCH 8/8] arm: dts: keystone: add watchdog entry
Date: Wed, 6 Nov 2013 13:33:04 +0200
Message-ID: <527A28F0.6050406@ti.com>
References: <1383680783-12114-9-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383680783-12114-9-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, wim@iguana.be, nsekhar@ti.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, galak@kernel.crashing.org, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add watchdog entry to keystone device tree.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 arch/arm/boot/dts/keystone.dts |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dts b/arch/arm/boot/dts/keystone.dts
index 100bdf5..a6e5f91 100644
--- a/arch/arm/boot/dts/keystone.dts
+++ b/arch/arm/boot/dts/keystone.dts
@@ -179,5 +179,11 @@
 			interrupts = <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkspi>;
 		};
+
+		wdt: wdt@022f0080 {
+			compatible = "ti,keystone-wdt";
+			reg = <0x022f0080 0x80>;
+			clocks = <&clkwdtimer0>;
+		};
 	};
 };
-- 
1.7.9.5
