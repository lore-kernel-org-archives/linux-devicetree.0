From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 1/4] devicetree: add a binding for a regulator that constrains its supply
Date: Mon, 24 Nov 2014 14:02:00 +0100
Message-ID: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 .../bindings/regulator/constrained-supply.txt      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/constrained-supply.txt

diff --git a/Documentation/devicetree/bindings/regulator/constrained-supply.txt b/Documentation/devicetree/bindings/regulator/constrained-supply.txt
new file mode 100644
index 0000000..3c85430
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/constrained-supply.txt
@@ -0,0 +1,29 @@
+Constrained Supply Regulator
+
+This binding allow creating a virtual regulator that constrain its
+supply to provides the requested voltage. This is to allow using
+simple drivers that don't explicitly request a voltage on boards
+that have adjustable hardware regulators.
+
+Required properties:
+- compatible : Must be "regulator-constrained-supply".
+- vin-supply : phandle to the parent supply/regulator node
+
+Optional properties:
+- any property defined in regulator.txt
+
+Example:
+
+  /* Adjustable regulator for extension boards */
+  vdd_ext: regulator@0 {
+  	regulator-min-microvolt = <1000000>;
+  	regulator-max-microvolt = <10000000>;
+  };
+
+  /* An extension board that need 3.3V */
+  vdd_ext_board1: regulator@1 {
+	compatible = "regulator-constrained-supply";
+  	regulator-min-microvolt = <3300000>;
+  	regulator-max-microvolt = <3300000>;
+	vin-supply = <&vdd_ext>;
+  };
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
