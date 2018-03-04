Return-Path: <SRS0=2s68=F2=socionext.com=yamada.masahiro@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] libfdt: include "..." instead of <...> from libfdt.h
Date: Sun,  4 Mar 2018 23:08:04 +0900
Message-Id: <1520172484-26867-1-git-send-email-yamada.masahiro@socionext.com>
To: devicetree-compiler@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
List-ID: <devicetree@vger.kernel.org>

Assuming fdt.h, libfdt.h, and libfdt_env.h will be installed to the
same directory, it wouldn't hurt to use #include "..." for inclusion
among installed headers.

This change is useful for cases where those headers do not reside in
the header search paths.

For example, Linux kernel edits these two lines when importing libfdt
(see scripts/dtc/update-dtc-source.sh)  It is needed for kernel because
include/linux/libfdt.h is a wrapper of scripts/dtc/libfdt/libfdt.h, and
scripts/dtc/libfdt is not contained in the header search paths.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 libfdt/libfdt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c8c00fa..1e27780 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -51,8 +51,8 @@
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#include <libfdt_env.h>
-#include <fdt.h>
+#include "libfdt_env.h"
+#include "fdt.h"
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
 #define FDT_LAST_SUPPORTED_VERSION	0x11
-- 
2.7.4
