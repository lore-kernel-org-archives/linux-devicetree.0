From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 2/3] ARM: STi: DT: STiH407: Add cpu-release-addr dt property.
Date: Tue,  9 Jun 2015 14:33:43 +0100
Message-ID: <1433856824-30689-3-git-send-email-peter.griffin@linaro.org>
References: <1433856824-30689-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433856824-30689-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, maxime.coquelin@st.com, khilman@kernel.org, arnd@arndb.de, olof@lixom.net
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

To enable SMP when booting via u-boot we need to specify the
newly implemented cpu-release-addr DT property.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
---
 arch/arm/boot/dts/stih407-family.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index c06a546..3c90227 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -19,11 +19,15 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0>;
+			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
+			cpu-release-addr = <0x94100A4>;
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
+			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
+			cpu-release-addr = <0x94100A4>;
 		};
 	};
 
-- 
1.9.1
