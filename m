From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] doc: dt: mtd: add a DT property to enable the use of 4byte-address op codes
Date: Wed, 23 Mar 2016 13:49:11 +0100
Message-ID: <93b32638d08044de4907b46b2e4a21c645298a48.1458736784.git.cyrille.pitchen@atmel.com>
References: <cover.1458736784.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1458736784.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a new optional DT property which enables an alternative
way of supporting memory size above 16MiB (128Mib). This new mechanism
translates the regular 3byte-address op codes into their 4byte-address
version whereas the old/default mecanism makes the SPI memory enter its
4byte-address mode, which has annoying side effects for early bootloaders.

We cannot discover at run time whether the SPI NOR memory supports the
4byte-address op codes. For instance both Macronix MX25L25635E and
MX25L25673G share the same JEDEC ID (C22019 without any extension byte).
However the first one doesn't support 4byte-address op codes whereas the
second one does.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 2c91c03e7eb0..8be610482089 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -66,6 +66,17 @@ Optional properties:
                    Refer to your chips' datasheet to check if this is supported
                    by your chip.
 
+- m25p,4byte-opcodes: For memory size above 16MiB (128Mib), use the dedicated
+                      4byte-address opcodes instead of entering the 4byte
+                      address mode. This mode changes the internal state of the
+                      chip so may conflict with some early boot loaders, which
+                      expect to use the regular (Fast) Read opcodes with 3byte
+                      address.
+                      However 4byte-address opcodes are not supported by all
+                      chips and support for them can not be detected at runtime.
+                      Refer to you chip's datasheet to check if this is
+                      supported by your chip.
+
 Example:
 
 	flash: m25p80@0 {
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
