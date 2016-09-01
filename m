From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/5] ARM: dts: keystone-k2l: Add MSM RAM node
Date: Thu, 1 Sep 2016 17:58:43 -0500
Message-ID: <20160901225846.31058-3-s-anna@ti.com>
References: <20160901225846.31058-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160901225846.31058-1-s-anna@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Vitaly Andrianov <vitalya@ti.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

Add the RAM managed by the Multicore Shared Memory Controller (MSMC)
as a mmio-sram node. The Keystone 2 Lamarr SoC has 2 MB of such
memory. Any specific MSM memory range needed by a software module
ought to be reserved using an appropriate child node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/keystone-k2l.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2l.dtsi b/arch/arm/boot/dts/keystone-k2l.dtsi
index 2ee3d0ac2816..b2994c9ded43 100644
--- a/arch/arm/boot/dts/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l.dtsi
@@ -34,6 +34,14 @@
 	soc {
 		/include/ "keystone-k2l-clocks.dtsi"
 
+		msm_ram: msmram@0c000000 {
+			compatible = "mmio-sram";
+			reg = <0x0c000000 0x200000>;
+			ranges = <0x0 0x0c000000 0x200000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		uart2: serial@02348400 {
 			compatible = "ns16550a";
 			current-speed = <115200>;
-- 
2.9.3
