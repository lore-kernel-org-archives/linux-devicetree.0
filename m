From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH] regulator: max77802: Separate sections for nodes and properties
Date: Mon,  5 Oct 2015 19:35:24 +0200
Message-ID: <1444066524-2226-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The optional "regulators" is a node and not a property so it should not
be in the "Optional properties" section but in an "Optional nodes" one.

Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

---

 Documentation/devicetree/bindings/regulator/max77802.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/max77802.txt b/Documentation/devicetree/bindings/regulator/max77802.txt
index b466689c47ea..09d796ed48be 100644
--- a/Documentation/devicetree/bindings/regulator/max77802.txt
+++ b/Documentation/devicetree/bindings/regulator/max77802.txt
@@ -28,6 +28,8 @@ Optional properties:
 - inl7-supply:  The input supply for LDO18, LDO20, LDO28 and LDO29
 - inl9-supply:  The input supply for LDO12, LDO23, LDO25, LDO26, LDO32 and LDO34
 - inl10-supply: The input supply for LDO1 and LDO2
+
+Optional nodes:
 - regulators : The regulators of max77802 have to be instantiated
   under subnode named "regulators" using the following format.
 
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
