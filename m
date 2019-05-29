From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 1/6] arm64: dts: k3-am6: Add "socionext,synquacer-pre-its" property to gic_its
Date: Wed, 29 May 2019 14:48:07 +0530
Message-ID: <20190529091812.20764-2-kishon@ti.com>
References: <20190529091812.20764-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529091812.20764-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

GIC_ITS used in AM654 platform has the same configuration as that of
GIC_ITS used in Socionext SoCs. Add "socionext,synquacer-pre-its"
property to get PCI MSI working.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 752455269fab..81e97d7adcc9 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -44,6 +44,7 @@
 		gic_its: gic-its@18200000 {
 			compatible = "arm,gic-v3-its";
 			reg = <0x00 0x01820000 0x00 0x10000>;
+			socionext,synquacer-pre-its = <0x1000000 0x400000>;
 			msi-controller;
 			#msi-cells = <1>;
 		};
-- 
2.17.1
