From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v2 5/6] arm64: dts: berlin4ct: add the pinctrl node
Date: Mon, 21 Sep 2015 18:04:19 +0800
Message-ID: <1442829860-4647-6-git-send-email-jszhang@marvell.com>
References: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add the avio, soc, sm pinctrl nodes for Marvell berlin4ct SoC.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
index a3b5f1d..c374f1d 100644
--- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
+++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
@@ -225,6 +225,16 @@
 			};
 		};
 
+		soc_pinctrl: pinctrl@ea8000 {
+			compatible = "marvell,berlin4ct-soc-pinctrl";
+			reg = <0xea8000 0x14>;
+		};
+
+		avio_pinctrl: pinctrl@ea8400 {
+			compatible = "marvell,berlin4ct-avio-pinctrl";
+			reg = <0xea8400 0x8>;
+		};
+
 		apb@fc0000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
@@ -280,5 +290,10 @@
 				status = "disabled";
 			};
 		};
+
+		sm_pinctrl: pinctrl@fe2200 {
+			compatible = "marvell,berlin4ct-sm-pinctrl";
+			reg = <0xfe2200 0xc>;
+		};
 	};
 };
-- 
2.5.3
