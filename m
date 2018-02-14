From: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 2/2] net: phy: dp83867: Add documentation for CLK_OUT pin muxing
Date: Wed, 14 Feb 2018 13:23:39 +0100
Message-ID: <1518611019-37098-2-git-send-email-d.schultz@phytec.de>
References: <1518611019-37098-1-git-send-email-d.schultz@phytec.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518611019-37098-1-git-send-email-d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>

Add documentation of ti,clk-output-sel which can be used to select
a specific clock for CLK_OUT.

Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/net/ti,dp83867.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
index 02c4353..56060c0 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
@@ -25,6 +25,8 @@ Optional property:
 				    software needs to take when this pin is
 				    strapped in these modes. See data manual
 				    for details.
+	- ti,clk-output-sel - Muxing option for CLK_OUT pin - see dt-bindings/net/ti-dp83867.h
+		for applicable values.
 
 Note: ti,min-output-impedance and ti,max-output-impedance are mutually
       exclusive. When both properties are present ti,max-output-impedance
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
