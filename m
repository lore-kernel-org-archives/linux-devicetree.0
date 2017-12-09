From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: [PATCH] dt-bindings: chosen: Document linux,initrd-{start,end}
Date: Sat,  9 Dec 2017 16:33:02 +0100
Message-ID: <20171209153305.11012-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

These properties have been in use for a very long time (at least since
2005), but were never documented in chosen.txt.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
---
 Documentation/devicetree/bindings/chosen.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index e3b13ea7d2ae..45e79172a646 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -120,3 +120,18 @@ e.g.
 While this property does not represent a real hardware, the address
 and the size are expressed in #address-cells and #size-cells,
 respectively, of the root node.
+
+linux,initrd-start and linux,initrd-end
+---------------------------------------
+
+These properties hold the physical start and end address of an initrd that's
+loaded by the bootloader. Note that linux,initrd-start is inclusive, but
+linux,initrd-end is exclusive.
+e.g.
+
+/ {
+	chosen {
+		linux,initrd-start = <0x82000000>;
+		linux,initrd-end = <0x82800000>;
+	};
+};
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
