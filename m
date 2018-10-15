From: frowand.list@gmail.com
Subject: [PATCH] of: Documentation: remove unmaintained todo file
Date: Sun, 14 Oct 2018 20:22:19 -0700
Message-ID: <1539573739-2108-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The todo.txt file was created by a previous maintainer and has
never been updated by the current OPEN FIRMWARE AND FLATTENED
DEVICE TREE maintainers.  Remove the out of date file.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/devicetree/todo.txt | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 Documentation/devicetree/todo.txt

diff --git a/Documentation/devicetree/todo.txt b/Documentation/devicetree/todo.txt
deleted file mode 100644
index b5139d1de811..000000000000
--- a/Documentation/devicetree/todo.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-Todo list for devicetree:
-
-=== General structure ===
-- Switch from custom lists to (h)list_head for nodes and properties structure
-
-=== CONFIG_OF_DYNAMIC ===
-- Switch to RCU for tree updates and get rid of global spinlock
-- Document node lifecycle for CONFIG_OF_DYNAMIC
-- Always set ->full_name at of_attach_node() time
-- pseries: Get rid of open-coded tree modification from arch/powerpc/platforms/pseries/dlpar.c
-- 
Frank Rowand <frank.rowand@sony.com>
