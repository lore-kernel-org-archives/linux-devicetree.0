From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/5] MIPS: dts: lantiq: danube: mark the ebu0 node as interrupt-controller
Date: Sat, 27 Jul 2019 19:53:14 +0200
Message-ID: <20190727175315.28834-5-martin.blumenstingl@googlemail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, john@phrozen.org, hauke@hauke-m.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The EBU IP block provides one interrupt line for PCI_INTA. Mark the ebu0
node as interrupt-controller and pass the parent interrupt from ICU so
the PCI_INTA interrupt from EBU can be used.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/mips/boot/dts/lantiq/danube.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
index 510be63c8bdf..0208174b53c8 100644
--- a/arch/mips/boot/dts/lantiq/danube.dtsi
+++ b/arch/mips/boot/dts/lantiq/danube.dtsi
@@ -89,6 +89,9 @@
 		ebu0: ebu@e105300 {
 			compatible = "lantiq,ebu-xway";
 			reg = <0xe105300 0x100>;
+			interrupt-parent = <&icu0>;
+			interrupts = <30>;
+			#interrupt-cells = <2>;
 		};
 
 		pci0: pci@e105400 {
-- 
2.22.0
