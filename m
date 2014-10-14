From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: meson: docs: Add docs for MesonX reset controller
Date: Tue, 14 Oct 2014 20:35:49 +0200
Message-ID: <1413311749-13948-4-git-send-email-carlo@caione.org>
References: <1413311749-13948-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413311749-13948-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
---
 .../bindings/reset/amlogic,meson6-rst-mgr-ao.txt           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson6-rst-mgr-ao.txt

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson6-rst-mgr-ao.txt b/Documentation/devicetree/bindings/reset/amlogic,meson6-rst-mgr-ao.txt
new file mode 100644
index 0000000..4a8fd41
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson6-rst-mgr-ao.txt
@@ -0,0 +1,14 @@
+Amlogic MesonX Reset Manager (AO domain)
+
+Required properties:
+- compatible : "amlogic,meson6-rst-mgr-ao"
+- reg : Should contain 1 register ranges(address and length)
+- #reset-cells: 1
+
+Example:
+
+	reset: reset@c8100040 {
+		#reset-cells = <1>;
+		compatible = "amlogic,meson6-rst-mgr-ao";
+		reg = <0xc8100040 0x4>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
