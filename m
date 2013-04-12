From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: [PATCH] ARC: [TB10x] Adapt device tree to new compatible string
Date: Fri, 12 Apr 2013 12:36:29 +0200
Message-ID: <1365762989-31638-1-git-send-email-christian.ruppert@abilis.com>
References: <5167D7E4.9030206@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5167D7E4.9030206@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Christian Ruppert <christian.ruppert@abilis.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The original device tree was written using a slightly different
implementation of the fixed-factor-clock device tree binding. The
compatible string must be modified in order to be compatible with the
new implementation.

Signed-off-by: Christian Ruppert <christian.ruppert@abilis.com>
---
 arch/arc/boot/dts/abilis_tb10x.dtsi |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
index 6d80d9c..a6139fc 100644
--- a/arch/arc/boot/dts/abilis_tb10x.dtsi
+++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
@@ -53,13 +53,13 @@
 			clock-output-names = "pll0";
 		};
 		cpu_clk: clkdiv_cpu {
-			compatible = "fixed-factor-clkdiv";
+			compatible = "fixed-factor-clock";
 			#clock-cells = <0>;
 			clocks = <&pll0>;
 			clock-output-names = "cpu_clk";
 		};
 		ahb_clk: clkdiv_ahb {
-			compatible = "fixed-factor-clkdiv";
+			compatible = "fixed-factor-clock";
 			#clock-cells = <0>;
 			clocks = <&pll0>;
 			clock-output-names = "ahb_clk";
-- 
1.7.1
