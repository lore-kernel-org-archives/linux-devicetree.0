From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] Documentation: devicetree: arm: add lpae property to cpus/cpu bindings
Date: Tue, 26 Nov 2013 17:52:52 -0800
Message-ID: <1385517172-803-1-git-send-email-olof@lixom.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

While the LPAE capability is determined by the kernel today, it is still
useful to be able to specify the feature in the device tree. There is
precedence from other architectures for this.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---

My personal motive for this is to be able to tell which boards are
work even trying to boot an LPAE kernel on, since we don't disable the
platforms that are based on A8/A9 when LPAE is turned on. I'll add dtsi
patches for A7/A15-based platforms once the binding is settled.

I don't think it's worth trying to add those dependencies in Kconfig,
by the way -- it'd be pretty verbose and churny.

 Documentation/devicetree/bindings/arm/cpus.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 91304353eea4..632015f8314f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -191,6 +191,14 @@ nodes to be present and contain the properties described below.
 			  property identifying a 64-bit zero-initialised
 			  memory location.
 
+	- lpae
+		Usage: Indicates that the CPU can use the LPAE extensions to
+		       address more than 32 bit physical memory.
+		Value type: <empty>
+		Definition:
+			# On ARMv7 systems this boolean property is used
+			  to indicate LPAE feature capability.
+
 Example 1 (dual-cluster big.LITTLE system 32-bit):
 
 	cpus {
-- 
1.8.4.1.601.g02b3b1d

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
