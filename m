From: Loc Ho <lho@apm.com>
Subject: [PATCH v6 5/5] arm64: Add APM X-Gene SoC EDAC DTS entries
Date: Tue, 17 Mar 2015 00:30:21 -0600
Message-ID: <1426573821-1937-6-git-send-email-lho@apm.com>
References: <1426573821-1937-1-git-send-email-lho@apm.com>
 <1426573821-1937-2-git-send-email-lho@apm.com>
 <1426573821-1937-3-git-send-email-lho@apm.com>
 <1426573821-1937-4-git-send-email-lho@apm.com>
 <1426573821-1937-5-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1426573821-1937-5-git-send-email-lho@apm.com>
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

This patch adds APM X-Gene SoC EDAC DTS entries.

Signed-off-by: Feng Kan <fkan@apm.com>
Signed-off-by: Loc Ho <lho@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |   98 ++++++++++++++++++++++++++++++++
 1 files changed, 98 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index a857794..c7b028f 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -354,6 +354,104 @@
 			};
 		};

+		edacmc0: edacmc0@7e800000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e800000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc1: edacmc1@7e840000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e840000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc2: edacmc2@7e880000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e880000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc3: edacmc3@7e8c0000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e8c0000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd0: edacpmd0@7c000000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c000000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd1: edacpmd1@7c200000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c200000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd2: edacpmd2@7c400000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c400000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd3: edacpmd3@7c600000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c600000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacl3: edacl3@7e600000 {
+			compatible = "apm,xgene-edac-l3";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e600000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacsoc: edacsoc@7e930000 {
+			compatible = "apm,xgene-edac-soc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e930000 0x0 0x1000>,
+			      <0x0 0x7e000000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>,
+				     <0x0 0x27 0x4>;
+		};
+
 		pcie0: pcie@1f2b0000 {
 			status = "disabled";
 			device_type = "pci";
--
1.7.1
