From: Alex Elder <elder@linaro.org>
Subject: [PATCH v4 4/5] ARM: dts: enable SMP support for bcm28155
Date: Tue, 20 May 2014 12:43:49 -0500
Message-ID: <1400607830-10989-5-git-send-email-elder@linaro.org>
References: <1400607830-10989-1-git-send-email-elder@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400607830-10989-1-git-send-email-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mporter@linaro.org, bcm@fixthebug.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, arnd@arndb.de, sboyd@codeaurora.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, jason@lakedaemon.net, lorenzo.pieralisi@arm.com, mark.rutland@arm.com, pawel.moll@arm.com, rdunlap@infradead.org, rjui@broadcom.com, robh+dt@kernel.org, rvaswani@codeaurora.org
List-Id: devicetree@vger.kernel.org

Define nodes representing the two Cortex A9 CPUs in a bcm28155 SoC.

Signed-off-by: Ray Jui <rjui@broadcom.com>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm/boot/dts/bcm11351.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index 64d069b..61372a6 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -27,6 +27,25 @@
 		bootargs = "console=ttyS0,115200n8";
 	};
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "brcm,bcm11351-cpu-method";
+		secondary-boot-reg = <0x3500417c>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <1>;
+		};
+	};
+
 	gic: interrupt-controller@3ff00100 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
-- 
1.9.1
