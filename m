From: Matheus Castello <matheus@castello.eng.br>
Subject: [PATCH] dt-bindings: pinctrl: sunxi: Fix reference to driver
Date: Wed, 11 Apr 2018 01:17:03 -0400
Message-ID: <1523423823-9115-1-git-send-email-matheus@castello.eng.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: wens@csie.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

Bindings describe hardware, not drivers.
Use reference to hardware Allwinner A1X Pin Controller instead driver.

Signed-off-by: Matheus Castello <matheus@castello.eng.br>
---
 .../devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index ed5eb54..c854cf0 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -56,9 +56,9 @@ pins it needs, and how they should be configured, with regard to muxer
 configuration, drive strength and pullups. If one of these options is
 not set, its actual value will be unspecified.

-This driver supports the generic pin multiplexing and configuration
-bindings. For details on each properties, you can refer to
-./pinctrl-bindings.txt.
+Allwinner A1X Pin Controller supports the generic pin multiplexing and
+configuration bindings. For details on each properties, you can refer to
+ ./pinctrl-bindings.txt.

 Required sub-node properties:
   - pins
--
2.7.4
