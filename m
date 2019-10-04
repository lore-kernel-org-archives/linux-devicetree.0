From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH] ARM: dts: stm32: add focaltech touchscreen on stm32mp157c-dk2 board
Date: Fri, 4 Oct 2019 15:17:02 +0200
Message-ID: <1570195022-23327-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

Enable focaltech ft6236 touchscreen on STM32MP157C-DK2 board.

Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32mp157c-dk2.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 20ea601..d44a7c6 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -61,6 +61,19 @@
 	};
 };
 
+&i2c1 {
+	touchscreen@38 {
+		compatible = "focaltech,ft6236";
+		reg = <0x38>;
+		interrupts = <2 2>;
+		interrupt-parent = <&gpiof>;
+		interrupt-controller;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+		status = "okay";
+	};
+};
+
 &ltdc {
 	status = "okay";
 
-- 
2.7.4
