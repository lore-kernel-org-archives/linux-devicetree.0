From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] arm64: dts: renesas: v3hsk: add GEther support
Date: Fri, 18 May 2018 22:46:19 +0300
Message-ID: <7a853b57-747e-7536-89fe-2e0c847f58f4@cogentembedded.com>
References: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the V3H Starter Kit board dependent part of the GEther device node.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -15,6 +15,7 @@
 
 	aliases {
 		serial0 = &scif0;
+		ethernet0 = &gether;
 	};
 
 	chosen {
@@ -36,7 +37,27 @@
 	clock-frequency = <32768>;
 };
 
+&gether {
+	pinctrl-0 = <&gether_pins>;
+	pinctrl-names = "default";
+
+	phy-mode = "rgmii";
+	phy-handle = <&phy0>;
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
 &pfc {
+	gether_pins: gether {
+		groups = "gether_mdio_a", "gether_rgmii",
+			 "gether_txcrefclk", "gether_txcrefclk_mega";
+		function = "gether";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
