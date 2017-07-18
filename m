From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 4/4] ARM: dts: keystone-k2g: Add TI SCI reset-controller node
Date: Mon, 17 Jul 2017 22:28:44 -0500
Message-ID: <20170718032844.29490-5-s-anna@ti.com>
References: <20170718032844.29490-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170718032844.29490-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Franklin S Cooper Jr <fcooper@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Andrew F. Davis" <afd@ti.com>

Add a reset-controller node for managing resets of various
remote processor devices on the SoC over the Texas Instrument's
System Control Interface (TI SCI) protocol.

Signed-off-by: Andrew F. Davis <afd@ti.com>
[s-anna@ti.com: rename node name, drop obsolete header]
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 2cdc7c8aeb5c..bf4d1fa30840 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -162,6 +162,11 @@
 				compatible = "ti,k2g-sci-clk";
 				#clock-cells = <2>;
 			};
+
+			k2g_reset: reset-controller {
+				compatible = "ti,sci-reset";
+				#reset-cells = <2>;
+			};
 		};
 	};
 };
-- 
2.13.1
