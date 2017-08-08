From: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 1/2] remoteproc: dt: Provide bindings for iMX6SX/7D Remote Processor Controller driver
Date: Tue,  8 Aug 2017 10:00:29 +0200
Message-ID: <20170808080030.2581-2-o.rempel@pengutronix.de>
References: <20170808080030.2581-1-o.rempel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170808080030.2581-1-o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/remoteproc/imx-rproc.txt   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
new file mode 100644
index 000000000000..faf30ef3d6cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
@@ -0,0 +1,33 @@
+NXP iMX6SX/iMX7D Co-Processor Bindings
+----------------------------------------
+
+This binding provides support for ARM Cortex M4 Co-processor found on some
+NXP iMX SoCs.
+
+Required properties:
+- compatible		Should be one of:
+				"fsl,imx7d-rproc"
+				"fsl,imx6sx-rproc"
+- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
+- syscon		Phandle to syscon block which provide access to
+			System Reset Controller
+
+Optional properties:
+- memory-region		list of phandels to the reserved memory regions.
+			(See: ../reserved-memory/reserved-memory.txt)
+
+Example:
+	m4_reserved_sysmem1: rproc@80000000 {
+		reg = <0x80000000 0x80000>;
+	};
+
+	m4_reserved_sysmem2: rproc@81000000 {
+		reg = <0x81000000 0x80000>;
+	};
+
+	imx7d-rproc {
+		compatible	= "fsl,imx7d-rproc";
+		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+		syscon		= <&src>;
+		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
+	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
