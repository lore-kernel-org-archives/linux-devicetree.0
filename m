From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 3/6] Make testutils use utilfdt
Date: Wed, 21 Sep 2011 13:32:46 -0700
Message-ID: <1316637169-24112-4-git-send-email-sjg@chromium.org>
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

The load_blob() and save_blob() functions are very similar to the utilfdt
versions. This removes the duplicated code.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3:
- Make testutils.c use utilfdt for load/save blobs

 tests/Makefile.tests |    5 ++-
 tests/testutils.c    |   59 +++++++++----------------------------------------
 2 files changed, 14 insertions(+), 50 deletions(-)

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 4df4017..593bab8 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -44,11 +44,12 @@ tests:	$(TESTS) $(TESTS_TREES)
 
 $(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_archive)
 
-$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o $(LIBFDT_archive)
+$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_archive)
 	@$(VECHO) LD [libdl] $@
 	$(LINK.c) -o $@ $^ -ldl
 
-$(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o $(LIBFDT_archive)
+$(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o \
+		util.o $(LIBFDT_archive)
 
 $(TESTS_PREFIX)dumptrees: $(TESTS_PREFIX)trees.o
 
diff --git a/tests/testutils.c b/tests/testutils.c
index b0a2230..f185133 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -159,33 +159,13 @@ int nodename_eq(const char *s1, const char *s2)
 
 void *load_blob(const char *filename)
 {
-	int fd;
-	int offset = 0;
-	int bufsize = 1024;
-	char *p = NULL;
-	int ret;
-
-	fd = open(filename, O_RDONLY);
-	if (fd < 0)
-		CONFIG("Couldn't open blob from \"%s\": %s", filename,
-		       strerror(errno));
-
-	p = xmalloc(bufsize);
-	do {
-		if (offset == bufsize) {
-			bufsize *= 2;
-			p = xrealloc(p, bufsize);
-		}
-
-		ret = read(fd, &p[offset], bufsize - offset);
-		if (ret < 0)
-			CONFIG("Couldn't read from \"%s\": %s", filename,
-			       strerror(errno));
-
-		offset += ret;
-	} while (ret != 0);
+	char *blob;
+	int ret = utilfdt_read_err(filename, &blob);
 
-	return p;
+	if (ret)
+		CONFIG("Couldn't open blob from \"%s\": %s", filename,
+		       strerror(ret));
+	return blob;
 }
 
 void *load_blob_arg(int argc, char *argv[])
@@ -197,28 +177,11 @@ void *load_blob_arg(int argc, char *argv[])
 
 void save_blob(const char *filename, void *fdt)
 {
-	int fd;
-	int totalsize;
-	int offset;
-	char *p;
-	int ret;
-
-	fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);
-	if (fd < 0)
-		CONFIG("Couldn't open \"%s\" to write blob: %s", filename,
-		       strerror(errno));
-
-	totalsize = fdt_totalsize(fdt);
-	offset = 0;
-	p = fdt;
-
-	while (offset < totalsize) {
-		ret = write(fd, p + offset, totalsize - offset);
-		if (ret < 0)
-			CONFIG("Couldn't write to \"%s\": %s", filename,
-			       strerror(errno));
-		offset += ret;
-	}
+	int ret = utilfdt_write_err(filename, fdt);
+
+	if (ret)
+		CONFIG("Couldn't write blob to \"%s\": %s", filename,
+		       strerror(ret));
 }
 
 void *open_blob_rw(void *blob)
-- 
1.7.3.1
