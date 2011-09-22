From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 3/5] ftdump: use utilfdt to read blob
Date: Thu, 22 Sep 2011 10:11:04 -0700
Message-ID: <1316711466-14199-4-git-send-email-sjg@chromium.org>
References: <1316711466-14199-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316711466-14199-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Now that we have utilfdt_read(), ftdump should use it too.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 ftdump.c |   32 ++++----------------------------
 1 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/ftdump.c b/ftdump.c
index db932e3..cc55fe2 100644
--- a/ftdump.c
+++ b/ftdump.c
@@ -13,8 +13,6 @@
 
 #include "util.h"
 
-#define FTDUMP_BUF_SIZE	65536
-
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
 #define GET_CELL(p)	(p += 4, *((const uint32_t *)(p-4)))
@@ -147,40 +145,18 @@ static void dump_blob(void *blob)
 
 int main(int argc, char *argv[])
 {
-	FILE *fp;
 	char *buf;
-	int size;
 
 	if (argc < 2) {
 		fprintf(stderr, "supply input filename\n");
 		return 5;
 	}
 
-	if (strcmp(argv[1], "-") == 0) {
-		fp = stdin;
-	} else {
-		fp = fopen(argv[1], "rb");
-		if (fp == NULL) {
-			fprintf(stderr, "unable to open %s\n", argv[1]);
-			return 10;
-		}
-	}
-
-	buf = malloc(FTDUMP_BUF_SIZE);
-	if (!buf) {
-		fprintf(stderr, "Couldn't allocate %d byte buffer\n", FTDUMP_BUF_SIZE);
+	buf = utilfdt_read(argv[1]);
+	if (buf)
+		dump_blob(buf);
+	else
 		return 10;
-	}
-
-	size = fread(buf, 1, FTDUMP_BUF_SIZE, fp);
-	if (size == FTDUMP_BUF_SIZE) {
-		fprintf(stderr, "file too large (maximum is %d bytes)\n", FTDUMP_BUF_SIZE);
-		return 10;
-	}
-
-	dump_blob(buf);
-
-	fclose(fp);
 
 	return 0;
 }
-- 
1.7.3.1
