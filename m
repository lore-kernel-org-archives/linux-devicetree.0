From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 3/3] ARM: STi: DT: STiH418: Add cpu-release-addr dt property.
Date: Tue,  9 Jun 2015 14:33:44 +0100
Message-ID: <1433856824-30689-4-git-send-email-peter.griffin@linaro.org>
References: <1433856824-30689-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433856824-30689-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, maxime.coquelin@st.com, khilman@kernel.org, arnd@arndb.de, olof@lixom.net
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

To enable SMP when booting via u-boot we need to specify the
newly implemented cpu-release-addr DT property for cores 2 & 3.
Cores 0 & 1 are inherited from stih407-family.dtsi.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih418.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stih418.dtsi b/arch/arm/boot/dts/stih418.dtsi
index 354d90f..8160a75 100644
--- a/arch/arm/boot/dts/stih418.dtsi
+++ b/arch/arm/boot/dts/stih418.dtsi
@@ -17,11 +17,15 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <2>;
+			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
+			cpu-release-addr = <0x94100A4>;
 		};
 		cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <3>;
+			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
+			cpu-release-addr = <0x94100A4>;
 		};
 	};
 
-- 
1.9.1
