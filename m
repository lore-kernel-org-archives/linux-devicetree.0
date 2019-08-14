From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 120/123] dt-bindings: riscv: fix the schema
 compatible string for the HiFive Unleashed board
Date: Tue, 13 Aug 2019 22:10:44 -0400
Message-ID: <20190814021047.14828-120-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
List-Id: devicetree@vger.kernel.org

From: Paul Walmsley <paul.walmsley@sifive.com>

[ Upstream commit b390e0bfd2996f1215231395f4e25a4c011eeaf9 ]

The YAML binding document for SiFive boards has an incorrect
compatible string for the HiFive Unleashed board.  Change it to match
the name of the board on the SiFive web site:

   https://www.sifive.com/boards/hifive-unleashed

which also matches the contents of the board DT data file:

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts#n13

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/devicetree/bindings/riscv/sifive.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
index 9d17dc2f3f843..3ab532713dc12 100644
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
2.20.1
