From: Christophe Kerello <christophe.kerello@st.com>
Subject: [PATCH 3/4] ARM: dts: stm32: enable FMC2 NAND controller on stm32mp157c-ev1
Date: Fri, 21 Jun 2019 16:49:49 +0200
Message-ID: <1561128590-14621-4-git-send-email-christophe.kerello@st.com>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux@armlinux.org.uk, olof@lixom.net, arnd@arndb.de
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christophe Kerello <christophe.kerello@st.com>
List-Id: devicetree@vger.kernel.org

This patch enables FMC2 NAND controller used on stm32mp157c-ev1.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index feb8f77..9ab25da 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -157,6 +157,22 @@
 	};
 };
 
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_a>;
+	pinctrl-1 = <&fmc_sleep_pins_a>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand@0 {
+		reg = <0>;
+		nand-on-flash-bbt;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
 &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
-- 
1.9.1
