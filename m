From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] power_supply: tps65090: Update bindings for subnode
Date: Thu, 21 Mar 2013 16:33:04 -0400
Message-ID: <1363897985-19980-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This updates the DT documentation to reflect that the tps65090-charger
should be represented as a child node of the tps65090 device itself.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/power_supply/tps65090.txt  |   18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/power_supply/tps65090.txt b/Documentation/devicetree/bindings/power_supply/tps65090.txt
index 56370c7..8e5e0d3 100644
--- a/Documentation/devicetree/bindings/power_supply/tps65090.txt
+++ b/Documentation/devicetree/bindings/power_supply/tps65090.txt
@@ -1,23 +1,17 @@
 TPS65090 Frontend PMU with Switchmode Charger
 
 Required Properties:
--compatible: "ti,tps65090"
--reg: I2C slave address
--interrupts: the interrupt output to which this device connects
+-compatible: "ti,tps65090-charger"
 
 Optional Properties:
 -ti,enable-low-current-chrg: Enables charging when a low current is detected
  while the default logic is to stop charging.
 
-Example:
+This node is a subnode of the tps65090 PMIC.
 
-	tps65090@48 {
-		compatible = "ti,tps65090";
-		reg = <0x48>;
-		interrupts = <0 88 0x4>;
+Example:
 
+	tps65090-charger {
+		compatible = "ti,tps65090-charger";
 		ti,enable-low-current-chrg;
-
-		regulators {
-			...
-		};
+	};
-- 
1.7.9.5
