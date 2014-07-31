From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 3/6] ARM: DTS: da850: Add node for McASP
Date: Thu, 31 Jul 2014 13:18:51 +0300
Message-ID: <1406801934-23334-4-git-send-email-peter.ujfalusi@ti.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com, robh+dt@kernel.org
Cc: khilman@deeprootsystems.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, davinci-linux-open-source@linux.davincidsp.com, pawel.moll@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Node for mcasp0

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 41ce4e8bf227..0bd98cd00816 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -276,6 +276,19 @@
 			ti,davinci-gpio-unbanked = <0>;
 			status = "disabled";
 		};
+
+		mcasp0: mcasp@01d00000 {
+			compatible = "ti,da830-mcasp-audio";
+			reg = <0x100000 0x2000>,
+			      <0x102000 0x400000>;
+			reg-names = "mpu", "dat";
+			interrupts = <54>;
+			interrupt-names = "common";
+			status = "disabled";
+			dmas = <&edma0 1>,
+				<&edma0 0>;
+			dma-names = "tx", "rx";
+		};
 	};
 	nand_cs3@62000000 {
 		compatible = "ti,davinci-nand";
-- 
2.0.2
