From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [RESEND][PATCH v3 1/9] ARM: dts: imx6dql-nitrogen6x: add touchscreen
 support
Date: Wed, 30 Sep 2015 15:46:38 +0200
Message-ID: <1443620806-14792-2-git-send-email-gary.bisson@boundarydevices.com>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
 <1443620806-14792-1-git-send-email-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1443620806-14792-1-git-send-email-gary.bisson@boundarydevices.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: fabio.estevam@freescale.com, linux@arm.linux.org.uk, p.zabel@pengutronix.de, Gary Bisson <gary.bisson@boundarydevices.com>, robh+dt@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the different touchscreens that can be connected using
the displays available for this board.
http://boundarydevices.com/product-category/displays/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index 04278ba..dadc01a 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -247,6 +247,21 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
+
+	touchscreen@04 {
+		compatible = "eeti,egalax_ts";
+		reg = <0x04>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	};
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5x06";
+		reg = <0x38>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	};
 };
 
 &iomuxc {
@@ -258,6 +273,7 @@
 			fsl,pins = <
 				/* SGTL5000 sys_mclk */
 				MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x030b0
+				MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0
 			>;
 		};
 
-- 
2.5.3
