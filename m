From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/6] mtd: augment the "arm,versatile-flash" bindings
Date: Tue, 26 Jan 2016 12:12:00 +0100
Message-ID: <1453806725-4880-2-git-send-email-linus.walleij@linaro.org>
References: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453806725-4880-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The bindings for the "arm,versatile-flash" device was merged in
commit 3ba7222ac992d24d09ccd0b55940b54849eef752
"arm/versatile: Add device tree support" but was never used
for anything.

Versatile flash chips are actually just standard CFI chips,
but they have one or two bits in a system controller to control
VPP and write protection. Let's use this compatible string in
conjunction with "cfi-flash" to indicate that we have a
normal CFI flash with some extra Versatile-specific protection.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/mtd/arm-versatile.txt        | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/arm-versatile.txt b/Documentation/devicetree/bindings/mtd/arm-versatile.txt
index beace4b89daa..4ec28796a3c0 100644
--- a/Documentation/devicetree/bindings/mtd/arm-versatile.txt
+++ b/Documentation/devicetree/bindings/mtd/arm-versatile.txt
@@ -1,8 +1,26 @@
 Flash device on ARM Versatile board
 
+These flash chips are found in the ARM reference designs like Integrator,
+Versatile, RealView, Versatile Express etc.
+
+They are regular CFI compatible (Intel or AMD extended) flash chips with
+some special write protect/VPP bits that can be controlled by the machine's
+system controller.
+
 Required properties:
-- compatible : must be "arm,versatile-flash";
+- compatible : must be "arm,versatile-flash", "cfi-flash";
+- reg : memory address for the flash chip
 - bank-width : width in bytes of flash interface.
 
+For the rest of the properties, see mtd-physmap.txt.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
+
+Example:
+
+flash@34000000 {
+	compatible = "arm,versatile-flash", "cfi-flash";
+	reg = <0x34000000 0x4000000>;
+	bank-width = <4>;
+};
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
