From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 2/3] Add documentation for fdtget/put
Date: Wed, 30 Oct 2013 14:15:52 -0600
Message-ID: <1383164153-14379-3-git-send-email-sjg@chromium.org>
References: <1383164153-14379-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383164153-14379-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The other tools have documentation so it seems reasonable to add something
here.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3: None
Changes in v2: None

 Documentation/manual.txt | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 65c8540..5f02426 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -658,3 +658,41 @@ The fdtdump program prints a readable version of a flat device tree file.
 The syntax of the fdtdump command line is:
 
     fdtdump <DTB-file-name>
+
+
+3) fdtget -- Get individual properties and lists from a Device Tree
+
+Ths fdtget program allows you to extract properties from nodes, and also
+list nodes and properties.
+
+The syntax of the fdtget commandline is described in the help (fdtget -h).
+Common uses are:
+
+    fdtget -ts <DTB-file-name> /node compatible
+        - Read the compatible string of a node. The -ts is optional since
+          fdtget will normally guess the type correctly.
+
+    fdtget -bx <DTB-file-name> /node bytes
+        - Read the bytes in a property and output in hex. The 'b' prefix
+          forces byte output, since otherwise fdtget will output in 32-bit
+          or 16-bit words if the property length is so-aligned.
+
+    fdtget -p <DTB-file-name> /node
+        - List the properties in a node
+
+    fdtget -l <DTB-file-name> /
+        - List the subnodes for a node (here, the root node)
+
+You can use -d to provide a default value for when the property does not
+exist.
+
+
+4) fdtput -- Write individual properties to a Device Tree
+
+Ths fdtput program allows you to write properties to nodes.
+
+The syntax of the fdtput commandline is described in the help (fdtput -h) and
+the type options are the same as fdtget. You can use -c to create a node if
+it does not exist already, and -p to create all required nodes (like
+'mkdir -p' does with directories). Unfortunately fdtput does not support
+deleting nodes or properties.
-- 
1.8.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
