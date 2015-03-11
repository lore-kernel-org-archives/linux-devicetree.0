From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/5] arm64: Documentation: clarify Image placement in physical RAM
Date: Wed, 11 Mar 2015 17:00:18 +0100
Message-ID: <1426089620-9459-4-git-send-email-ard.biesheuvel@linaro.org>
References: <1426089620-9459-1-git-send-email-ard.biesheuvel@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426089620-9459-1-git-send-email-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The early init code maps the kernel image using statically
allocated page tables. This means that we can only allow
Image to be placed such that we can map its entire static
footprint using a single table entry at all but the lowest
level. So update the documentation to reflect that the Image
should not cross a 512 MB boundary, which ensures the above
on both 4k and 64k pages kernels.

Reviewed-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/arm64/booting.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm64/booting.txt b/Documentation/arm64/booting.txt
index ab5a90adece3..5949bdbe7aac 100644
--- a/Documentation/arm64/booting.txt
+++ b/Documentation/arm64/booting.txt
@@ -115,8 +115,9 @@ The Image must be placed text_offset bytes from a 2MB aligned base
 address near the start of usable system RAM and called there. Memory
 below that base address is currently unusable by Linux, and therefore it
 is strongly recommended that this location is the start of system RAM.
-At least image_size bytes from the start of the image must be free for
-use by the kernel.
+The physical memory region consisting of image_size bytes counting from
+the start of the image must be free for use by the kernel, and must not
+cross a 512 MB physical alignment boundary.
 
 Any memory described to the kernel (even that below the 2MB aligned base
 address) which is not marked as reserved from the kernel e.g. with a
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
