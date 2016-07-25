From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2 v5] iio: magn: DT bindings for AK8974
Date: Mon, 25 Jul 2016 15:54:54 +0200
Message-ID: <1469454895-13659-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the AK8974 magnetometer, similar
to those for the AK8975.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Samu Onkalo <samu.onkalo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v4->v5:
- No changes, just resend.
ChangeLog v3->v4:
- Add support for an optional mounting matrix
ChangeLog v2->v3:
- No changes, just reposting to keep together with the series
ChangeLog v1->v2:
- No changes, just reposting to keep together with the series
---
 .../bindings/iio/magnetometer/ak8974.txt           | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt b/Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt
new file mode 100644
index 000000000000..77d5aba1bd8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt
@@ -0,0 +1,29 @@
+* Asahi Kasei AK8974 magnetometer sensor
+
+Required properties:
+
+- compatible : should be "asahi-kasei,ak8974"
+- reg : the I2C address of the magnetometer
+
+Optional properties:
+
+- avdd-supply: regulator supply for the analog voltage
+  (see regulator/regulator.txt)
+- dvdd-supply: regulator supply for the digital voltage
+  (see regulator/regulator.txt)
+- interrupts: data ready (DRDY) and interrupt (INT1) lines
+  from the chip, the DRDY interrupt must be placed first.
+  The interrupts can be triggered on rising or falling
+  edges alike.
+- mount-matrix: an optional 3x3 mounting rotation matrix
+
+Example:
+
+ak8974@0f {
+	compatible = "asahi-kasei,ak8974";
+	reg = <0x0f>;
+	avdd-supply = <&foo_reg>;
+	dvdd-supply = <&bar_reg>;
+	interrupts = <0 IRQ_TYPE_EDGE_RISING>,
+		     <1 IRQ_TYPE_EDGE_RISING>;
+};
-- 
2.7.4
