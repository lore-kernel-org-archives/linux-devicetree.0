From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 1/3] arm64: dts: ti: am654: Add Main System Control Module node
Date: Tue, 5 Feb 2019 14:45:20 +0200
Message-ID: <1549370722-414-2-git-send-email-rogerq@ti.com>
References: <1549370722-414-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549370722-414-1-git-send-email-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t-kristo@ti.com
Cc: nm@ti.com, nsekhar@ti.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

From: Jyri Sarha <jsarha@ti.com>

Main System control module support is added to the device tree to allow
driver to access to their control module registers.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 9338315..7b0acf2 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -205,4 +205,12 @@
 		ti,trm-icp = <0x8>;
 		dma-coherent;
 	};
+
+	scm_conf: scm_conf@100000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0 0x00100000 0 0x1c000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x00100000 0x1c000>;
+	};
 };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
