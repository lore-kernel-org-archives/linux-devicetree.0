From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/8] ARM: dts: r8a7745: Remove unit-address and reg from
 integrated cache
Date: Mon,  6 Mar 2017 17:40:38 +0100
Message-ID: <1488818443-25196-4-git-send-email-geert+renesas@glider.be>
References: <1488818443-25196-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488818443-25196-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Cortex-A7 cache controller is an integrated controller, and thus the
device node representing it should not have a unit-addresses or reg
property.

Fixes: c95360247bdd67d3 ("ARM: dts: r8a7745: initial SoC device tree")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7745.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index dcac70fbc4028c11..2feb0084bb3b1b51 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -32,9 +32,8 @@
 			next-level-cache = <&L2_CA7>;
 		};
 
-		L2_CA7: cache-controller@0 {
+		L2_CA7: cache-controller-0 {
 			compatible = "cache";
-			reg = <0>;
 			cache-unified;
 			cache-level = <2>;
 			power-domains = <&sysc R8A7745_PD_CA7_SCU>;
-- 
2.7.4
