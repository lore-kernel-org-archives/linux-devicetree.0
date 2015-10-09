From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v5 7/7] arm64: dts: berlin4ct: add default pinmux for uart0
Date: Fri, 9 Oct 2015 19:56:50 +0800
Message-ID: <1444391810-5045-8-git-send-email-jszhang@marvell.com>
References: <1444391810-5045-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1444391810-5045-1-git-send-email-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add urt0 txd and rxd muxing setup in the dtsi because uart0 always uses
them to work, no other possibilities.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
index 8e66355..a4a1876 100644
--- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
+++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
@@ -288,12 +288,19 @@
 				clocks = <&osc>;
 				reg-shift = <2>;
 				status = "disabled";
+				pinctrl-0 = <&uart0_pmux>;
+				pinctrl-names = "default";
 			};
 		};
 
 		system_pinctrl: pin-controller@fe2200 {
 			compatible = "marvell,berlin4ct-system-pinctrl";
 			reg = <0xfe2200 0xc>;
+
+			uart0_pmux: uart0-pmux {
+				groups = "SM_URT0_TXD", "SM_URT0_RXD";
+				function = "uart0";
+			};
 		};
 	};
 };
-- 
2.6.1

