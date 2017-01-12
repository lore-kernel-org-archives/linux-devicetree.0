From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2] Documentation: dt: reset: Revise typos in TI syscon reset
 example
Date: Wed, 11 Jan 2017 19:22:17 -0600
Message-ID: <20170112012217.18115-1-s-anna@ti.com>
References: <20170109192814.26811-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170109192814.26811-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix couple of typos in the example given in the TI syscon reset
binding. The ti,reset-bits used for DSP0 are corrected to match
the values that will be used in the actual DT node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Address Rob Herring's comment to change the reset node name
    from "psc-reset" to "reset-controller"
    
 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
index 164c7f34c451..c516d24959f2 100644
--- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -63,7 +63,7 @@ Example:
 --------
 The following example demonstrates a syscon node, the reset controller node
 using the syscon node, and a consumer (a DSP device) on the TI Keystone 2
-Edison SoC.
+66AK2E SoC.
 
 / {
 	soc {
@@ -71,13 +71,13 @@ Edison SoC.
 			compatible = "syscon", "simple-mfd";
 			reg = <0x02350000 0x1000>;
 
-			pscrst: psc-reset {
+			pscrst: reset-controller {
 				compatible = "ti,k2e-pscrst", "ti,syscon-reset";
 				#reset-cells = <1>;
 
 				ti,reset-bits = <
-					0xa3c 8 0xa3c 8 0x83c 8 (ASSERT_SET|DEASSERT_CLEAR|STATUS_SET)   /* 0: pcrst-dsp0 */
-					0xa40 5 0xa44 3 0     0 (ASSERT_SET|DEASSERT_CLEAR|STATUS_NONE)  /* 1: pcrst-example */
+					0xa3c 8 0xa3c 8 0x83c 8 (ASSERT_CLEAR | DEASSERT_SET   | STATUS_CLEAR) /* 0: dsp0 */
+					0xa40 5 0xa44 3 0     0 (ASSERT_SET   | DEASSERT_CLEAR | STATUS_NONE)  /* 1: example */
 				>;
 			};
 		};
-- 
2.10.2
