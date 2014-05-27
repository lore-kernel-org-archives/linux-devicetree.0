From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC PATCH] mfd: syscon: add child device support
Date: Tue, 27 May 2014 15:55:17 +0200
Message-ID: <1401198917-16077-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For devices which have a complete register for themselves, it is possible to
place them next to the syscon device with overlapping reg ranges. The same is
not possible for devices which only occupy bitfields in registers shared with
other users.
For devices that are completely controlled by bitfields in the syscon address
range, such as multiplexers or voltage regulators, allow to put child devices
into the syscon device node.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/syscon.txt | 11 +++++++++++
 drivers/mfd/syscon.c                             |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index fe8150b..a7e11d5 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -9,10 +9,21 @@ using a specific compatible value), interrogate the node (or associated
 OS driver) to determine the location of the registers, and access the
 registers directly.
 
+Optionally, devices that are only controlled through single syscon
+registers or bitfields can also be added as child nodes to the syscon
+device node. These devices can implicitly assume their parent node
+as syscon provider without referencing it explicitly via phandle.
+In this case, the syscon node should have #address-cells = <1> and
+#size-cells = <0> and no ranges property.
+
 Required properties:
 - compatible: Should contain "syscon".
 - reg: the register region can be accessed from syscon
 
+Optional properties:
+- #address-cells: Should be 1.
+- #size-cells: Should be 0.
+
 Examples:
 gpr: iomuxc-gpr@020e0000 {
 	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index dbea55d..1dde475 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -147,6 +147,8 @@ static int syscon_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "regmap %pR registered\n", res);
 
+	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+
 	return 0;
 }
 
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
