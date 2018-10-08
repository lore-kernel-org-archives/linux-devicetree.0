From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] doc: printk-formats: Remove bogus kobject references for device nodes
Date: Mon,  8 Oct 2018 13:08:48 +0200
Message-ID: <20181008110848.25648-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, "Tobin C . Harding" <me@tobin.cc>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh@kernel.org>, Petr Mladek <pmladek@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

When converting from text to rst, the kobjects section and its sole
subsection about device tree nodes were coalesced into a single section,
yielding an inconsistent result.

Remove all references to kobjects, as
  1. Device tree object pointers are not compatible to kobject pointers
     (the former may embed the latter, though), and
  2. there are no printk formats defined for kobject types.

Update the vsprintf() source code comments to match the above.

Fixes: b3ed23213eab1e08 ("doc: convert printk-formats.txt to rst")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/core-api/printk-formats.rst |  6 +++---
 lib/vsprintf.c                            | 20 +++++++++-----------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index d39798c2558500d5..ff48b55040ef5acf 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -376,15 +376,15 @@ correctness of the format string and va_list arguments.
 
 Passed by reference.
 
-kobjects
---------
+Device tree nodes
+-----------------
 
 ::
 
 	%pOF[fnpPcCF]
 
 
-For printing kobject based structs (device nodes). Default behaviour is
+For printing device tree node structures. Default behaviour is
 equivalent to %pOFf.
 
 	- f - device node full_name
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a3dc15c89c217b79..9a8876bfa1e06592 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1840,17 +1840,15 @@ static char *ptr_to_id(char *buf, char *end, const void *ptr,
  *       p page flags (see struct page) given as pointer to unsigned long
  *       g gfp flags (GFP_* and __GFP_*) given as pointer to gfp_t
  *       v vma flags (VM_*) given as pointer to unsigned long
- * - 'O' For a kobject based struct. Must be one of the following:
- *       - 'OF[fnpPcCF]'  For a device tree object
- *                        Without any optional arguments prints the full_name
- *                        f device node full_name
- *                        n device node name
- *                        p device node phandle
- *                        P device node path spec (name + @unit)
- *                        F device node flags
- *                        c major compatible string
- *                        C full compatible string
- *
+ * - 'OF[fnpPcCF]'  For a device tree object
+ *                  Without any optional arguments prints the full_name
+ *                  f device node full_name
+ *                  n device node name
+ *                  p device node phandle
+ *                  P device node path spec (name + @unit)
+ *                  F device node flags
+ *                  c major compatible string
+ *                  C full compatible string
  * - 'x' For printing the address. Equivalent to "%lx".
  *
  * ** When making changes please also update:
-- 
2.17.1
