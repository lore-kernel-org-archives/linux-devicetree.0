From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am654-base-board: Enable ECAP PWM
Date: Fri, 7 Dec 2018 15:05:35 +0530
Message-ID: <20181207093535.5497-3-vigneshr@ti.com>
References: <20181207093535.5497-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207093535.5497-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Enable ECAP PWM which is used for LCD backlight.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index bd5a0069191d..49ec2c3f5ef1 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -76,6 +76,12 @@
 			AM65X_IOPAD(0x000c, PIN_INPUT, 0) /* (E21) I2C1_SDA */
 		>;
 	};
+
+	ecap0_pins_default: ecap0-pins-default {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x0010, PIN_INPUT, 0) /* (D21) ECAP0_IN_APWM_OUT */
+		>;
+	};
 };
 
 &wkup_uart0 {
@@ -125,3 +131,8 @@
 	pinctrl-0 = <&main_i2c2_pins_default>;
 	clock-frequency = <400000>;
 };
+
+&ecap0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecap0_pins_default>;
+};
-- 
2.19.2
