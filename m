From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/10] utilfdt_read: pass back up the length of data read
Date: Mon, 15 Apr 2013 22:13:09 -0400
Message-ID: <1366078397-14889-3-git-send-email-vapier@gentoo.org>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366078397-14889-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

For a follow up commit, we want to be able to scan the buffer that was
returned to us.  In order to do that safely, we need to know how big
the buffer actually is, so create a new set of funcs to pass that back.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 util.c | 19 ++++++++++++++++---
 util.h | 13 +++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/util.c b/util.c
index 12f0614..0367df6 100644
--- a/util.c
+++ b/util.c
@@ -197,7 +197,7 @@ char get_escape_char(const char *s, int *i)
 	return val;
 }
 
-int utilfdt_read_err(const char *filename, char **buffp)
+int utilfdt_read_err_len(const char *filename, char **buffp, off_t *len)
 {
 	int fd = 0;	/* assume stdin */
 	char *buf = NULL;
@@ -238,13 +238,20 @@ int utilfdt_read_err(const char *filename, char **buffp)
 		free(buf);
 	else
 		*buffp = buf;
+	*len = bufsize;
 	return ret;
 }
 
-char *utilfdt_read(const char *filename)
+int utilfdt_read_err(const char *filename, char **buffp)
+{
+	off_t len;
+	return utilfdt_read_err_len(filename, buffp, &len);
+}
+
+char *utilfdt_read_len(const char *filename, off_t *len)
 {
 	char *buff;
-	int ret = utilfdt_read_err(filename, &buff);
+	int ret = utilfdt_read_err_len(filename, &buff, len);
 
 	if (ret) {
 		fprintf(stderr, "Couldn't open blob from '%s': %s\n", filename,
@@ -255,6 +262,12 @@ char *utilfdt_read(const char *filename)
 	return buff;
 }
 
+char *utilfdt_read(const char *filename)
+{
+	off_t len;
+	return utilfdt_read_len(filename, &len);
+}
+
 int utilfdt_write_err(const char *filename, const void *blob)
 {
 	int fd = 1;	/* assume stdout */
diff --git a/util.h b/util.h
index 543a173..1f0ef47 100644
--- a/util.h
+++ b/util.h
@@ -85,6 +85,13 @@ char get_escape_char(const char *s, int *i);
 char *utilfdt_read(const char *filename);
 
 /**
+ * Like utilfdt_read(), but also passes back the size of the file read.
+ *
+ * @param len		If non-NULL, the amount of data we managed to read
+ */
+char *utilfdt_read_len(const char *filename, off_t *len);
+
+/**
  * Read a device tree file into a buffer. Does not report errors, but only
  * returns them. The value returned can be passed to strerror() to obtain
  * an error message for the user.
@@ -95,6 +102,12 @@ char *utilfdt_read(const char *filename);
  */
 int utilfdt_read_err(const char *filename, char **buffp);
 
+/**
+ * Like utilfdt_read_err(), but also passes back the size of the file read.
+ *
+ * @param len		If non-NULL, the amount of data we managed to read
+ */
+int utilfdt_read_err_len(const char *filename, char **buffp, off_t *len);
 
 /**
  * Write a device tree buffer to a file. This will report any errors on
-- 
1.8.1.2
