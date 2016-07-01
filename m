From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH v3 1/3] arm64: arch_timer: Add device tree binding for A-008585 erratum
Date: Fri,  1 Jul 2016 17:41:35 -0500
Message-ID: <1467412897-15220-1-git-send-email-oss@buserror.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This erratum describes a bug in logic outside the core, so MIDR can't be
used to identify its presence, and reading an SoC-specific revision
register from common arch timer code would be awkward.  So, describe it
in the device tree.

Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/arch_timer.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
index e774128..ef5fbe9 100644
--- a/Documentation/devicetree/bindings/arm/arch_timer.txt
+++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
@@ -25,6 +25,12 @@ to deliver its interrupts via SPIs.
 - always-on : a boolean property. If present, the timer is powered through an
   always-on power domain, therefore it never loses context.
 
+- fsl,erratum-a008585 : A boolean property. Indicates the presence of
+  QorIQ erratum A-008585, which says that reading the counter is
+  unreliable unless the same value is returned by back-to-back reads.
+  This also affects writes to the tval register, due to the implicit
+  counter read.
+
 ** Optional properties:
 
 - arm,cpu-registers-not-fw-configured : Firmware does not initialize
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
