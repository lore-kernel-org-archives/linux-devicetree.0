From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/4] ARM: dts: keystone-k2g: Add ti-sci clock provider node
Date: Mon, 17 Jul 2017 22:28:43 -0500
Message-ID: <20170718032844.29490-4-s-anna@ti.com>
References: <20170718032844.29490-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718032844.29490-1-s-anna@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Franklin S Cooper Jr <fcooper@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>, "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add a ti-sci node representing the clock provider in the system.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 7ffd7facdc47..2cdc7c8aeb5c 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -157,6 +157,11 @@
 				compatible = "ti,sci-pm-domain";
 				#power-domain-cells = <1>;
 			};
+
+			k2g_clks: clocks {
+				compatible = "ti,k2g-sci-clk";
+				#clock-cells = <2>;
+			};
 		};
 	};
 };
-- 
2.13.1
