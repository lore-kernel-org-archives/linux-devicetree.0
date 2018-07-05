From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 1/5] dt-bindings: mfd: axp20x: Add "self-working" mode for
 AXP806
Date: Thu,  5 Jul 2018 11:11:02 +0800
Message-ID: <20180705031106.344-2-wens@csie.org>
References: <20180705031106.344-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180705031106.344-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The AXP806 has three operation modes:

  - master mode: The PMIC is the first or only AXP PMIC in the system,
		 but is not in charge of power management, i.e. only
		 provides regulator functions.

  - slave mode: The PMIC is the second AXP PMIC in the system, chained
		to the first, or master, one.

  - self-working mode: The PMIC is the only AXP PMIC in the system, and
		       is in charge of power sequencing.

The functional differences between these modes can be found in the
"Control and Operation" chapter of the AXP806 (in Chinese) and AXP805
(in English) datasheets. These include how the PMIC responds to external
signals, whether it takes an external voltage reference or uses its own,
and whether the EN/PWRON pin functions as an enable switch or power button.

We already support both slave and master mode. This patch adds a property
for describing the self-working mode, and reworks the description for
the mode properties.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Icenowy Zheng <icenowy@aosc.io>
Tested-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index d1762f3b30af..eaaf79c01e1e 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -45,8 +45,11 @@ Optional properties:
 			  board is driving OTG VBus or not.
 			  (axp221 / axp223 / axp803/ axp813 only)
 
-- x-powers,master-mode: Boolean (axp806 only). Set this when the PMIC is
-			wired for master mode. The default is slave mode.
+- x-powers,self-working-mode and
+  x-powers,master-mode: Boolean (axp806 only). Set either of these when the
+			PMIC is wired for self-working mode or master mode.
+			If neither is set then slave mode is assumed.
+			This corresponds to how the MODESET pin is wired.
 
 - <input>-supply: a phandle to the regulator supply node. May be omitted if
 		  inputs are unregulated, such as using the IPSOUT output
-- 
2.18.0
