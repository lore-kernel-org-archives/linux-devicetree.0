From: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v35 13/14] Documentation: dt: chosen properties for arm64 kdump
Date: Mon,  3 Apr 2017 11:26:06 +0900
Message-ID: <20170403022606.12609-1-takahiro.akashi@linaro.org>
References: <20170403022139.12383-1-takahiro.akashi@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403022139.12383-1-takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: james.morse-5wv7dgnIgG8@public.gmane.org, geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, sgoel-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>

Add documentation for DT properties:
	linux,usable-memory-range
	linux,elfcorehdr
used by arm64 kdump. Those are, respectively, a usable memory range
allocated to crash dump kernel and the elfcorehdr's location within it.

Signed-off-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
[takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org: update the text due to recent changes ]
Signed-off-by: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/chosen.txt | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 6ae9d82d4c37..b5e39af4ddc0 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -52,3 +52,48 @@ This property is set (currently only on PowerPC, and only needed on
 book3e) by some versions of kexec-tools to tell the new kernel that it
 is being booted by kexec, as the booting environment may differ (e.g.
 a different secondary CPU release mechanism)
+
+linux,usable-memory-range
+-------------------------
+
+This property (arm64 only) holds a base address and size, describing a
+limited region in which memory may be considered available for use by
+the kernel. Memory outside of this range is not available for use.
+
+This property describes a limitation: memory within this range is only
+valid when also described through another mechanism that the kernel
+would otherwise use to determine available memory (e.g. memory nodes
+or the EFI memory map). Valid memory may be sparse within the range.
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
+While this property does not represent a real hardware, the address
+and the size are expressed in #address-cells and #size-cells,
+respectively, of the root node.
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
+
+While this property does not represent a real hardware, the address
+and the size are expressed in #address-cells and #size-cells,
+respectively, of the root node.
-- 
2.11.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
