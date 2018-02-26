From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] dt-bindings: arm: Document SoC compatible value for
 Armadillo-800 EVA
Date: Mon, 26 Feb 2018 19:03:42 +0100
Message-ID: <1519668225-12548-2-git-send-email-geert+renesas@glider.be>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The compatible property of the root node in a DTS for Atmark Techno
Armadillo-800 EVA should include the compatible value for the R-Mobile
A1 SoC, too.

Fixes: d2c2a0776899ba2d ("ARM: shmobile: Add platform device tree bindings documentation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 63edc11e83ef287f..ded2cd3b5f4df0c8 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -56,7 +56,7 @@ Boards:
   - APE6-EVM
     compatible = "renesas,ape6evm", "renesas,r8a73a4"
   - Atmark Techno Armadillo-800 EVA
-    compatible = "renesas,armadillo800eva"
+    compatible = "renesas,armadillo800eva", "renesas,r8a7740"
   - Blanche (RTP0RC7792SEB00010S)
     compatible = "renesas,blanche", "renesas,r8a7792"
   - BOCK-W
-- 
2.7.4
