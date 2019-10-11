From: Pascal Paillet <p.paillet@st.com>
Subject: [PATCH 3/4] ARM: dts: stm32: Fix active discharge usage on stm32mp157
Date: Fri, 11 Oct 2019 16:04:44 +0200
Message-ID: <20191011140445.32288-4-p.paillet@st.com>
References: <20191011140445.32288-1-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011140445.32288-1-p.paillet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: p.paillet@st.com
List-Id: devicetree@vger.kernel.org

Active discharge is a uint32 not a boolean.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 4 ++--
 arch/arm/boot/dts/stm32mp157a-dk1.dts       | 2 +-
 arch/arm/boot/dts/stm32mp157c-ed1.dts       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index 5f35b0146017..d1cc42a92d3f 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -252,14 +252,14 @@
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
 				interrupt-parent = <&pmic>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 
 			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
 				interrupt-parent = <&pmic>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index efeefb3d25b0..0e80f8da28d4 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -351,7 +351,7 @@
 			 vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			 };
 		};
 
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 15afa8f1a36f..108612b523de 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -225,7 +225,7 @@
 			 vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			 };
 		};
 
-- 
2.17.1
