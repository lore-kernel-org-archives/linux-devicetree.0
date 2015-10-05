From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH] regulator: max77802: Add input supply properties to DT binding doc
Date: Mon,  5 Oct 2015 17:07:23 +0200
Message-ID: <1444057643-29672-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The max77802 regulator driver defines the supply name for each regulator
so these can be described in DT but is not mentioned in the binding doc.

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

---

 .../devicetree/bindings/regulator/max77802.txt     | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/max77802.txt b/Documentation/devicetree/bindings/regulator/max77802.txt
index 79e5476444f7..b466689c47ea 100644
--- a/Documentation/devicetree/bindings/regulator/max77802.txt
+++ b/Documentation/devicetree/bindings/regulator/max77802.txt
@@ -8,7 +8,26 @@ regulators that can be controlled over I2C.
 
 Following properties should be present in main device node of the MFD chip.
 
-Optional node:
+Optional properties:
+- inb1-supply:  The input supply for BUCK1
+- inb2-supply:  The input supply for BUCK2
+- inb3-supply:  The input supply for BUCK3
+- inb4-supply:  The input supply for BUCK4
+- inb5-supply:  The input supply for BUCK5
+- inb6-supply:  The input supply for BUCK6
+- inb7-supply:  The input supply for BUCK7
+- inb8-supply:  The input supply for BUCK8
+- inb9-supply:  The input supply for BUCK9
+- inb10-supply: The input supply for BUCK10
+- inl1-supply:  The input supply for LDO8 and LDO15
+- inl2-supply:  The input supply for LDO17, LDO27, LDO30 and LDO35
+- inl3-supply:  The input supply for LDO3, LDO5, LDO6 and LDO7
+- inl4-supply:  The input supply for LDO10, LDO11, LDO13 and LDO14
+- inl5-supply:  The input supply for LDO9 and LDO19
+- inl6-supply:  The input supply for LDO4, LDO21, LDO24 and LDO33
+- inl7-supply:  The input supply for LDO18, LDO20, LDO28 and LDO29
+- inl9-supply:  The input supply for LDO12, LDO23, LDO25, LDO26, LDO32 and LDO34
+- inl10-supply: The input supply for LDO1 and LDO2
 - regulators : The regulators of max77802 have to be instantiated
   under subnode named "regulators" using the following format.
 
@@ -58,6 +77,8 @@ Example:
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		inb1-supply = <&parent_reg>;
+
 		regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "vdd_1v0";
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
