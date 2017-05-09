From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: Document optional "reserved-names" property
Date: Tue,  9 May 2017 10:18:47 -0700
Message-ID: <20170509171847.27457-1-f.fainelli@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Define an optional string property: "reserved-names" which can be used
by the client program to tag/identify reserved memory regions.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index 3da0ebdba8d9..bd3c9485f637 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -64,6 +64,10 @@ reusable (optional) - empty property
       system can use that region to store volatile or cached data that
       can be otherwise regenerated or migrated elsewhere.
 
+reserved-names (optional)
+    - Provides a named tag to the client program to help pretty print/identify
+      the reserved memory region.
+
 Linux implementation note:
 - If a "linux,cma-default" property is present, then Linux will use the
   region for the default pool of the contiguous memory allocator.
-- 
2.9.3
