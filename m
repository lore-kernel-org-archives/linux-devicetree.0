From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/4] ARM: dts: keystone-k2g: Add ti-sci power domain node
Date: Mon, 17 Jul 2017 22:28:42 -0500
Message-ID: <20170718032844.29490-3-s-anna@ti.com>
References: <20170718032844.29490-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718032844.29490-1-s-anna@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Franklin S Cooper Jr <fcooper@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>, "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

From: Dave Gerlach <d-gerlach@ti.com>

Add a ti-sci k2g_pds node to act as our generic power domain provider
in the system.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 7f0f4180b373..7ffd7facdc47 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -152,6 +152,11 @@
 				<&msgmgr 0 0>;
 			reg-names = "debug_messages";
 			reg = <0x02921c00 0x400>;
+
+			k2g_pds: power-controller {
+				compatible = "ti,sci-pm-domain";
+				#power-domain-cells = <1>;
+			};
 		};
 	};
 };
-- 
2.13.1
