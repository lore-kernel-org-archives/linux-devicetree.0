From: <dinguyen@opensource.altera.com>
Subject: [PATCH] ARM: dts: socfpga: enable the data and instruction prefetch
 for the l2 cache
Date: Thu, 16 Jul 2015 16:14:28 -0500
Message-ID: <1437081268-19225-1-git-send-email-dinguyen@opensource.altera.com>
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
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
Cc: devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>, s.trumtrar@pengutronix.de, dinh.linux@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Just in case the firmware did not enable data and instruction prefetch in
the L2 cache controller, we enable it in the kernel.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 80f924d..1e3c833 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -639,6 +639,8 @@
 			cache-level = <2>;
 			arm,tag-latency = <1 1 1>;
 			arm,data-latency = <2 1 1>;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
 		};
 
 		mmc: dwmmc0@ff704000 {
-- 
2.4.5
