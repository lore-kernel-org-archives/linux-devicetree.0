From: Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] documentation/dt: Fix stdout-path property
Date: Fri,  8 Jan 2016 11:41:16 +0100
Message-ID: <1452249676-25803-1-git-send-email-mbrugger@suse.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>
List-Id: devicetree@vger.kernel.org

Property linux,stdout-path is deprecated. Fix the documentation
to reflect the up-to-date property.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 Documentation/devicetree/booting-without-of.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 04d34f6..f7b4092 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -976,7 +976,7 @@ compatibility.
 
     - bootargs : This zero-terminated string is passed as the kernel
       command line
-    - linux,stdout-path : This is the full path to your standard
+    - stdout-path : This is the full path to your standard
       console device if any. Typically, if you have serial devices on
       your board, you may want to put the full path to the one set as
       the default console in the firmware here, for the kernel to pick
-- 
2.6.2
