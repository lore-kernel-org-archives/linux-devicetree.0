From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 10/19] ARM: dts: aspeed: Add LPC Snoop device
Date: Fri, 15 Dec 2017 16:54:34 +1030
Message-ID: <20171215062443.23059-11-joel@jms.id.au>
References: <20171215062443.23059-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215062443.23059-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

LPC snoop hardware on the ASPEED BMC, used for monitoring
host I/O port activity.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index f6fee40c04c0..b3580f37f507 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -236,6 +236,13 @@
 						status = "disabled";
 					};
 
+					lpc_snoop: lpc-snoop@0 {
+						compatible = "aspeed,ast2500-lpc-snoop";
+						reg = <0x0 0x80>;
+						interrupts = <8>;
+						status = "disabled";
+					};
+
 					lhc: lhc@20 {
 						compatible = "aspeed,ast2500-lhc";
 						reg = <0x20 0x24 0x48 0x8>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 96a9d2fe3f0d..50766f0629f8 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -287,6 +287,12 @@
 						status = "disabled";
 					};
 
+					lpc_snoop: lpc-snoop@0 {
+						compatible = "aspeed,ast2500-lpc-snoop";
+						reg = <0x0 0x80>;
+						interrupts = <8>;
+						status = "disabled";
+					};
 
 					lhc: lhc@20 {
 						compatible = "aspeed,ast2500-lhc";
-- 
2.14.1
