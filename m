From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 07/10] ARM: dts: keystone: Rename "msmram" node to "sram"
Date: Wed,  2 Oct 2019 18:43:13 +0200
Message-ID: <20191002164316.14905-7-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.orgli
List-Id: devicetree@vger.kernel.org

The device node name should reflect generic class of a device so rename
the "msmram" node to "sram".  This will be also in sync with upcoming DT
schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/keystone-k2e.dtsi  | 2 +-
 arch/arm/boot/dts/keystone-k2g.dtsi  | 2 +-
 arch/arm/boot/dts/keystone-k2hk.dtsi | 2 +-
 arch/arm/boot/dts/keystone-k2l.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e.dtsi b/arch/arm/boot/dts/keystone-k2e.dtsi
index 085e7326ea8e..c84dc49e441e 100644
--- a/arch/arm/boot/dts/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e.dtsi
@@ -86,7 +86,7 @@
 			};
 		};
 
-		msm_ram: msmram@c000000 {
+		msm_ram: sram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x200000>;
 			ranges = <0x0 0x0c000000 0x200000>;
diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 1c833105d6c5..fa6be1b2cb8a 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -95,7 +95,7 @@
 		ranges = <0x0 0x0 0x0 0xc0000000>;
 		dma-ranges = <0x80000000 0x8 0x00000000 0x80000000>;
 
-		msm_ram: msmram@c000000 {
+		msm_ram: sram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x100000>;
 			ranges = <0x0 0x0c000000 0x100000>;
diff --git a/arch/arm/boot/dts/keystone-k2hk.dtsi b/arch/arm/boot/dts/keystone-k2hk.dtsi
index ca0f198ba627..2c00f11cd146 100644
--- a/arch/arm/boot/dts/keystone-k2hk.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk.dtsi
@@ -57,7 +57,7 @@
 &soc0 {
 		/include/ "keystone-k2hk-clocks.dtsi"
 
-		msm_ram: msmram@c000000 {
+		msm_ram: sram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x600000>;
 			ranges = <0x0 0x0c000000 0x600000>;
diff --git a/arch/arm/boot/dts/keystone-k2l.dtsi b/arch/arm/boot/dts/keystone-k2l.dtsi
index 374c80124c4e..ff086132576b 100644
--- a/arch/arm/boot/dts/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l.dtsi
@@ -255,7 +255,7 @@
 			};
 		};
 
-		msm_ram: msmram@c000000 {
+		msm_ram: sram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x200000>;
 			ranges = <0x0 0x0c000000 0x200000>;
-- 
2.17.1
