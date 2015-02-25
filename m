From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 3/6] ARM: DT: STi: STiH407: Update picophyreset for the usb3 controllers usb2 phy
Date: Wed, 25 Feb 2015 13:36:14 +0000
Message-ID: <1424871377-1795-4-git-send-email-peter.griffin@linaro.org>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Ths picophyreset is incorrectly defined, which stops the usb2 phy being
taken out of reset.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index c06a546..186412d 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -280,7 +280,7 @@
 			#phy-cells = <0>;
 			st,syscfg = <&syscfg_core 0x100 0xf4>;
 			resets = <&softreset STIH407_PICOPHY_SOFTRESET>,
-				 <&picophyreset STIH407_PICOPHY0_RESET>;
+				 <&picophyreset STIH407_PICOPHY2_RESET>;
 			reset-names = "global", "port";
 		};
 
-- 
1.9.1
