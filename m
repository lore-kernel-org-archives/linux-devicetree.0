From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH v5 06/20] ARM: dts: imx: Add generic compatible string for I2C
 EEPROM
Date: Tue, 23 May 2017 15:34:34 +0200
Message-ID: <20170523133448.4794-7-javier@dowhile0.org>
References: <20170523133448.4794-1-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170523133448.4794-1-javier@dowhile0.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Javier Martinez Canillas <javier@dowhile0.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>

---

Changes in v5: None
Changes in v4:
- Only use the atmel manufacturer in the compatible string instead of
  keeping the deprecated ones (Rob Herring).

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi | 2 +-
 arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi   | 2 +-
 arch/arm/boot/dts/imx28-evk.dts                   | 2 +-
 arch/arm/boot/dts/imx53-tqma53.dtsi               | 2 +-
 arch/arm/boot/dts/imx6q-cm-fx6.dts                | 2 +-
 arch/arm/boot/dts/imx6q-utilite-pro.dts           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
index 4f3e0f473581..0b8490b21a38 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
+++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
@@ -40,7 +40,7 @@
 	status = "okay";
 
 	at24@52 {
-		compatible = "at,24c32";
+		compatible = "atmel,24c32";
 		pagesize = <32>;
 		reg = <0x52>;
 	};
diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
index 82fec935ce83..c973c5d91875 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
@@ -193,7 +193,7 @@
 	status = "okay";
 
 	at24@52 {
-		compatible = "at,24c32";
+		compatible = "atmel,24c32";
 		pagesize = <32>;
 		reg = <0x52>;
 	};
diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
index a5ba669b4eaa..b88c087f1fea 100644
--- a/arch/arm/boot/dts/imx28-evk.dts
+++ b/arch/arm/boot/dts/imx28-evk.dts
@@ -203,7 +203,7 @@
 				};
 
 				at24@51 {
-					compatible = "at24,24c32";
+					compatible = "atmel,24c32";
 					pagesize = <32>;
 					reg = <0x51>;
 				};
diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
index 85972f2201c2..eecdc1c55eef 100644
--- a/arch/arm/boot/dts/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
@@ -272,7 +272,7 @@
 	};
 
 	eeprom: 24c64@50 {
-		compatible = "at,24c64";
+		compatible = "atmel,24c64";
 		pagesize = <32>;
 		reg = <0x50>;
 	};
diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
index 66cac5328b86..a8af3822d9df 100644
--- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
@@ -215,7 +215,7 @@
 	clock-frequency = <100000>;
 
 	eeprom@50 {
-		compatible = "at24,24c02";
+		compatible = "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
 	};
diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts b/arch/arm/boot/dts/imx6q-utilite-pro.dts
index d900ad6ec5f8..16d5be1aeb3c 100644
--- a/arch/arm/boot/dts/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts
@@ -130,7 +130,7 @@
 			#size-cells = <0>;
 
 			eeprom@50 {
-				compatible = "at24,24c02";
+				compatible = "atmel,24c02";
 				reg = <0x50>;
 				pagesize = <16>;
 			};
-- 
2.9.3
