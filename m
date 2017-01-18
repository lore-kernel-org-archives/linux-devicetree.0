From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 1/2] dt-bindings: arm,
 gic: Fix binding example for a virt-capable GIC
Date: Wed, 18 Jan 2017 10:53:30 +0000
Message-ID: <1484736811-24002-2-git-send-email-marc.zyngier@arm.com>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, arm@kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Antoine Tenart <antoine.tenart@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Fabio Estevam <fabio.estevam@nxp.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Shawn Guo <shawnguo@ke>
List-Id: devicetree@vger.kernel.org

The joys of copy/paste: the example of a virtualization capable GIC
in the DT binding was wrong, and propagated to dozens of platforms.

Oh well. Let's fix the source of the crap before tackling individual
offenders.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
index 5393e2a..a3d51ed 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
@@ -107,11 +107,11 @@ Required properties:
 Example:
 
 	interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a15-gic";
+		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x2c001000 0x1000>,
-		      <0x2c002000 0x1000>,
+		      <0x2c002000 0x2000>,
 		      <0x2c004000 0x2000>,
 		      <0x2c006000 0x2000>;
 		interrupts = <1 9 0xf04>;
-- 
2.1.4
