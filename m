From: alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org
Subject: [PATCH] i.MX6-SabreAuto: WEIM: add steering-gpios to set WEIM for NOR
Date: Thu, 15 Jan 2015 10:46:11 -0800
Message-ID: <1421347571-9239-2-git-send-email-alison_chaiken@mentor.com>
References: <20150115075646.GM23940@pengutronix.de>
 <1421347571-9239-1-git-send-email-alison_chaiken@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421347571-9239-1-git-send-email-alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

EIM_D18 pin of i.MX6 CPU is connected to the WEIM switch, to which pin
DQ2 of the parallel NOR is also attached.  Use GPIO5, pin 4 to steer
the switch to connect the pin to the parallel NOR at boot.  If the
GPIO is not set LOW, the probe of the NOR fails when cfi_qry_present()
returns "U-V-]" rather than "Q-R-Y" because bit 2 is erroneously high.
Implement control of the GPIO by adding a steering-gpios property to
the nor child node of the WEIM in the SabreAuto device-tree. Also add
a function to the imx-weim probe to set GPIO5 to drive the pad.

Signed-off-by: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/bus/imx-weim.txt | 10 +++++
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |  1 +
 drivers/bus/imx-weim.c                             | 46 ++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/imx-weim.txt b/Documentation/devicetree/bindings/bus/imx-weim.txt
index 6630d84..359fb26 100644
--- a/Documentation/devicetree/bindings/bus/imx-weim.txt
+++ b/Documentation/devicetree/bindings/bus/imx-weim.txt
@@ -59,6 +59,15 @@ Timing property for child nodes. It is mandatory, not optional.
 			there are six registers: CSxGCR1, CSxGCR2, CSxRCR1,
 			CSxRCR2, CSxWCR1, CSxWCR2.
 
+Steering property for child nodes is optional.  Steering is needed if
+the bootloader doesn't set the GPIOs driving the EIM switch to connect
+the WEIM to the CPU rather than to the peripherals with which the WEIM
+has a pin conflict.
+
+ - fsl,steering-gpios:  For i.mx6q-sabreauto, the connectivity of CPU
+			pins EIM_D18 and EIM_D30 can be controlled via
+			GPIOs.
+
 Example for an imx6q-sabreauto board, the NOR flash connected to the WEIM:
 
 	weim: weim@021b8000 {
@@ -76,6 +85,7 @@ Example for an imx6q-sabreauto board, the NOR flash connected to the WEIM:
 			#address-cells = <1>;
 			#size-cells = <1>;
 			bank-width = <2>;
+			fsl,steering-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
 			fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
 					0x0000c000 0x1404a38e 0x00000000>;
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index 009abd6..e1429c5 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -454,5 +454,6 @@
 		bank-width = <2>;
 		fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
 				0x0000c000 0x1404a38e 0x00000000>;
+		fsl,steering-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 0958b69..af3408e 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -14,6 +14,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <linux/regmap.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio.h>
 
 struct imx_weim_devtype {
 	unsigned int	cs_count;
@@ -108,6 +110,43 @@ err:
 	return -EINVAL;
 }
 
+/* set GPIOs to steer EIM CPU PADs to WEIM connection so that
+ * cfi_qry_present() of attached NOR chip works properly */
+static int __init steering_gpio_setup(struct device_node *np,
+				struct device *parent)
+{
+	unsigned steering_gpio, level;
+	enum of_gpio_flags of_flags;
+	int ret;
+
+	steering_gpio = of_get_named_gpio_flags(np, "fsl,steering-gpios",
+						0, &of_flags);
+
+	/* this child requires no pin steering */
+	if (!steering_gpio)
+		return 0;
+
+	if (gpio_is_valid(steering_gpio)) {
+		ret = devm_gpio_request_one(parent, steering_gpio,
+					GPIOF_DIR_OUT, "steering-gpio");
+	} else {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (ret < 0)
+		goto out;
+
+	level = ((of_flags == OF_GPIO_ACTIVE_LOW) ? 0 : 1);
+
+	gpio_set_value(steering_gpio, level);
+
+	return 0;
+out:
+	dev_err(parent, "Unable to request steering GPIO.\n");
+	return ret;
+}
+
 /* Parse and set the timing for this device. */
 static int __init weim_timing_setup(struct device_node *np, void __iomem *base,
 				    const struct imx_weim_devtype *devtype)
@@ -160,6 +199,13 @@ static int __init weim_parse_dt(struct platform_device *pdev,
 				child->full_name);
 			return ret;
 		}
+
+		ret = steering_gpio_setup(child, &pdev->dev);
+		if (ret) {
+			dev_err(&pdev->dev, "%s steering gpios setup failed.\n",
+				child->full_name);
+			return ret;
+		}
 	}
 
 	ret = of_platform_populate(pdev->dev.of_node,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
