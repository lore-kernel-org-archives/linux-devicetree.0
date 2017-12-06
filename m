From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] ARM: dts: colibri/apalis: use correct compatible for RTC
Date: Wed,  6 Dec 2017 11:29:29 +0100
Message-ID: <20171206102929.4755-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, Sanchayan Maity <maitysanchayan@gmail.com>, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

All Toradex Carrier Boards use a st,m41t0 compatible RTC. Compared
to a st,m41t00 this RTC has also an oscillator fail bit which allows
to detect when the RTC lost track of time.

Cc: Sanchayan Maity <maitysanchayan@gmail.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts  | 2 +-
 arch/arm/boot/dts/imx6q-apalis-eval.dts       | 2 +-
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts | 2 +-
 arch/arm/boot/dts/imx6q-apalis-ixora.dts      | 2 +-
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi   | 2 +-
 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
index 5705ebee0595..dcf9206f3e0d 100644
--- a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
@@ -163,7 +163,7 @@
 
 	/* M41T0M6 real time clock on carrier board */
 	rtc_i2c: rtc@68 {
-		compatible = "st,m41t00";
+		compatible = "st,m41t0";
 		reg = <0x68>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6q-apalis-eval.dts b/arch/arm/boot/dts/imx6q-apalis-eval.dts
index 8b56656e53da..aa0e631f3c0a 100644
--- a/arch/arm/boot/dts/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-eval.dts
@@ -158,7 +158,7 @@
 
 	/* M41T0M6 real time clock on carrier board */
 	rtc_i2c: rtc@68 {
-		compatible = "st,m41t00";
+		compatible = "st,m41t0";
 		reg = <0x68>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
index 27dc0fc686a9..e8dccf552122 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
@@ -170,7 +170,7 @@
 
 	/* M41T0M6 real time clock on carrier board */
 	rtc_i2c: rtc@68 {
-		compatible = "st,m41t00";
+		compatible = "st,m41t0";
 		reg = <0x68>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
index 40b2c67fe7af..6831dfd24cc1 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -174,7 +174,7 @@
 
 	/* M41T0M6 real time clock on carrier board */
 	rtc_i2c: rtc@68 {
-		compatible = "st,m41t00";
+		compatible = "st,m41t0";
 		reg = <0x68>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
index 3d6c282dd258..3cf9b077d4f3 100644
--- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
@@ -133,7 +133,7 @@
 
 	/* M41T0M6 real time clock on carrier board */
 	rtc: m41t0m6@68 {
-		compatible = "st,m41t00";
+		compatible = "st,m41t0";
 		reg = <0x68>;
 	};
 };
diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
index 091b738041a0..d8b2972527eb 100644
--- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
@@ -140,7 +140,7 @@
 
 	/* M41T0M6 real time clock on carrier board */
 	rtc: m41t0m6@68 {
-		compatible = "st,m41t00";
+		compatible = "st,m41t0";
 		reg = <0x68>;
 	};
 };
-- 
2.15.1
