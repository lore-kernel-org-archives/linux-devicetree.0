From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/8] utilfdt_read_err: use xmalloc funcs
Date: Mon,  8 Apr 2013 03:06:45 -0400
Message-ID: <1365404812-15153-2-git-send-email-vapier@gentoo.org>
References: <1365404812-15153-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365404812-15153-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
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

We've got these handy helpers, so let's use them.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util.c b/util.c
index b081fa8..12f0614 100644
--- a/util.c
+++ b/util.c
@@ -212,12 +212,12 @@ int utilfdt_read_err(const char *filename, char **buffp)
 	}
 
 	/* Loop until we have read everything */
-	buf = malloc(bufsize);
+	buf = xmalloc(bufsize);
 	do {
 		/* Expand the buffer to hold the next chunk */
 		if (offset == bufsize) {
 			bufsize *= 2;
-			buf = realloc(buf, bufsize);
+			buf = xrealloc(buf, bufsize);
 			if (!buf) {
 				ret = ENOMEM;
 				break;
-- 
1.8.1.2
