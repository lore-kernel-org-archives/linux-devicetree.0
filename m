From: Loc Ho <lho@apm.com>
Subject: [PATCH v6 3/5] Documentation: Add documentation for the APM X-Gene
 SoC EDAC DTS binding
Date: Tue, 17 Mar 2015 00:30:19 -0600
Message-ID: <1426573821-1937-4-git-send-email-lho@apm.com>
References: <1426573821-1937-1-git-send-email-lho@apm.com>
 <1426573821-1937-2-git-send-email-lho@apm.com>
 <1426573821-1937-3-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1426573821-1937-3-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dougthompson@xmission.com, bp@alien8.de, mchehab@osg.samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: devicetree@vger.kernel.org, Feng Kan <fkan@apm.com>, jcm@redhat.com, patches@apm.com, Loc Ho <lho@apm.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the APM X-Gene SoC EDAC DTS binding.

Signed-off-by: Feng Kan <fkan@apm.com>
Signed-off-by: Loc Ho <lho@apm.com>
---
 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   82 ++++++++++++++++++++
 1 files changed, 82 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/edac/apm-xgene-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
new file mode 100644
index 0000000..db8c1c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
@@ -0,0 +1,82 @@
+* APM X-Gene SoC EDAC nodes
+
+EDAC nodes are defined to describe on-chip error detection and correction.
+There are four types of EDAC:
+
+  memory controller	- Memory controller
+  PMD (L1/L2)		- Processor module unit (PMD) L1/L2 cache
+  L3			- CPU L3 cache
+  SoC			- SoC IP such as SATA, Ethernet, and etc
+
+The following section describes the memory controller DT node binding.
+
+Required properties:
+- compatible		: Shall be "apm,xgene-edac-mc".
+- reg			: First resource shall be the PCP resource.
+			  Second resource shall be the CSW resource.
+			  Third resource shall be the MCB-A resource.
+			  Fourth resource shall be the MCB-B resource.
+			  Fifth resource shall be the MCU resource.
+- interrupts            : Interrupt-specifier for MCU error IRQ(s).
+
+The following section describes the L1/L2 DT node binding.
+
+- compatible		: Shall be "apm,xgene-edac-pmd".
+- reg			: First resource shall be the PCP resource.
+			  Second resource shall be the PMD resource.
+			  Third resource shall be the PMD efuse resource.
+- interrupts            : Interrupt-specifier for PMD error IRQ(s).
+
+The following section describes the L3 DT node binding.
+
+- compatible		: Shall be "apm,xgene-edac-l3".
+- reg			: First resource shall be the PCP resource.
+			  Second resource shall be the L3 resource.
+- interrupts            : Interrupt-specifier for L3 error IRQ(s).
+
+The following section describes the SoC DT node binding.
+
+- compatible		: Shall be "apm,xgene-edac-soc"".
+- reg			: First resource shall be the PCP resource.
+			  Second resource shall be the SoC resource.
+			  Third resource shall be the register bus resource.
+- interrupts		: Interrupt-specifier for SoC error IRQ(s).
+
+Example:
+	edacmc0: edacmc0@7e800000 {
+		compatible = "apm,xgene-edac-mc";
+		reg = <0x0 0x78800000 0x0 0x1000>,
+		      <0x0 0x7e200000 0x0 0x1000>,
+		      <0x0 0x7e700000 0x0 0x1000>,
+		      <0x0 0x7e720000 0x0 0x1000>,
+		      <0x0 0x7e800000 0x0 0x1000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>;
+	};
+
+	edacl3: edacl3@7e600000 {
+		compatible = "apm,xgene-edac-l3";
+		reg = <0x0 0x78800000 0x0 0x1000>,
+		      <0x0 0x7e600000 0x0 0x1000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>;
+	};
+
+	edacpmd0: edacpmd0@7c000000 {
+		compatible = "apm,xgene-edac-pmd";
+		reg = <0x0 0x78800000 0x0 0x1000>,
+		      <0x0 0x7c000000 0x0 0x200000>,
+		      <0x0 0x1054a000 0x0 0x10>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>;
+	};
+
+	edacsoc: edacsoc@7e930000 {
+		compatible = "apm,xgene-edac-soc";
+		reg = <0x0 0x78800000 0x0 0x1000>,
+		      <0x0 0x7e930000 0x0 0x1000>,
+		      <0x0 0x7e000000 0x0 0x1000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>,
+			     <0x0 0x27 0x4>;
+	};
--
1.7.1
