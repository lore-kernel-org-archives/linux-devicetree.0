From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH] MIPS: dts: Boston: Fix PCI bus dtc warnings:
Date: Fri, 13 Apr 2018 09:50:44 +0100
Message-ID: <1523609444-2496-1-git-send-email-matt.redfearn@mips.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Rob Herring <robh@kernel.org>, Matt Redfearn <matt.redfearn@mips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

dtc recently (v1.4.4-8-g756ffc4f52f6) added PCI bus checks. Fix the
warnings now emitted:

arch/mips/boot/dts/img/boston.dtb: Warning (pci_bridge): /pci@10000000:
missing bus-range for PCI bridge
arch/mips/boot/dts/img/boston.dtb: Warning (pci_bridge): /pci@12000000:
missing bus-range for PCI bridge
arch/mips/boot/dts/img/boston.dtb: Warning (pci_bridge): /pci@14000000:
missing bus-range for PCI bridge

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/boot/dts/img/boston.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 2cd49b60e030..f7aad80c69ab 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -51,6 +51,8 @@
 		ranges = <0x02000000 0 0x40000000
 			  0x40000000 0 0x40000000>;
 
+		bus-range = <0x00 0xff>;
+
 		interrupt-map-mask = <0 0 0 7>;
 		interrupt-map = <0 0 0 1 &pci0_intc 1>,
 				<0 0 0 2 &pci0_intc 2>,
@@ -79,6 +81,8 @@
 		ranges = <0x02000000 0 0x20000000
 			  0x20000000 0 0x20000000>;
 
+		bus-range = <0x00 0xff>;
+
 		interrupt-map-mask = <0 0 0 7>;
 		interrupt-map = <0 0 0 1 &pci1_intc 1>,
 				<0 0 0 2 &pci1_intc 2>,
@@ -107,6 +111,8 @@
 		ranges = <0x02000000 0 0x16000000
 			  0x16000000 0 0x100000>;
 
+		bus-range = <0x00 0xff>;
+
 		interrupt-map-mask = <0 0 0 7>;
 		interrupt-map = <0 0 0 1 &pci2_intc 1>,
 				<0 0 0 2 &pci2_intc 2>,
-- 
2.7.4
