From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH 1/4] ARM: dts: stm32: add 2v8 fixed regulator for stm32mp157c-ed1 board
Date: Thu, 28 Feb 2019 15:25:42 +0100
Message-ID: <1551363945-19497-2-git-send-email-hugues.fruchet@st.com>
References: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Add 2v8 fixed regulator and enable it.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 10dc7c0..4b5bcfd 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -57,6 +57,14 @@
 		regulator-boot-on;
 	};
 
+	v2v8: ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "v2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
 	sd_switch: regulator-sd_switch {
 		compatible = "regulator-gpio";
 		regulator-name = "sd_switch";
-- 
2.7.4
