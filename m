From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [RFC 4/5] dts: bcm2837: add per-cpu clock devices
Date: Fri, 17 May 2019 17:35:06 +0200
Message-ID: <20190517153508.18314-5-nsaenzjulienne@suse.de>
References: <20190517153508.18314-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190517153508.18314-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: stefan.wahren@i2se.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Cc: mbrugger@suse.de, viresh.kumar@linaro.org, rjw@rjwysocki.net, sboyd@kernel.org, eric@anholt.net, ptesarik@suse.com, linux-rpi-kernel@lists.infradead.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The four CPUs share a same clock source called pllb_arm. The clock can
be scaled through the raspberrypi firmware interface.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 arch/arm/boot/dts/bcm2837.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2837.dtsi b/arch/arm/boot/dts/bcm2837.dtsi
index beb6c502dadc..a8fea6696b42 100644
--- a/arch/arm/boot/dts/bcm2837.dtsi
+++ b/arch/arm/boot/dts/bcm2837.dtsi
@@ -44,6 +44,8 @@
 			reg = <0>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x000000d8>;
+			clocks = <&clocks BCM2835_PLLB_ARM>;
+			clock-names = "pllb_arm";
 		};
 
 		cpu1: cpu@1 {
@@ -52,6 +54,8 @@
 			reg = <1>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x000000e0>;
+			clocks = <&clocks BCM2835_PLLB_ARM>;
+			clock-names = "pllb_arm";
 		};
 
 		cpu2: cpu@2 {
@@ -60,6 +64,8 @@
 			reg = <2>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x000000e8>;
+			clocks = <&clocks BCM2835_PLLB_ARM>;
+			clock-names = "pllb_arm";
 		};
 
 		cpu3: cpu@3 {
@@ -68,6 +74,8 @@
 			reg = <3>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x000000f0>;
+			clocks = <&clocks BCM2835_PLLB_ARM>;
+			clock-names = "pllb_arm";
 		};
 	};
 };
-- 
2.21.0
