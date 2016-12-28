From: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v29 9/9] Documentation: dt: chosen properties for arm64 kdump
Date: Wed, 28 Dec 2016 13:37:34 +0900
Message-ID: <20161228043734.27535-1-takahiro.akashi@linaro.org>
References: <20161228043347.27358-1-takahiro.akashi@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161228043347.27358-1-takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: james.morse-5wv7dgnIgG8@public.gmane.org, geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>

Add documentation for
	linux,crashkernel-base and crashkernel-size,
	linux,usable-memory-range
	linux,elfcorehdr
used by arm64 kdump to decribe the kdump reserved area, and
the elfcorehdr's location within it.

Signed-off-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
[takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org: added "linux,crashkernel-base" and "-size" ]
Signed-off-by: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/chosen.txt | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 6ae9d82d4c37..7b115165e9ec 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -52,3 +52,53 @@ This property is set (currently only on PowerPC, and only needed on
 book3e) by some versions of kexec-tools to tell the new kernel that it
 is being booted by kexec, as the booting environment may differ (e.g.
 a different secondary CPU release mechanism)
+
+linux,crashkernel-base
+linux,crashkernel-size
+----------------------
+
+These properties (currently used on PowerPC and arm64) indicates
+the base address and the size, respectively, of the reserved memory
+range for crash dump kernel.
+e.g.
+
+/ {
+	chosen {
+		linux,crashkernel-base = <0x9 0xf0000000>;
+		linux,crashkernel-size = <0x0 0x10000000>;
+	};
+};
+
+linux,usable-memory-range
+-------------------------
+
+This property (currently used only on arm64) holds the memory range,
+the base address and the size, which can be used as system ram on
+the *current* kernel. Note that, if this property is present, any memory
+regions under "memory" nodes in DT blob or ones marked as "conventional
+memory" in EFI memory map should be ignored.
+e.g.
+
+/ {
+	chosen {
+		linux,usable-memory-range = <0x9 0xf0000000 0x0 0x10000000>;
+	};
+};
+
+The main usage is for crash dump kernel to identify its own usable
+memory and exclude, at its boot time, any other memory areas that are
+part of the panicked kernel's memory.
+
+linux,elfcorehdr
+----------------
+
+This property (currently used only on arm64) holds the memory range,
+the address and the size, of the elf core header which mainly describes
+the panicked kernel's memory layout as PT_LOAD segments of elf format.
+e.g.
+
+/ {
+	chosen {
+		linux,elfcorehdr = <0x9 0xfffff000 0x0 0x800>;
+	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
