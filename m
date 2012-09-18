From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] gpio: Describe interrupt-controller binding
Date: Tue, 18 Sep 2012 10:51:14 +0200
Message-ID: <1347958274-19425-1-git-send-email-thierry.reding@avionic-design.de>
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
To: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to use GPIO controllers as interrupt controllers, they need to
be marked with the DT interrupt-controller property. This commit adds
some documentation about this to the general GPIO binding document.

Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 4e16ba4..8d125b0 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -75,4 +75,37 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 		gpio-controller;
 	};
 
+If the GPIO controller supports the generation of interrupts, it should
+also contain an empty "interrupt-controller" property as well as an
+"#interrupt-cells" property. This is required in order for other nodes
+to use the GPIO controller as their interrupt parent.
 
+If #interrupt-cells is 1, the single cell is used to specify the number
+of the GPIO that is to be used as an interrupt.
+
+If #interrupt-cells is 2, the first cell is used to specify the number
+of the GPIO that is to be used as an interrupt, whereas the second cell
+is used to specify any of the following flags:
+  - bits[3:0] trigger type and level flags
+      1 = low-to-high edge triggered
+      2 = high-to-low edge triggered
+      4 = active high level-sensitive
+      8 = active low level-sensitive
+
+Example:
+
+	gpioext: gpio-controller@41 {
+		compatible = "ad,gpio-adnp";
+		reg = <0x41>;
+
+		interrupt-parent = <&gpio>;
+		interrupts = <160 1>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		nr-gpios = <64>;
+	};
-- 
1.7.12
