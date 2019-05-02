From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am654: Add interrupt controllers in
 main domain
Date: Thu, 2 May 2019 15:11:18 +0530
Message-ID: <20190502094119.16350-3-lokeshvutla@ti.com>
References: <20190502094119.16350-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190502094119.16350-1-lokeshvutla@ti.com>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Main domain in AM654 has the following interrupt controller instances:
- Main Domain GPIO Interrupt router connected to gpio in main domain.
- Under the Main Domain Navigator Subsystem(NAVSS)
    - Main Navss Interrupt Router connected to main navss inta and mailboxes.
    - Main Navss Interrupt Aggregator connected to main domain UDMASS

Add DT nodes for the above three interrupt controllers available
in main domain.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 752455269fab..22154f401930 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -309,4 +309,45 @@
 		clock-names = "wkupclk", "refclk";
 		#phy-cells = <0>;
 	};
+
+	intr_main_gpio: interrupt-controller0 {
+		compatible = "ti,sci-intr";
+		ti,intr-trigger-type = <1>;
+		interrupt-controller;
+		interrupt-parent = <&gic500>;
+		#interrupt-cells = <2>;
+		ti,sci = <&dmsc>;
+		ti,sci-dst-id = <56>;
+		ti,sci-rm-range-girq = <0x1>;
+	};
+
+	cbass_main_navss: interconnect0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		intr_main_navss: interrupt-controller1 {
+			compatible = "ti,sci-intr";
+			ti,intr-trigger-type = <4>;
+			interrupt-controller;
+			interrupt-parent = <&gic500>;
+			#interrupt-cells = <2>;
+			ti,sci = <&dmsc>;
+			ti,sci-dst-id = <56>;
+			ti,sci-rm-range-girq = <0x0>, <0x2>;
+		};
+
+		inta_main_udmass: interrupt-controller@33d00000 {
+			compatible = "ti,sci-inta";
+			reg = <0x0 0x33d00000 0x0 0x100000>;
+			interrupt-controller;
+			interrupt-parent = <&intr_main_navss>;
+			msi-controller;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <179>;
+			ti,sci-rm-range-vint = <0x0>;
+			ti,sci-rm-range-global-event = <0x1>;
+		};
+	};
 };
-- 
2.21.0
