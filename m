From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] dt-bindings: arm: scu: Correct example SCU unit addresses
Date: Tue, 26 Jun 2018 09:50:10 +0200
Message-ID: <20180626075010.15611-3-geert+renesas@glider.be>
References: <20180626075010.15611-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180626075010.15611-1-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The unit addresses of the Cortex-A9 SCU device nodes contain too many
zeroes.  Remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/scu.txt          | 2 +-
 Documentation/devicetree/bindings/arm/ux500/boards.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/scu.txt b/Documentation/devicetree/bindings/arm/scu.txt
index 08a587875996b47c..74d0a780ce511998 100644
--- a/Documentation/devicetree/bindings/arm/scu.txt
+++ b/Documentation/devicetree/bindings/arm/scu.txt
@@ -22,7 +22,7 @@ References:
 
 Example:
 
-scu@a04100000 {
+scu@a0410000 {
 	compatible = "arm,cortex-a9-scu";
 	reg = <0xa0410000 0x100>;
 };
diff --git a/Documentation/devicetree/bindings/arm/ux500/boards.txt b/Documentation/devicetree/bindings/arm/ux500/boards.txt
index 0fa429534f4910f7..89408de55bfd2a62 100644
--- a/Documentation/devicetree/bindings/arm/ux500/boards.txt
+++ b/Documentation/devicetree/bindings/arm/ux500/boards.txt
@@ -60,7 +60,7 @@ Example:
 			      <0xa0410100 0x100>;
 		};
 
-		scu@a04100000 {
+		scu@a0410000 {
 			compatible = "arm,cortex-a9-scu";
 			reg = <0xa0410000 0x100>;
 		};
-- 
2.17.1
