From: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v7 1/3] nvmem: dt: document SNVS LPGPR binding
Date: Tue, 20 Jun 2017 09:09:30 +0200
Message-ID: <20170620070932.10353-2-o.rempel@pengutronix.de>
References: <20170620070932.10353-1-o.rempel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620070932.10353-1-o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guy Shapiro <guy.shapiro-2HKgp+mgmS5l57MIdRCFDg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Documentation bindings for the Low Power General Purpose Register
available on i.MX6 SoCs in the Secure Non-Volatile Storage.

Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/nvmem/snvs-lpgpr.txt         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt

diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
new file mode 100644
index 000000000000..20bc49b49799
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
@@ -0,0 +1,20 @@
+Device tree bindings for Low Power General Purpose Register found in i.MX6Q/D
+Secure Non-Volatile Storage.
+
+This DT node should be represented as a sub-node of a "syscon",
+"simple-mfd" node.
+
+Required properties:
+- compatible: should be one of the fallowing variants:
+	"fsl,imx6q-snvs-lpgpr" for Freescale i.MX6Q/D/DL/S
+	"fsl,imx6ul-snvs-lpgpr" for Freescale i.MX6UL
+
+Example:
+snvs: snvs@020cc000 {
+	compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
+	reg = <0x020cc000 0x4000>;
+
+	snvs_lpgpr: snvs-lpgpr {
+		compatible = "fsl,imx6q-snvs-lpgpr";
+	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
