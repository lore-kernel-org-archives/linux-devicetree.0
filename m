From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC][PATCH 4/4] dt-bindings: Document the property poweroff-source for act8865 regulator
Date: Tue, 30 Sep 2014 17:29:46 +0000
Message-ID: <1412098186-5042-4-git-send-email-romain.perier@gmail.com>
References: <1412098186-5042-1-git-send-email-romain.perier@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412098186-5042-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/act8865-regulator.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
index 865614b..4d7f33e 100644
--- a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
@@ -5,6 +5,10 @@ Required properties:
 - compatible: "active-semi,act8846" or "active-semi,act8865"
 - reg: I2C slave address
 
+Optional properties:
+- poweroff-source: Telling whether or not this pmic is controlling
+  the system power
+
 Any standard regulator properties can be used to configure the single regulator.
 
 The valid names for regulators are:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
