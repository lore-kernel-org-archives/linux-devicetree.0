From: Loc Ho <lho@apm.com>
Subject: [PATCH v5 4/4] arm64: Add APM X-Gene SoC EDAC DTS entries
Date: Sat, 23 Aug 2014 01:23:08 -0600
Message-ID: <1408778588-3215-5-git-send-email-lho@apm.com>
References: <1408778588-3215-1-git-send-email-lho@apm.com>
 <1408778588-3215-2-git-send-email-lho@apm.com>
 <1408778588-3215-3-git-send-email-lho@apm.com>
 <1408778588-3215-4-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408778588-3215-4-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dougthompson@xmission.com, bp@alien8.de, m.chehab@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: devicetree@vger.kernel.org, Feng Kan <fkan@apm.com>, jcm@redhat.com, patches@apm.com, Loc Ho <lho@apm.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds APM X-Gene SoC EDAC DTS entries.

Signed-off-by: Feng Kan <fkan@apm.com>
Signed-off-by: Loc Ho <lho@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi |   98 ++++++++++++++++++++++++++++++++++++
 1 files changed, 98 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index c0aceef..2b74d15 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -315,6 +315,104 @@
 			interrupts = <0x0 0x4f 0x4>;
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
 		phy1: phy@1f21a000 {
 			compatible = "apm,xgene-phy";
 			reg = <0x0 0x1f21a000 0x0 0x100>;
-- 
1.5.5
