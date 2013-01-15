From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 2/4] usb: mxs-phy: change clock usage for i.mx6q
Date: Tue, 15 Jan 2013 14:08:35 +0800
Message-ID: <1358230117-19443-2-git-send-email-peter.chen@freescale.com>
References: <1358230117-19443-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358230117-19443-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: marex-ynQEQJNshbs@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

For mxs-phy user i.mx6q, the PHY's clock is controlled by
hardware automatically, the software only needs to enable it
at probe, disable it at remove. But other mxs-phy users need
to control that clock runtime, so we hardcode clk on/off,
and give a reserved bit for clk on/off at clk code for i.mx6q.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes for v2:
- Only control gate bit for phy clk control
- Only open the gate at probe, and close the gate at remove

 Documentation/devicetree/bindings/usb/mxs-phy.txt |    2 +
 arch/arm/boot/dts/imx6q.dtsi                      |    2 +
 drivers/usb/otg/mxs-phy.c                         |   61 +++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
index 5835b27..384e700 100644
--- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
+++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
@@ -4,10 +4,12 @@ Required properties:
 - compatible: Should be "fsl,imx23-usbphy"
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
+- The reg offset for PHY clock at anatop
 
 Example:
 usbphy1: usbphy@020c9000 {
 	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 	reg = <0x020c9000 0x1000>;
 	interrupts = <0 44 0x04>;
+	anatop-phy-reg-offset = <0x10>;
 };
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index d6265ca..1517e93 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -519,6 +519,7 @@
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 0x04>;
 				clocks = <&clks 182>;
+				anatop-phy-reg-offset = <0x10>;
 			};
 
 			usbphy2: usbphy@020ca000 {
@@ -526,6 +527,7 @@
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 0x04>;
 				clocks = <&clks 183>;
+				anatop-phy-reg-offset = <0x20>;
 			};
 
 			snvs@020cc000 {
diff --git a/drivers/usb/otg/mxs-phy.c b/drivers/usb/otg/mxs-phy.c
index 7630272..49727dd 100644
--- a/drivers/usb/otg/mxs-phy.c
+++ b/drivers/usb/otg/mxs-phy.c
@@ -20,6 +20,9 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #define DRIVER_NAME "mxs_phy"
 
@@ -34,6 +37,11 @@
 #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
 #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
 
+#define CTRL_SET				0x4
+#define CTRL_CLR				0x8
+
+#define BM_ANADIG_USB_PLL_480_CTRL_EN_USB_CLKS		(1 << 6)
+
 struct mxs_phy {
 	struct usb_phy phy;
 	struct clk *clk;
@@ -108,6 +116,7 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk *clk;
 	struct mxs_phy *mxs_phy;
+	struct regmap *anatop;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -146,11 +155,63 @@ static int mxs_phy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &mxs_phy->phy);
 
+	/*
+	 * At mx6x, USB PHY PLL and its output gate is controlled by hardware.
+	 * It just needs to open the gate at init, if the usb device is
+	 * in suspend, it will close related PLL automatically without
+	 * the gate is on or off.
+	 */
+
+	anatop = syscon_regmap_lookup_by_compatible("fsl,imx6q-anatop");
+
+	if (!IS_ERR(anatop)) {
+		struct device *dev = &pdev->dev;
+		struct device_node *np = dev->of_node;
+		u32 phy_reg_offset;
+		int ret;
+
+		ret = of_property_read_u32(np, "anatop-phy-reg-offset",
+					   &phy_reg_offset);
+		if (ret) {
+			dev_err(dev, "no anatop-phy-reg-offset property set\n");
+			return -EINVAL;
+		}
+
+		regmap_write(anatop, phy_reg_offset + CTRL_SET,
+				BM_ANADIG_USB_PLL_480_CTRL_EN_USB_CLKS);
+	} else {
+		pr_warn("failed to find fsl,imx6q-anatop regmap\n");
+	}
+
 	return 0;
 }
 
 static int mxs_phy_remove(struct platform_device *pdev)
 {
+	struct regmap *anatop;
+
+	/* close the clock gate for USB PHY */
+	anatop = syscon_regmap_lookup_by_compatible("fsl,imx6q-anatop");
+
+	if (!IS_ERR(anatop)) {
+		struct device *dev = &pdev->dev;
+		struct device_node *np = dev->of_node;
+		u32 phy_reg_offset;
+		int ret;
+
+		ret = of_property_read_u32(np, "anatop-phy-reg-offset",
+					   &phy_reg_offset);
+		if (ret) {
+			dev_err(dev, "no anatop-phy-reg-offset property set\n");
+			return -EINVAL;
+		}
+
+		regmap_write(anatop, phy_reg_offset + CTRL_CLR,
+				BM_ANADIG_USB_PLL_480_CTRL_EN_USB_CLKS);
+	} else {
+		pr_warn("failed to find fsl,imx6q-anatop regmap\n");
+	}
+
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
-- 
1.7.0.4
