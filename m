From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 1/3] lib: add glibc style strchrnul() variant
Date: Tue, 13 May 2014 15:58:33 +0100
Message-ID: <1399993115-21552-2-git-send-email-grant.likely@linaro.org>
References: <1399993115-21552-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399993115-21552-1-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

The strchrnul() variant helpfully returns a the end of the string
instead of a NULL if the requested character is not found. This can
simplify string parsing code since it doesn't need to expicitly check
for a NULL return. If a valid string pointer is passed in, then a valid
null terminated string will always come back out.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
---
 include/linux/string.h |  3 +++
 lib/string.c           | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index ac889c5ea11b..d36977e029af 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -52,6 +52,9 @@ extern int strncasecmp(const char *s1, const char *s2, size_t n);
 #ifndef __HAVE_ARCH_STRCHR
 extern char * strchr(const char *,int);
 #endif
+#ifndef __HAVE_ARCH_STRCHRNUL
+extern char * strchrnul(const char *,int);
+#endif
 #ifndef __HAVE_ARCH_STRNCHR
 extern char * strnchr(const char *, size_t, int);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 9b1f9062a202..059636f92c26 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -301,6 +301,21 @@ char *strchr(const char *s, int c)
 EXPORT_SYMBOL(strchr);
 #endif
 
+#ifndef __HAVE_ARCH_STRCHRNUL
+/**
+ * strchr - Find the first occurrence of a character in a string
+ * @s: The string to be searched
+ * @c: The character to search for
+ */
+char *strchrnul(const char *s, int c)
+{
+	while (*s && *s != (char)c)
+		s++;
+	return (char *)s;
+}
+EXPORT_SYMBOL(strchrnul);
+#endif
+
 #ifndef __HAVE_ARCH_STRRCHR
 /**
  * strrchr - Find the last occurrence of a character in a string
-- 
1.9.1
