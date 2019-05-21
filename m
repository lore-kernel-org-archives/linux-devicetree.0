From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a774c0: Clean up CPU compatibles
Date: Tue, 21 May 2019 17:44:26 +0100
Message-ID: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Apparently this DTS crossed over with commit 31af04cd60d3 ("arm64: dts:
Remove inconsistent use of 'arm,armv8' compatible string") and missed
out on the cleanup, so put it right.

CC: Simon Horman <horms@verge.net.au>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: linux-renesas-soc@vger.kernel.org
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 3f86db199dbf..500b7bd58022 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -70,7 +70,7 @@
 		#size-cells = <0>;
 
 		a53_0: cpu@0 {
-			compatible = "arm,cortex-a53", "arm,armv8";
+			compatible = "arm,cortex-a53";
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
@@ -81,7 +81,7 @@
 		};
 
 		a53_1: cpu@1 {
-			compatible = "arm,cortex-a53", "arm,armv8";
+			compatible = "arm,cortex-a53";
 			reg = <1>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU1>;
-- 
2.21.0.dirty
