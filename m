From: Rask Ingemann Lambertsen <rask@formelder.dk>
Subject: [PATCH 1/2] dts: mfd: axp20x: Add xpowers,master-mode property for
 AXP806 PMICs
Date: Sat, 18 Feb 2017 20:51:18 +0100 (CET)
Message-ID: <112c3e4aa625ce2c550ae7ae4446a61d058455b5.1487428238.git.rask@formelder.dk>
References: <cover.1487428238.git.rask@formelder.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1487428238.git.rask@formelder.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

commit b101829a029a ("mfd: axp20x: Fix AXP806 access errors on cold boot")
was intended to fix the case where a board uses an AXP806 in slave mode,
but the boot loader leaves it in master mode for lack of AXP806 support.
But now the driver breaks on boards where the PMIC is operating in master
mode. To let the device tree describe which mode of operation is needed,
this patch introduces a new property "xpowers,master-mode".

Fixes: b101829a029a ("mfd: axp20x: Fix AXP806 access errors on cold boot")
Signed-off-by: Rask Ingemann Lambertsen <rask@formelder.dk>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 86ae540..9af3457 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -29,6 +29,9 @@ Optional properties:
 		  regulator to drive the OTG VBus, rather then as an input pin
 		  which signals whether the board is driving OTG VBus or not.
 
+- x-powers,master-mode: Boolean (axp806 only). Set this when the PMIC is
+			wired for master mode. The default is slave mode.
+
 - <input>-supply: a phandle to the regulator supply node. May be omitted if
 		  inputs are unregulated, such as using the IPSOUT output
 		  from the PMIC.
-- 
2.10.2
