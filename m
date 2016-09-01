From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/5] ARM: dts: keystone-k2hk: Add MSM RAM node
Date: Thu, 1 Sep 2016 17:58:42 -0500
Message-ID: <20160901225846.31058-2-s-anna@ti.com>
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
as a mmio-sram node. The Keystone 2 Hawking SoC has 6 MB of such
memory. Any specific MSM memory range needed by a software module
ought to be reserved using an appropriate child node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/keystone-k2hk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2hk.dtsi b/arch/arm/boot/dts/keystone-k2hk.dtsi
index 8f67fa8df936..39e88d815235 100644
--- a/arch/arm/boot/dts/keystone-k2hk.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk.dtsi
@@ -46,6 +46,14 @@
 	soc {
 		/include/ "keystone-k2hk-clocks.dtsi"
 
+		msm_ram: msmram@0c000000 {
+			compatible = "mmio-sram";
+			reg = <0x0c000000 0x600000>;
+			ranges = <0x0 0x0c000000 0x600000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		dspgpio0: keystone_dsp_gpio@02620240 {
 			compatible = "ti,keystone-dsp-gpio";
 			gpio-controller;
-- 
2.9.3
