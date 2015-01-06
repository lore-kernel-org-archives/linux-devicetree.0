From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3] mfd: syscon: add child device support
Date: Tue,  6 Jan 2015 16:54:34 +0100
Message-ID: <1420559674-9772-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For devices which have a complete register for themselves, it is possible to
place them next to the syscon device with overlapping reg ranges. The same is
not possible for devices which only occupy bitfields in registers shared with
other users.
For devices that are completely controlled by bitfields in the syscon address
range, such as multiplexers or voltage regulators, allow to put child devices
into the syscon device node.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Tested-by: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
Changes since v2:
 - Added Tested-by: Flora Fu
---
 Documentation/devicetree/bindings/mfd/syscon.txt | 13 +++++++++++++
 drivers/mfd/syscon.c                             |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index fe8150b..0c6b497 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -9,12 +9,25 @@ using a specific compatible value), interrogate the node (or associated
 OS driver) to determine the location of the registers, and access the
 registers directly.
 
+Optionally, devices that are controlled exclusively through syscon registers,
+or even bitfields in shared syscon registers, can also be added as child nodes
+to the syscon device node. These devices can implicitly assume their parent
+node is a syscon provider without referencing it explicitly via phandle.
+In this case, the syscon node should have #address-cells = <1> and
+#size-cells = <0> or <1> and no ranges property.
+
 Required properties:
 - compatible: Should contain "syscon".
 - reg: the register region can be accessed from syscon
 
+Optional properties:
+- #address-cells: Should be 1.
+- #size-cells: Should be 0 or 1.
+
 Examples:
 gpr: iomuxc-gpr@020e0000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
 	reg = <0x020e0000 0x38>;
 };
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 176bf0f..d2280d6 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -208,6 +208,9 @@ static int syscon_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "regmap %pR registered\n", res);
 
+	if (!of_device_is_compatible(pdev->dev.of_node, "simple-bus"))
+		of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+
 	return 0;
 }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
