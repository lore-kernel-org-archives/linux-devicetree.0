From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH] Fix uninitialized access bug in utilfdt_decode_type
Date: Fri,  3 Feb 2012 17:06:12 +1100
Message-ID: <1328249172-6282-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I just found this little bug with valgrind.  strchr() will return true
if the given character is '\0'.  This meant that utilfdt_decode_type()
could take a path which accesses uninitialized data when given the
(invalid) format string "L".

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 util.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/util.c b/util.c
index d82d41f..2422c34 100644
--- a/util.c
+++ b/util.c
@@ -296,6 +296,9 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size)
 {
 	int qualifier = 0;
 
+	if (!*fmt)
+		return -1;
+
 	/* get the conversion qualifier */
 	*size = -1;
 	if (strchr("hlLb", *fmt)) {
@@ -311,7 +314,7 @@ int utilfdt_decode_type(const char *fmt, int *type, int *size)
 	}
 
 	/* we should now have a type */
-	if (!strchr("iuxs", *fmt))
+	if ((*fmt == '\0') || !strchr("iuxs", *fmt))
 		return -1;
 
 	/* convert qualifier (bhL) to byte size */
-- 
1.7.8.3
