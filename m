From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 2/3] ARM: dts: stm32: enable Vivante GPU support on stm32mp157c-ed1 board
Date: Fri, 15 Feb 2019 16:58:35 +0100
Message-ID: <1550246316-9747-3-git-send-email-pierre-yves.mordret@st.com>
References: <1550246316-9747-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550246316-9747-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Philippe Cornu <philippe.cornu@st.com>
List-Id: devicetree@vger.kernel.org

Enable Vivante GPU driver for stm32mp157c-ed1 board.

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 98ef7a0..792f402 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -20,6 +20,17 @@
 		reg = <0xC0000000 0x40000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpu_reserved: gpu@f8000000 {
+			reg = <0xf8000000 0x8000000>;
+			no-map;
+		};
+	};
+
 	aliases {
 		serial0 = &uart4;
 	};
@@ -53,6 +64,11 @@
 	status = "okay";
 };
 
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
-- 
2.7.4
