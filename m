From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Fix util_is_printable_string
Date: Fri,  4 Jan 2013 21:12:58 +0200
Message-ID: <1357326778-12725-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Loeliger <jdl@jdl.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matt Porter <mporter@ti.com>, Russ Dill <Russ.Dill@ti.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

The method used did not account for multi-part strings.

Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
---
 util.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/util.c b/util.c
index 2422c34..45f186b 100644
--- a/util.c
+++ b/util.c
@@ -72,7 +72,7 @@ char *join_path(const char *path, const char *name)
 int util_is_printable_string(const void *data, int len)
 {
 	const char *s = data;
-	const char *ss;
+	const char *ss, *se;
 
 	/* zero length is not */
 	if (len == 0)
@@ -82,13 +82,19 @@ int util_is_printable_string(const void *data, int len)
 	if (s[len - 1] != '\0')
 		return 0;
 
-	ss = s;
-	while (*s && isprint(*s))
-		s++;
+	se = s + len;
 
-	/* not zero, or not done yet */
-	if (*s != '\0' || (s + 1 - ss) < len)
-		return 0;
+	while (s < se) {
+		ss = s;
+		while (s < se && *s && isprint(*s))
+			s++;
+
+		/* not zero, or not done yet */
+		if (*s != '\0' || s == ss)
+			return 0;
+
+		s++;
+	}
 
 	return 1;
 }
-- 
1.7.12
