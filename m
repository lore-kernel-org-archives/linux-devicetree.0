From: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH] keystone: dts: add psci command definition
Date: Wed, 1 Jul 2015 08:13:04 -0400
Message-ID: <1435752784-30639-2-git-send-email-vitalya@ti.com>
References: <1435752784-30639-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435752784-30639-1-git-send-email-vitalya@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ssantosh@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: Vitaly Andrianov <vitalya@ti.com>
List-Id: devicetree@vger.kernel.org

This commit adds definition for cpu_on, cpu_off and cpu_suspend commands.
These definitions must match the corresponding PSCI definitions in
boot monitor.

Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
---
 arch/arm/boot/dts/keystone.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index c06542b..ab60fca 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -58,6 +58,14 @@
 			     <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>;
 	};
 
+	psci {
+		compatible	= "arm,psci";
+		method		= "smc";
+		cpu_suspend	= <0x84000001>;
+		cpu_off		= <0x84000002>;
+		cpu_on		= <0x84000003>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.9.1
