From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RFC PATCH 38/40] arm64: dts: k3-am6: Add mux-controller dt node required for muxing SERDES
Date: Fri, 21 Sep 2018 15:51:53 +0530
Message-ID: <20180921102155.22839-39-kishon@ti.com>
References: <20180921102155.22839-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102155.22839-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Gustavo.Pimentel@synopsys.com
Cc: Mark Rutland <mark.rutland@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add mux-controller dt node as a child node of scm_conf. This is
required for muxing SERDES between USB, PCIe and ICSS2 SGMII. While
at that also add "simple-mfd" compatible string to scm_conf dt node
so that mux-controller device gets created.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 957c9125a453..4379c370f6f8 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -7,8 +7,15 @@
 
 &cbass_main {
 	scm_conf: scm_conf@100000 {
-		compatible = "syscon";
+		compatible = "syscon", "simple-mfd";
 		reg = <0 0x00100000 0 0x1c000>;
+
+		serdes_mux: mux-controller {
+			compatible = "mmio-mux";
+			#mux-control-cells = <1>;
+			mux-reg-masks = <0x4080 0x3>, /* SERDES0 lane select */
+					<0x4090 0x3>; /* SERDES1 lane select */
+		};
 	};
 
 	gic500: interrupt-controller@1800000 {
-- 
2.17.1
