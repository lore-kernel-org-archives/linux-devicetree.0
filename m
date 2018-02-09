From: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/3] dt-bindings: regulator: describe da9062's regulator modes
Date: Fri,  9 Feb 2018 11:05:20 +0100
Message-ID: <1518170721-28198-3-git-send-email-chf.fritz@googlemail.com>
References: <1518170721-28198-1-git-send-email-chf.fritz@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518170721-28198-1-git-send-email-chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds DT description of da9062's buck regulator modes.

Signed-off-by: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index c0a418c..b871bc2 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -64,6 +64,14 @@ Sub-nodes:
     ldo3     : LDO_3
     ldo4     : LDO_4
 
+  The DA9062 regulators optionally support setting "regulator-initial-mode"
+  and "regulator-mode" for its buck nodes to following numbers listed below:
+
+    0        : BUCK_MODE_MANUAL
+    1        : BUCK_MODE_SLEEP
+    2        : BUCK_MODE_SYNC
+    3        : BUCK_MODE_AUTO
+
   The component follows the standard regulator framework and the bindings
   details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
