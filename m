From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: fdtdump: properly handle multi-string properties
Date: Fri,  4 Jan 2013 21:12:46 +0200
Message-ID: <1357326766-12691-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Loeliger <jdl@jdl.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matt Porter <mporter@ti.com>, Russ Dill <Russ.Dill@ti.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Device tree can store multiple strings in a single property.
We didn't handle that case properly.

Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
---
 fdtdump.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index 207a46d..d4fa6d7 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -21,13 +21,23 @@ static void print_data(const char *data, int len)
 {
 	int i;
 	const char *p = data;
+	const char *s;
 
 	/* no data, don't print */
 	if (len == 0)
 		return;
 
 	if (util_is_printable_string(data, len)) {
-		printf(" = \"%s\"", (const char *)data);
+		printf(" = ");
+
+		s = data;
+		do {
+			printf("\"%s\"", s);
+			s += strlen(s) + 1;
+			if (s < data + len)
+				printf(", ");
+		} while (s < data + len);
+
 	} else if ((len % 4) == 0) {
 		printf(" = <");
 		for (i = 0; i < len; i += 4)
-- 
1.7.12
