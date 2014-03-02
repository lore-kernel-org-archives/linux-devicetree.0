From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: [PATCH 1/1] Update source code location for dtc in manual.txt
Date: Sun,  2 Mar 2014 22:39:14 +0100
Message-ID: <1393796354-29704-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

The information about the location of the source code of the
device tree compiler was inaccurate.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 Documentation/manual.txt |   21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 65c8540..0a8e6d5 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -30,25 +30,22 @@ I - "dtc", the device tree compiler
 
 1) Sources
 
-Source code for the Device Tree Compiler can be found at jdl.com.
-The gitweb interface is:
+Source code for the Device Tree Compiler can be found at git.kernel.org.
 
-    http://git.jdl.com/gitweb/
+The upstream repository is here:
 
-The repository is here:
+    git://git.kernel.org/pub/scm/utils/dtc/dtc.git
+    https://git.kernel.org/pub/scm/utils/dtc/dtc.git
 
-    git://www.jdl.com/software/dtc.git
-    http://www.jdl.com/software/dtc.git
+The gitweb interface for the upstream respository is:
 
-Tarballs of the 1.0.0 and latest releases are here:
-
-    http://www.jdl.com/software/dtc-v1.2.0.tgz
-    http://www.jdl.com/software/dtc-latest.tgz
+    https://git.kernel.org/cgit/utils/dtc/dtc.git/ 
 
 1.1) Submitting Patches
 
-Patches should be sent to jdl-CYoMK+44s/E@public.gmane.org, and CC'ed to
-devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsieG/Ez6ZCGd0@public.gmane.org
+Patches should be sent to the maintainers as determined with
+scripts/get_maintainer.pl of the Linux Kernel source and CC'ed to
+devicetree-compiler-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
 
 2) Description
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
