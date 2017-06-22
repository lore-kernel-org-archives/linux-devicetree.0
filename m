From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] scripts/dtc: dtx_diff - Show real file names in diff header
Date: Thu, 22 Jun 2017 15:07:06 +0200
Message-ID: <1498136826-6793-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the comparison uses process substitution to pass files after
conversion to DTS format, the diff header doesn't show the real
filenames, but the names of the file descriptors used:

    --- /dev/fd/63  2017-06-22 11:21:47.531637188 +0200
    +++ /dev/fd/62  2017-06-22 11:21:47.531637188 +0200

This is especially annoying when comparing a bunch of DT files in a
loop, as the output doesn't show a clue about which files it refers to.

Fix this by explicitly passing the original file names to the diff
command using the --label option, giving e.g.:

    --- arch/arm/boot/dts/r8a7791-koelsch.dtb
    +++ arch/arm/boot/dts/r8a7791-porter.dtb

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 scripts/dtc/dtx_diff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
index ec47f95991a3aecc..fb86f3899e162200 100755
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -338,7 +338,7 @@ DTC="${DTC} ${dtc_flags} -O dts -qq -f ${dtc_sort} -o -"
 
 if (( ${cmd_diff} )) ; then
 
-	diff ${diff_flags} \
+	diff ${diff_flags} --label "${dtx_file_1}" --label "${dtx_file_2}" \
 		<(compile_to_dts "${dtx_file_1}") \
 		<(compile_to_dts "${dtx_file_2}")
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
