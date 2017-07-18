From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/4] ARM: dts: keystone-k2g: Add PMMC node to support TI-SCI protocol
Date: Mon, 17 Jul 2017 22:28:41 -0500
Message-ID: <20170718032844.29490-2-s-anna@ti.com>
References: <20170718032844.29490-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718032844.29490-1-s-anna@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Franklin S Cooper Jr <fcooper@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>, "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

From: Nishanth Menon <nm@ti.com>

Texas Instrument's System Control Interface (TI-SCI) Message Protocol
is implemented in Keystone 2 generation 66AK2G SoC with the PMMC entity.

Add the ti-sci node representing this 66AK2G PMMC module.

Signed-off-by: Nishanth Menon <nm@ti.com>
[s-anna@ti.com: add unit address to DT node]
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index a789f75a1ed5..7f0f4180b373 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -139,5 +139,19 @@
 			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		pmmc: pmmc@02921c00 {
+			compatible = "ti,k2g-sci";
+			/*
+			 * In case of rare platforms that does not use k2g as
+			 * system master, use /delete-property/
+			 */
+			ti,system-reboot-controller;
+			mbox-names = "rx", "tx";
+			mboxes= <&msgmgr 5 2>,
+				<&msgmgr 0 0>;
+			reg-names = "debug_messages";
+			reg = <0x02921c00 0x400>;
+		};
 	};
 };
-- 
2.13.1
