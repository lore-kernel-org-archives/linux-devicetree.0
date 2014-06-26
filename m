From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: Add todo tasklist for Devicetree
Date: Thu, 26 Jun 2014 16:54:38 +0100
Message-ID: <1403798078-1104-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are a number of outstanding workitems that need to be done on the
device tree code. Start tracking them so that interested developers can
pick up a task and start working on it.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/todo.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/todo.txt

diff --git a/Documentation/devicetree/todo.txt b/Documentation/devicetree/todo.txt
new file mode 100644
index 000000000000..6a20bb3ef2e6
--- /dev/null
+++ b/Documentation/devicetree/todo.txt
@@ -0,0 +1,16 @@
+Todo list for devicetree:
+
+=== General structure ===
+- Switch from custom lists to (h)list_head for nodes and properties structure
+- Remove of_allnodes list and iterate using list of child nodes alone
+
+=== CONFIG_OF_DYNAMIC ===
+- Switch to RCU for tree updates and get rid of global spinlock
+- Document node lifecycle for CONFIG_OF_DYNAMIC
+- Always set ->full_name at of_attach_node() time
+- pseries fixups
+  - Get rid of open-coded tree modification from arch/powerpc/platforms/pseries/dlpar.c
+  - Move of_finish_dynamic_node() behaviour into of_attach_node()
+- Fix notifier order. Notifiers should be sent after tree changes have
+  been applied instead of before (need to verify it works with for
+  pseries)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
