From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/4] ARM: dts: stm32: fix joystick node on stm32f746 and stm32mp157c eval boards
Date: Mon, 7 Oct 2019 16:34:00 +0200
Message-ID: <20191007143402.13266-3-alexandre.torgue@st.com>
References: <20191007143402.13266-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007143402.13266-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

"#size-cells" entry is not needed for "gpio-keys" driver. Indeed "reg"
entry is not used. This commit will fix a warnings seen by DT validation
tool.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index d7bb2027cfaa..fcc804e3c158 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -95,7 +95,6 @@
 
 	joystick {
 		compatible = "gpio-keys";
-		#size-cells = <0>;
 		pinctrl-0 = <&joystick_pins>;
 		pinctrl-names = "default";
 		button-0 {
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 89d29b50c3f4..6287db532e7d 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -32,7 +32,6 @@
 
 	joystick {
 		compatible = "gpio-keys";
-		#size-cells = <0>;
 		pinctrl-0 = <&joystick_pins>;
 		pinctrl-names = "default";
 		button-0 {
-- 
2.17.1
