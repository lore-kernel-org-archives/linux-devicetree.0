From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH v2] drm/i2c: tda998x: Change the compatible strings
Date: Fri, 21 Mar 2014 11:55:41 +0100
Message-ID: <20140321115541.01cbbb06@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The tda998x driver accepts only 3 chips from the TDA998x family.
This patch changes the driver compatible strings to these chips.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
v2: change the subject to drm/i2c
This patch applies after
	drm/i2c: tda998x: Fix lack of required reg in DT documentation
---
 Documentation/devicetree/bindings/drm/i2c/tda998x.txt | 4 ++--
 drivers/gpu/drm/i2c/tda998x_drv.c                     | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)
diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
index fc7effa..e3f3d65 100644
--- a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
+++ b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
@@ -1,7 +1,7 @@
 Device-Tree bindings for the NXP TDA998x HDMI transmitter
 
 Required properties;
-  - compatible: must be "nxp,tda998x"
+  - compatible: may be "nxp,tda9989", "nxp,tda19988" or "nxp,tda19989"
 
   - reg: I2C address
 
@@ -20,7 +20,7 @@ Optional properties:
 Example:
 
 	tda998x: hdmi-encoder {
-		compatible = "nxp,tda998x";
+		compatible = "nxp,tda19988";
 		reg = <0x70>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <27 2>;		/* falling edge */
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 48af5ca..fd6751c 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1367,7 +1367,9 @@ fail:
 
 #ifdef CONFIG_OF
 static const struct of_device_id tda998x_dt_ids[] = {
-	{ .compatible = "nxp,tda998x", },
+	{ .compatible = "nxp,tda9989", },
+	{ .compatible = "nxp,tda19988", },
+	{ .compatible = "nxp,tda19989", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tda998x_dt_ids);
-- 
1.9.1
