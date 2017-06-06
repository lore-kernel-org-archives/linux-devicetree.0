From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 05/10] dt-bindings: interrupt-controller: sunxi-nmi: Add
 compatible for A31 R_INTC
Date: Tue,  6 Jun 2017 13:59:27 +0800
Message-ID: <20170606055932.22548-6-wens@csie.org>
References: <20170606055932.22548-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170606055932.22548-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The A31 and later have an R_INTC block which handles the NMI interrupt
pin on the SoC. This interrupt pin is used by the external PMIC to
signal interrupts to the SoC.

While this hardware block is undocumented, the interrupt offsets
combined with the register regions for the existing "sun6i-a31-sc-nmi"
compatible line up with the old interrupt controller found on the A10.
Experiments show that only the first 32 interrupt lines can be enabled,
and only the first (NMI) interrupt is actually connected.

This patch adds a new, properly named compatible for the A31 R_INTC
block, which requires the register region to be properly aligned to
the block boundary. For comparison, the old "sun6i-a31-sc-nmi"
compatible had its register region aligned with the first used
register. This didn't match up with the memory map in the SoC's
datasheet/user manual.

Since the new compatible supercedes the old one, deprecate the old one.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../bindings/interrupt-controller/allwinner,sunxi-nmi.txt          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
index 81cd3692405e..4ae553eb333d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
@@ -3,8 +3,11 @@ Allwinner Sunxi NMI Controller
 
 Required properties:
 
-- compatible : should be "allwinner,sun7i-a20-sc-nmi" or
-  "allwinner,sun6i-a31-sc-nmi" or "allwinner,sun9i-a80-nmi"
+- compatible : should be one of the following:
+  - "allwinner,sun7i-a20-sc-nmi"
+  - "allwinner,sun6i-a31-sc-nmi" (deprecated)
+  - "allwinner,sun6i-a31-r-intc"
+  - "allwinner,sun9i-a80-nmi"
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.11.0
