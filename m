From: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v23 9/9] Documentation: dt: chosen properties for arm64 kdump
Date: Tue, 26 Jul 2016 17:02:06 +0900
Message-ID: <20160726080206.2441-1-takahiro.akashi@linaro.org>
References: <20160726075659.2290-1-takahiro.akashi@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160726075659.2290-1-takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: james.morse-5wv7dgnIgG8@public.gmane.org, geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>

Add documentation for
	linux,crashkernel-base and crashkernel-size,
	linux,usable-memory-range, and
	linux,elfcorehdr
used by arm64 kexec/kdump to decribe the kdump reserved area, and
the elfcorehdr's location within it.

Signed-off-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
[takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org:
    renamed "usable-memory" to "usable-memory-range",
    added "linux,crashkernel-base" and "-size" ]
Signed-off-by: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/chosen.txt | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 6ae9d82..d7a3a86 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -52,3 +52,48 @@ This property is set (currently only on PowerPC, and only needed on
 book3e) by some versions of kexec-tools to tell the new kernel that it
 is being booted by kexec, as the booting environment may differ (e.g.
 a different secondary CPU release mechanism)
+
+linux,crashkernel-base
+linux,crashkernel-size
+----------------------
+These properties are set (on PowerPC and arm64) during kdump to tell
+use-space tools, like kexec-tools, the base address of the crash-dump
+kernel's reserved area of memory and the size. e.g.
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
+This property is set (currently only on arm64) during kdump to tell
+the crash-dump kernel the base address of its reserved area of memory,
+and the size. e.g.
+
+/ {
+	chosen {
+		linux,usable-memory-range = <0x9 0xf0000000 0x0 0x10000000>;
+	};
+};
+
+Please note that, if this property is present, any memory regions under
+"memory" nodes will be ignored.
+
+linux,elfcorehdr
+----------------
+
+This property is set (currently only on arm64) during kdump to tell
+the crash-dump kernel the address and size of the elfcorehdr that describes
+the old kernel's memory as an elf file. This memory must reside within
+the area described by 'linux,usable-memory-range'. e.g.
+
+/ {
+	chosen {
+		linux,usable-memory = <0x9 0xf0000000 0x0 0x10000000>;
+		linux,elfcorehdr = <0x9 0xfffff000 0x0 0x800>;
+	};
+};
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
