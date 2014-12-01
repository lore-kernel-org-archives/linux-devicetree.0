From: Peter Crosthwaite <crosthwaitepeter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/3] doc: dt: vendor-prefixes: Add Digilent Inc
Date: Mon,  1 Dec 2014 10:25:48 +1000
Message-ID: <1417393550-6674-1-git-send-email-crosthwaite.peter@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, steven.wang-PRfGYHLb4FmqndwCJWfcng@public.gmane.org
List-Id: devicetree@vger.kernel.org

Digilent is a board designer, making various Linux capabable FPGA and
processor boards. Add to the vendor list.

Acked-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
http://www.digilentinc.com
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c177cd7..b1df0ad 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -41,6 +41,7 @@ dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
 davicom	DAVICOM Semiconductor, Inc.
 denx	Denx Software Engineering
 digi	Digi International Inc.
+digilent	Diglent, Inc.
 dlg	Dialog Semiconductor
 dlink	D-Link Corporation
 dmo	Data Modul AG
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
