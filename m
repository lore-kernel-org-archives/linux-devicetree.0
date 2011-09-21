From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 1/6] Create Makefile.utils and move ftdump into it
Date: Wed, 21 Sep 2011 13:32:44 -0700
Message-ID: <1316637169-24112-2-git-send-email-sjg@chromium.org>
References: <1316637169-24112-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316637169-24112-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We want to avoid a separate Makefile include for each utility, so this sets
up a general one for utilities.

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3:
- Use Makefile.utils instead of separate Makefiles

 Makefile        |    2 +-
 Makefile.ftdump |   13 -------------
 Makefile.utils  |   10 ++++++++++
 3 files changed, 11 insertions(+), 14 deletions(-)
 delete mode 100644 Makefile.ftdump
 create mode 100644 Makefile.utils

diff --git a/Makefile b/Makefile
index 2172d9a..380a705 100644
--- a/Makefile
+++ b/Makefile
@@ -105,7 +105,7 @@ endef
 
 include Makefile.convert-dtsv0
 include Makefile.dtc
-include Makefile.ftdump
+include Makefile.utils
 
 BIN += convert-dtsv0
 BIN += dtc
diff --git a/Makefile.ftdump b/Makefile.ftdump
deleted file mode 100644
index 2744a18..0000000
--- a/Makefile.ftdump
+++ /dev/null
@@ -1,13 +0,0 @@
-#
-# This is not a complete Makefile of itself.
-# Instead, it is designed to be easily embeddable
-# into other systems of Makefiles.
-#
-
-FTDUMP_SRCS = \
-	ftdump.c \
-	util.c
-
-FTDUMP_GEN_SRCS =
-
-FTDUMP_OBJS = $(FTDUMP_SRCS:%.c=%.o) $(FTDUMP_GEN_SRCS:%.c=%.o)
diff --git a/Makefile.utils b/Makefile.utils
new file mode 100644
index 0000000..0ed9297
--- /dev/null
+++ b/Makefile.utils
@@ -0,0 +1,10 @@
+#
+# This is not a complete Makefile of itself.  Instead, it is designed to
+# be easily embeddable into other systems of Makefiles.
+#
+
+FTDUMP_SRCS = \
+	ftdump.c \
+	util.c
+
+FTDUMP_OBJS = $(FTDUMP_SRCS:%.c=%.o)
-- 
1.7.3.1
