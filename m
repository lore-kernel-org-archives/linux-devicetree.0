From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2 2/2] arm64: dts: apm: Remove leading '0x' from unit
 addresses
Date: Tue, 14 Jun 2016 08:00:30 -0500
Message-ID: <20160614130030.22169.93519.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160614125756.22169.50783.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160614125756.22169.50783.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Duc Dang <dhdang@apm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Unit addresses should not have a leading '0x'.  Remove them.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi |   32 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index 9773687..e5ced2a 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -109,82 +109,82 @@
 		      <0x0 0x780a0000 0x0 0x20000>,	/* GIC CPU */
 		      <0x0 0x780c0000 0x0 0x10000>,	/* GIC VCPU Control */
 		      <0x0 0x780e0000 0x0 0x20000>;	/* GIC VCPU */
-		v2m0: v2m@0x00000 {
+		v2m0: v2m@00000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x0 0x0 0x1000>;
 		};
-		v2m1: v2m@0x10000 {
+		v2m1: v2m@10000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x10000 0x0 0x1000>;
 		};
-		v2m2: v2m@0x20000 {
+		v2m2: v2m@20000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x20000 0x0 0x1000>;
 		};
-		v2m3: v2m@0x30000 {
+		v2m3: v2m@30000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x30000 0x0 0x1000>;
 		};
-		v2m4: v2m@0x40000 {
+		v2m4: v2m@40000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x40000 0x0 0x1000>;
 		};
-		v2m5: v2m@0x50000 {
+		v2m5: v2m@50000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x50000 0x0 0x1000>;
 		};
-		v2m6: v2m@0x60000 {
+		v2m6: v2m@60000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x60000 0x0 0x1000>;
 		};
-		v2m7: v2m@0x70000 {
+		v2m7: v2m@70000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x70000 0x0 0x1000>;
 		};
-		v2m8: v2m@0x80000 {
+		v2m8: v2m@80000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x80000 0x0 0x1000>;
 		};
-		v2m9: v2m@0x90000 {
+		v2m9: v2m@90000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0x90000 0x0 0x1000>;
 		};
-		v2m10: v2m@0xa0000 {
+		v2m10: v2m@a0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0xa0000 0x0 0x1000>;
 		};
-		v2m11: v2m@0xb0000 {
+		v2m11: v2m@b0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0xb0000 0x0 0x1000>;
 		};
-		v2m12: v2m@0xc0000 {
+		v2m12: v2m@c0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0xc0000 0x0 0x1000>;
 		};
-		v2m13: v2m@0xd0000 {
+		v2m13: v2m@d0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0xd0000 0x0 0x1000>;
 		};
-		v2m14: v2m@0xe0000 {
+		v2m14: v2m@e0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0xe0000 0x0 0x1000>;
 		};
-		v2m15: v2m@0xf0000 {
+		v2m15: v2m@f0000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
 			reg = <0x0 0xf0000 0x0 0x1000>;
