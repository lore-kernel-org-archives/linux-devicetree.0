From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH] Some Documentation fixes and generalizations.
Date: Fri,  3 Oct 2008 12:12:43 -0500
Message-ID: <1223053963-22251-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Updated a jdl.com URL reference.

Generalized the new section IV to be "Utility Tools"
and added a small blurb about ftdump as well.

Signed-off-by: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
---
 Documentation/manual.txt |   26 ++++++++++++++++++++------
 1 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 0674384..f8a8a7b 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -19,7 +19,9 @@ II - The DT block format
 
 III - libfdt
 
-IV - Conversion to Version 1
+IV - Utility Tools
+    1) convert-dtsv0 -- Conversion to Version 1
+    1) ftdump
 
 
 I - "dtc", the device tree compiler
@@ -30,7 +32,7 @@ I - "dtc", the device tree compiler
 Source code for the Device Tree Compiler can be found at jdl.com.
 The gitweb interface is:
 
-    http://www.jdl.com/git_repos/
+    http://git.jdl.com/gitweb/
 
 The repository is here:
 
@@ -39,7 +41,7 @@ The repository is here:
 
 Tarballs of the 1.0.0 and latest releases are here:
 
-    http://www.jdl.com/software/dtc-1.0.0.tgz
+    http://www.jdl.com/software/dtc-v1.2.0.tgz
     http://www.jdl.com/software/dtc-latest.tgz
 
 
@@ -620,8 +622,11 @@ III - libfdt
 This library should be merged into dtc proper.
 This library should likely be worked into U-Boot and the kernel.
 
-IV - Conversion to Version 1
-============================
+
+IV - Utility Tools
+==================
+
+1) convert-dtsv0 -- Conversion to Version 1
 
 convert-dtsv0 is a small utility program which converts (DTS)
 Device Tree Source from the obsolete version 0 to version 1.
@@ -630,9 +635,18 @@ Version 1 DTS files are marked by line "/dts-v1/;" at the top of the file.
 
 The syntax of the convert-dtsv0 command line is:
 
-convert-dtsv0 [<input_filename ... >]
+    convert-dtsv0 [<input_filename ... >]
 
 Each file passed will be converted to the new /dts-v1/ version by creating
 a new file with a "v1" appended the filename.
 
 Comments, empty lines, etc. are preserved.
+
+
+2) ftdump -- Flat Tree dumping utility
+
+The ftdump program prints a readable version of a flat device tree file.
+
+The syntax of the ftdump command line is:
+
+    ftdump <DTB-file-name>
-- 
1.6.0.90.g436ed
