From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add a README file for dtc and libfdt
Date: Tue, 11 Feb 2014 13:56:32 +0000
Message-ID: <1392126992-8533-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a README file to document the location of the mailing list, the home
page and state who the maintainers are.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 README | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 README

diff --git a/README b/README
new file mode 100644
index 000000000000..979974a1b3ad
--- /dev/null
+++ b/README
@@ -0,0 +1,20 @@
+The source tree contains the Device Tree Compiler (dtc) toolchain for
+working with device tree source and binary files and also libfdt, a
+utility library for reading and manipulating the binary format.
+
+DTC and LIBFDT are maintained by:
+
+David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
+Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
+
+Mailing list
+------------
+The following list is for discussion about dtc and libfdt implementation
+mailto:devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+
+Core device tree bindings are discussed on the devicetree-spec list:
+mailto:devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+
+Home Page
+---------
+http://devicetree.org/Device_Tree_Compiler
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
