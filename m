From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 2/3] arm64: dts: allwinner: axp803: add USB power supply node
Date: Fri, 19 Apr 2019 00:18:03 +0800
Message-ID: <20190418161804.17723-3-wens@kernel.org>
References: <20190418161804.17723-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418161804.17723-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The AXP803 has a VBUS power input. Add a device node for it,
now that we support it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/axp803.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/axp803.dtsi b/arch/arm64/boot/dts/allwinner/axp803.dtsi
index c3a618e1279a..f0349ef4bfdd 100644
--- a/arch/arm64/boot/dts/allwinner/axp803.dtsi
+++ b/arch/arm64/boot/dts/allwinner/axp803.dtsi
@@ -185,4 +185,10 @@
 			status = "disabled";
 		};
 	};
+
+	usb_power_supply: usb-power-supply {
+		compatible = "x-powers,axp803-usb-power-supply",
+			     "x-powers,axp813-usb-power-supply";
+		status = "disabled";
+	};
 };
-- 
2.20.1
