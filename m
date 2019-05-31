From: Suman Anna <s-anna@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e-main: Add Main NavSS Interrupt
 controller node
Date: Thu, 30 May 2019 19:48:48 -0500
Message-ID: <20190531004848.32061-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the Interrupt controller node for the Interrupt Router present within
the Main NavSS module. This Interrupt Router can route 192 interrupts to
the GIC_SPI in 3 sets of 64 interrupts each. Note that the last set is
reserved for the host ID A72_3 for hypervisor usecases, so the node is
added only with 2 sets for the Linux kernel context (host id A72_2). This
is specified through the ti,sci-rm-range-girq property.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Tero,

This patch depends on the J721E series [1] from Nishanth. Patch tested
using additional patches exercising Mailbox IP.

regards
Suman

[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=121189

 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index d42912044a5d..36c51ff9a898 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -50,6 +50,24 @@
 		#iommu-cells = <1>;
 	};
 
+	cbass_main_navss: interconnect0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		main_navss_intr: interrupt-controller1 {
+			compatible = "ti,sci-intr";
+			ti,intr-trigger-type = <4>;
+			interrupt-controller;
+			interrupt-parent = <&gic500>;
+			#interrupt-cells = <2>;
+			ti,sci = <&dmsc>;
+			ti,sci-dst-id = <14>;
+			ti,sci-rm-range-girq = <0>, <2>;
+		};
+	};
+
 	secure_proxy_main: mailbox@32c00000 {
 		compatible = "ti,am654-secure-proxy";
 		#mbox-cells = <1>;
-- 
2.21.0
