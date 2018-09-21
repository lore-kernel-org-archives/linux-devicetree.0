From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RFC PATCH 37/40] arm64: dts: k3-am6: Add Main System Control Module node
Date: Fri, 21 Sep 2018 15:51:52 +0530
Message-ID: <20180921102155.22839-38-kishon@ti.com>
References: <20180921102155.22839-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102155.22839-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Gustavo.Pimentel@synopsys.com
Cc: Mark Rutland <mark.rutland@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

Main System control module support is added to the device tree to allow
driver to access to their control module registers.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 2df4acb198bd..957c9125a453 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -6,6 +6,11 @@
  */
 
 &cbass_main {
+	scm_conf: scm_conf@100000 {
+		compatible = "syscon";
+		reg = <0 0x00100000 0 0x1c000>;
+	};
+
 	gic500: interrupt-controller@1800000 {
 		compatible = "arm,gic-v3";
 		#address-cells = <2>;
-- 
2.17.1
