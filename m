From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] scripts/dtc: dtx_diff - update include dts paths to match build
Date: Wed, 19 Jul 2017 18:35:31 -0700
Message-ID: <1500514531-932-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Update the cpp include flags for compiling device tree dts files
to match the changes made to the kernel build process in
commit d5d332d3f7e8 ("devicetree: Move include prefixes from arch
to separate directory").

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 4.12
Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 scripts/dtc/dtx_diff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
index fb86f3899e16..f9a3d8d23c64 100755
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -321,7 +321,7 @@ fi
 cpp_flags="\
 	-nostdinc                                  \
 	-I${srctree}/arch/${ARCH}/boot/dts         \
-	-I${srctree}/arch/${ARCH}/boot/dts/include \
+	-I${srctree}/scripts/dtc/include-prefixes  \
 	-I${srctree}/drivers/of/testcase-data      \
 	-undef -D__DTS__"
 
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
