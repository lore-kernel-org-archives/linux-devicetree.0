From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 3/7] tegra: fdt: Add extra I2C bindings for
	U-Boot
Date: Thu, 12 Jan 2012 11:00:14 -0800
Message-ID: <1326394818-32227-4-git-send-email-sjg@chromium.org>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326394818-32227-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add U-Boot's peripheral clock information to the Tegra20 device tree file.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v2:
- Adjust definitions to fit new peripheral clock bindings
- Change 'speed' to 'clock-frequency'
- Remove u-boot,pinmux binding (sadly)

 arch/arm/dts/tegra20.dtsi |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index ca7b523..963cf27 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -45,6 +45,8 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C000 0x100>;
 		interrupts = < 70 >;
+		clock-frequency = <100000>;
+		clocks = <&periph_clk 12>;	// PERIPH_ID_I2C1
 	};
 
 	i2c@7000c400 {
@@ -53,6 +55,8 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C400 0x100>;
 		interrupts = < 116 >;
+		clock-frequency = <100000>;
+		clocks = <&periph_clk 54>;	// PERIPH_ID_I2C2
 	};
 
 	i2c@7000c500 {
@@ -61,14 +65,18 @@
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000C500 0x100>;
 		interrupts = < 124 >;
+		clock-frequency = <100000>;
+		clocks = <&periph_clk 67>;	// PERIPH_ID_I2C3
 	};
 
 	i2c@7000d000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "nvidia,tegra20-i2c";
+		compatible = "nvidia,tegra20-i2c-dvc";
 		reg = <0x7000D000 0x200>;
 		interrupts = < 85 >;
+		clock-frequency = <100000>;
+		clocks = <&periph_clk 47>;	// PERIPH_ID_DVC_I2C
 	};
 
 	i2s@70002800 {
-- 
1.7.7.3
