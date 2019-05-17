From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [RESEND v2 3/3] ARM: dts: stm32: enable Vivante GPU support on stm32mp157a-dk1 board
Date: Fri, 17 May 2019 10:42:08 +0200
Message-ID: <1558082528-12889-4-git-send-email-pierre-yves.mordret@st.com>
References: <1558082528-12889-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558082528-12889-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lucas Stach <l.stach@pengutronix.de>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

Enable Vivante GPU driver for stm32mp157a-dk1 and dk2 boards.

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
    v2:
       * move GPU reserved memeory out of bottom DDR to let free this area for
         U-Boot
    v1:
       * Initial
---
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 1b1886d..bd06f7b 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -27,6 +27,17 @@
 		reg = <0xc0000000 0x20000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpu_reserved: gpu@d4000000 {
+			reg = <0xd4000000 0x4000000>;
+			no-map;
+		};
+	};
+
 	led {
 		compatible = "gpio-leds";
 		blue {
@@ -69,6 +80,11 @@
 	status = "okay";
 };
 
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
-- 
2.7.4
