From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 08/10] ARM: dts: tegra: Rename "iram" node to "sram"
Date: Wed,  2 Oct 2019 18:43:14 +0200
Message-ID: <20191002164316.14905-8-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.orgli
List-Id: devicetree@vger.kernel.org

The device node name should reflect generic class of a device so rename
the "iram" node to "sram".  This will be also in sync with upcoming DT
schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 +-
 arch/arm/boot/dts/tegra30.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8c942e60703e..a7cf42cde13e 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -16,7 +16,7 @@
 		reg = <0 0>;
 	};
 
-	iram@40000000 {
+	sram@40000000 {
 		compatible = "mmio-sram";
 		reg = <0x40000000 0x40000>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index e074258d4518..55860a46f2b4 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -96,7 +96,7 @@
 		};
 	};
 
-	iram@40000000 {
+	sram@40000000 {
 		compatible = "mmio-sram";
 		reg = <0x40000000 0x40000>;
 		#address-cells = <1>;
-- 
2.17.1
