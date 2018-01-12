From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] ARM: dts: Fix missing "device_type" in Aspeed memory nodes
Date: Fri, 12 Jan 2018 15:56:11 +1100
Message-ID: <1515732971.31850.87.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Joel Stanley <joel.stanley@au1.ibm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

When Joel removed skeleton.dtsi, the Aspeed boards lost their
"device_type" property in the memory node. Since a number of
these still use old bootloaders that won't patch it properly,
booting breaks as a result.

This adds the property back to the individual nodes.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---

Should we just have a skeleton in the g4 and g5 dtsi with just
that property instead ?
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 1 +
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts     | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index ede11c597673..0c3f14d05046 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -17,6 +17,7 @@
 	};
 
 	memory@80000000 {
+		device_type = "memory";
 		reg = <0x80000000 0x20000000>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 4379d09a261f..9d18cce971be 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -13,6 +13,7 @@
 	};
 
 	memory@40000000 {
+		device_type = "memory";
 		reg = <0x40000000 0x20000000>;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 623b6ab42021..cd06d5738782 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -13,6 +13,7 @@
 	};
 
 	memory@80000000 {
+		device_type = "memory";
 		reg = <0x80000000 0x20000000>;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 5f9049d2c4c3..b64553a083b0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -14,6 +14,7 @@
 	};
 
 	memory@80000000 {
+		device_type = "memory";
 		reg = <0x80000000 0x20000000>;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index c881484a85cf..f3f5b3279e52 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -13,6 +13,7 @@
 	};
 
 	memory@80000000 {
+		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 76aa6ea1f988..ca7a4ae9ed08 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -13,6 +13,7 @@
 	};
 
 	memory@40000000 {
+		device_type = "memory";
 		reg = <0x40000000 0x8000000>;
 	};
