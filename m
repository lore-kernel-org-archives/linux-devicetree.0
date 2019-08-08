From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] dt-bindings: riscv: fix the schema compatible string for
 the HiFive Unleashed board
Date: Thu, 8 Aug 2019 15:46:25 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1908081545190.15649@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


The YAML binding document for SiFive boards has an incorrect
compatible string for the HiFive Unleashed board.  Change it to match
the name of the board on the SiFive web site:

   https://www.sifive.com/boards/hifive-unleashed

which also matches the contents of the board DT data file:

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts#n13

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 Documentation/devicetree/bindings/riscv/sifive.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
index 9d17dc2f3f84..3ab532713dc1 100644
--- a/Documentation/devicetree/bindings/riscv/sifive.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
@@ -19,7 +19,7 @@ properties:
   compatible:
     items:
       - enum:
-          - sifive,freedom-unleashed-a00
+          - sifive,hifive-unleashed-a00
       - const: sifive,fu540-c000
       - const: sifive,fu540
 ...
-- 
2.22.0
