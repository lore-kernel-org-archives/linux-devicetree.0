From: Maninder Singh <maninder1.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2] scripts: printing file name correctly
Date: Wed, 30 Nov 2016 10:25:34 +0530
Message-ID: <1480481734-45286-1-git-send-email-maninder1.s@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, v.narang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.m-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ajeet.y-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maninder Singh <maninder1.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently we are printing file name wrongly.
pos->file ? (char *) pos->file : "<no file>")

It should be pos->file->name, and secondly if we got NULL
file struture,we will anyway derefer it in last printf.

So, Fixing the same.

caught with static analysis tool.
Signed-off-by: Maninder Singh <maninder1.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vaneet Narang <v.narang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
v1 -> v2: changing description of patch.

 scripts/dtc/srcpos.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/dtc/srcpos.c b/scripts/dtc/srcpos.c
index f534c22..360fd14 100644
--- a/scripts/dtc/srcpos.c
+++ b/scripts/dtc/srcpos.c
@@ -252,12 +252,11 @@ struct srcpos *
 srcpos_dump(struct srcpos *pos)
 {
 	printf("file        : \"%s\"\n",
-	       pos->file ? (char *) pos->file : "<no file>");
+	       pos->file ?  pos->file->name : "<no file>");
 	printf("first_line  : %d\n", pos->first_line);
 	printf("first_column: %d\n", pos->first_column);
 	printf("last_line   : %d\n", pos->last_line);
 	printf("last_column : %d\n", pos->last_column);
-	printf("file        : %s\n", pos->file->name);
 }
 
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
