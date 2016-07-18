From: Li Jun <jun.li@nxp.com>
Subject: [PATCH 3/4] ARM: dts: imx7d-sdb: Set OTG2 oc polarity to be active low
Date: Mon, 18 Jul 2016 19:15:46 +0800
Message-ID: <1468840547-17899-3-git-send-email-jun.li@nxp.com>
References: <1468840547-17899-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468840547-17899-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: peter.chen@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Set OTG2 over current flag to be active low, OTG1 OC is not used
by default.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index b267f79..44ed399 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -287,7 +287,9 @@
 
 &usbotg2 {
 	vbus-supply = <&reg_usb_otg2_vbus>;
+	pinctrl-0 = <&pinctrl_usbotg2>;
 	dr_mode = "host";
+	over-current-polarity = <0>;
 	status = "okay";
 };
 
@@ -415,6 +417,12 @@
 			>;
 		};
 
+		pinctrl_usbotg2: usbotg2grp {
+			fsl,pins = <
+				MX7D_PAD_GPIO1_IO06__USB_OTG2_OC	0x59
+			>;
+		};
+
 		pinctrl_usdhc1: usdhc1grp {
 			fsl,pins = <
 				MX7D_PAD_SD1_CMD__SD1_CMD		0x59
-- 
1.9.1
