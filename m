From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j721e: Add interrupt controllers in
 main domain
Date: Fri, 14 Jun 2019 20:20:00 +0530
Message-ID: <20190614145001.9598-2-lokeshvutla@ti.com>
References: <20190614145001.9598-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190614145001.9598-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Main domain in J721E has the following interrupt controller instances:
- Main Domain GPIO Interrupt router connected to gpio in main domain.
- Under the Main Domain Navigator Subsystem(NAVSS)
	- Main Navss Interrupt Router connected to main navss inta and mailboxes.
	- Main Navss Interrupt Aggregator connected to main domain UDMASS

Add DT nodes for the interrupt controllers available in main domain.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 36c51ff9a898..a01308142f77 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -50,6 +50,17 @@
 		#iommu-cells = <1>;
 	};
 
+	main_gpio_intr: interrupt-controller0 {
+		compatible = "ti,sci-intr";
+		ti,intr-trigger-type = <1>;
+		interrupt-controller;
+		interrupt-parent = <&gic500>;
+		#interrupt-cells = <2>;
+		ti,sci = <&dmsc>;
+		ti,sci-dst-id = <14>;
+		ti,sci-rm-range-girq = <0x1>;
+	};
+
 	cbass_main_navss: interconnect0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -66,6 +77,18 @@
 			ti,sci-dst-id = <14>;
 			ti,sci-rm-range-girq = <0>, <2>;
 		};
+
+		main_udmass_inta: interrupt-controller@33d00000 {
+			compatible = "ti,sci-inta";
+			reg = <0x0 0x33d00000 0x0 0x100000>;
+			interrupt-controller;
+			interrupt-parent = <&main_navss_intr>;
+			msi-controller;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <209>;
+			ti,sci-rm-range-vint = <0xa>;
+			ti,sci-rm-range-global-event = <0xd>;
+		};
 	};
 
 	secure_proxy_main: mailbox@32c00000 {
-- 
2.21.0
