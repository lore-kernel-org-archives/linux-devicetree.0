From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 06/10] ARM: dts: imx6ul: segin: Only enable NAND if it is
 populated
Date: Tue, 9 Jul 2019 09:19:23 +0200
Message-ID: <1562656767-273566-7-git-send-email-s.riedmueller@phytec.de>
References: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The phyCORE-i.MX 6UL/ULL now comes either with NAND flash or eMMC. We
have to configure the populated memory type in the device tree files. So
the GPMI node gets disabled by default and only enabled if populated.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi      | 2 +-
 arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
index fee7a7e938ee..de6ffbb0183c 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
@@ -65,7 +65,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
-	status = "okay";
+	status = "disabled";
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
index 81a82dd65019..c6ef13685a7c 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
@@ -50,6 +50,10 @@
 	status = "okay";
 };
 
+&gpmi {
+	status = "okay";
+};
+
 &i2c_rtc {
 	status = "okay";
 };
-- 
2.7.4
