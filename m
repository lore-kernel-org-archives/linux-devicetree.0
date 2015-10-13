From: <atull@opensource.altera.com>
Subject: [PATCH] ARM: socfpga: dts: add fpga manager
Date: Tue, 13 Oct 2015 13:28:20 -0500
Message-ID: <1444760900-1373-1-git-send-email-atull@opensource.altera.com>
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
To: dinguyen@opensource.altera.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alan Tull <atull@opensource.altera.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, delicious.quinoa@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add FPGA manager to device tree for SoCFPGA.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 314e589..e37ba11 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -834,5 +834,12 @@
 			compatible = "altr,sys-mgr", "syscon";
 			reg = <0xffd08000 0x4000>;
 		};
+
+		hps_0_fpgamgr: fpgamgr@0xff706000 {
+			compatible = "altr,socfpga-fpga-mgr";
+			reg = <0xFF706000 0x1000
+			       0xFFB90000 0x1000>;
+			interrupts = <0 175 4>;
+		};
 	};
 };
-- 
1.9.1
