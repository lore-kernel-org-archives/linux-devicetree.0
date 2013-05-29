From: "Christian Daudt" <csd@broadcom.com>
Subject: [PATCH V3 3/3] ARM: mmc: bcm281xx SDHCI driver (dt mods)
Date: Tue, 28 May 2013 18:13:36 -0700
Message-ID: <1369790016-13270-3-git-send-email-csd@broadcom.com>
References: <1369790016-13270-1-git-send-email-csd@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1369790016-13270-1-git-send-email-csd@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Chris Ball <cjb@laptop.org>, Stephen Warren <swarren@nvidia.com>, Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei WANG <wei_wang@realsil.com.cn>, Anton Vorontsov <avorontsov@ru.mvista.com>, Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawn.guo@linaro.org>, Bill Pemberton <wfp5p@virginia.edu>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Viresh Kumar <viresh.kumar@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jerry Huang <Chang-Ming.Huang@freescale.com>, Kevin Liu <kliu5@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ludovic Desroches <ludovic.desroches@atmel.com>, Arnd Bergmann <arnd@arndb.de>, matt.porter@linaro.org
Cc: csd_b@daudt.org, Christian Daudt <csd@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add SDHCI bindings for the Broadcom 281xx SoCs.

Changes from V2:
 - Documentation cleanups

Changes from V1:
 - split original patch into 2, one for driver and this one for dt

Signed-off-by: Christian Daudt <csd@broadcom.com>

diff --git a/Documentation/devicetree/bindings/mmc/bcm,kona-sdhci.txt b/Documentation/devicetree/bindings/mmc/bcm,kona-sdhci.txt
new file mode 100644
index 0000000..094ae01
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/bcm,kona-sdhci.txt
@@ -0,0 +1,16 @@
+Broadcom BCM281xx SDHCI
+
+This file documents differences between the core properties in mmc.txt
+and the properties present in the bcm281xx SDHCI
+
+Required properties:
+- compatible : Should be "bcm,kona-sdhci"
+
+Example:
+
+sdio2: sdio@0x3f1a0000 {
+	compatible = "bcm,kona-sdhci";
+	reg = <0x3f1a0000 0x10000>;
+	interrupts = <0x0 74 0x4>;
+};
+
diff --git a/arch/arm/boot/dts/bcm11351-brt.dts b/arch/arm/boot/dts/bcm11351-brt.dts
index 248067c..9ae3404 100644
--- a/arch/arm/boot/dts/bcm11351-brt.dts
+++ b/arch/arm/boot/dts/bcm11351-brt.dts
@@ -27,4 +27,21 @@
 		status = "okay";
 	};
 
+	sdio0: sdio@0x3f180000 {
+		max-frequency = <48000000>;
+		status = "okay";
+	};
+
+	sdio1: sdio@0x3f190000 {
+		non-removable;
+		max-frequency = <48000000>;
+		status = "okay";
+	};
+
+	sdio3: sdio@0x3f1b0000 {
+		max-frequency = <48000000>;
+		status = "okay";
+	};
+
+
 };
diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index 41b2c6c..39de6e2 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -60,4 +60,32 @@
 		clock-frequency = <32768>;
 	};
 
+	sdio0: sdio@0x3f180000 {
+		compatible = "bcm,kona-sdhci";
+		reg = <0x3f180000 0x10000>;
+		interrupts = <0x0 77 0x4>;
+		status = "disabled";
+	};
+
+	sdio1: sdio@0x3f190000 {
+		compatible = "bcm,kona-sdhci";
+		reg = <0x3f190000 0x10000>;
+		interrupts = <0x0 76 0x4>;
+		status = "disabled";
+	};
+
+	sdio2: sdio@0x3f1a0000 {
+		compatible = "bcm,kona-sdhci";
+		reg = <0x3f1a0000 0x10000>;
+		interrupts = <0x0 74 0x4>;
+		status = "disabled";
+	};
+
+	sdio3: sdio@0x3f1b0000 {
+		compatible = "bcm,kona-sdhci";
+		reg = <0x3f1b0000 0x10000>;
+		interrupts = <0x0 73 0x4>;
+		status = "disabled";
+	};
+
 };
-- 
1.7.10.4
