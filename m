From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 2/3] arm64: dts: stingray: Add Stingray Thermal DT support.
Date: Mon, 18 Jun 2018 14:01:18 +0530
Message-ID: <1529310679-13482-3-git-send-email-srinath.mannam@broadcom.com>
References: <1529310679-13482-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529310679-13482-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Pramod Kumar <pramod.kumar@broadcom.com>

Add DT nodes for thermal zones memory base address
to read temperature.

Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
Reviewed-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 99aaff0..db1cc67 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -593,4 +593,41 @@
 			status = "disabled";
 		};
 	};
+
+	tmons {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x8f100000 0x100>;
+
+		tmon_ihost0: thermal@0 {
+			compatible = "brcm,sr-thermal";
+			reg = <0x0 0x4>;
+		};
+
+		tmon_ihost1: thermal@4 {
+			compatible = "brcm,sr-thermal";
+			reg = <0x4 0x4>;
+		};
+
+		tmon_ihost2: thermal@8 {
+			compatible = "brcm,sr-thermal";
+			reg = <0x8 0x4>;
+		};
+
+		tmon_ihost3: thermal@c {
+			compatible = "brcm,sr-thermal";
+			reg = <0xc 0x4>;
+		};
+
+		tmon_crmu: thermal@10 {
+			compatible = "brcm,sr-thermal";
+			reg = <0x10 0x4>;
+		};
+
+		tmon_nitro: thermal@14 {
+			compatible = "brcm,sr-thermal";
+			reg = <0x14 0x4>;
+		};
+	};
 };
-- 
2.7.4
