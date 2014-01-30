From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] dt-bindings: add vendor-prefix for neonode
Date: Thu, 30 Jan 2014 15:18:46 +0100
Message-ID: <2809570.RstiYk4HG8@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org>

Neonode Inc. is the Manufacturer of the zforce infraread touchscreens
used in a lot of ebook readers and supported by the zforce_ts driver.

Signed-off-by: Heiko Stuebner <heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org>
---
Dmitry, the input maintainer, didn't want to carry the vendor-prefix
addition [0], therefore add it separately.

[0] http://permalink.gmane.org/gmane.linux.kernel.input/33887

 Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index edbb8d8..32a60a9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -47,6 +47,7 @@ maxim	Maxim Integrated Products
 microchip	Microchip Technology Inc.
 mosaixtech	Mosaix Technologies, Inc.
 national	National Semiconductor
+neonode		Neonode Inc.
 nintendo	Nintendo
 nvidia	NVIDIA
 nxp	NXP Semiconductors
-- 
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
