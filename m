From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 1/3] dt-bindings: power: Add power domain binding for i.mx8m
 family
Date: Wed, 17 Apr 2019 05:27:30 +0000
Message-ID: <20190417053211.2195-2-ping.bai@nxp.com>
References: <20190417053211.2195-1-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190417053211.2195-1-ping.bai@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add the binding doc of power domain for i.MX8M SOC family.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 .../bindings/power/fsl,imx8m-genpd.txt        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt

diff --git a/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt b/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
new file mode 100644
index 000000000000..a92a7103de38
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
@@ -0,0 +1,46 @@
+Device Tree Bindings for Freescale i.MX8M Generic Power Domain
+==============================================================
+The binding for the i.MX8M Generic power Domain[1].
+
+[1] Documentation/devicetree/bindings/power/power_domain.txt
+
+Required properties:
+
+ - compatible: should be of:
+	- "fsl,imx8m-power-domain"
+ - #power-domain-cells: Number of cells in a PM domain Specifier, must be 0
+ - domain-index: should be the domain index number need to pass to TF-A
+ - domain-name: the name of this pm domain
+
+Optional properties:
+ - clocks: a number of phandles to clocks that need to be enabled during
+   domain power-up sequence to ensure reset propagation into devices
+   located inside this power domain
+ - power-supply: Power supply used to power the domain
+ - parent-domains: the phandle to the parent power domain
+
+example:
+	vpu_g1_pd: vpug1-pd {
+		compatible = "fsl,imx8mm-pm-domain";
+		#power-domain-cells = <0>;
+		domain-index = <6>;
+		domain-name = "vpu_g1";
+		parent-domains = <&vpumix_pd>;
+		clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
+	};
+
+
+Specifying Power domain for IP modules
+======================================
+
+IP cores belonging to a power domain should contain a 'power-domains'
+property that is a phandle for PGC node representing the domain.
+
+Example of a device that is part of the vpu_g1 power domain:
+	vpu_g1: vpu_g1@38300000 {
+		/* ... */
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "irq_hantro";
+		/* ... */
+		power-domains = <&vpu_g1_pd>;
+	};
-- 
2.21.0
