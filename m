From: Markus Niebel <list-09_devicetree-7U5DVgMjAv4@public.gmane.org>
Subject: [PATCH] DT: Vendor: add prefix for TQ Systems
Date: Fri, 18 Jul 2014 13:58:37 +0200
Message-ID: <1405684717-434-1-git-send-email-list-09_devicetree@tqsc.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>

Add prefix for TQ Systems GmbH and for TQ Components
both are needed since the existing PPC device trees use
tqc but the TQMa53 ARM module uses tq. The tq prefix is better
since TQ Components was renamed some time ago.

Signed-off-by: Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 46a311e..1755bd1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -132,6 +132,8 @@ tlm	Trusted Logic Mobility
 toradex	Toradex AG
 toshiba	Toshiba Corporation
 toumaz	Toumaz
+tq	TQ Systems GmbH
+tqc	TQ Components (deprecated, use tq)
 usi	Universal Scientifc Industrial Co., Ltd.
 v3	V3 Semiconductor
 variscite	Variscite Ltd.
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
