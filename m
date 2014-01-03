From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 08/10] Die on failed /incbin/ seeks
Date: Sat,  4 Jan 2014 00:24:41 +1100
Message-ID: <1388755483-27008-9-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Failing to open an input file, with /include/ or /incbin/ is treated as
immediately fatal inside srcfile_relative_open().  However, failint to
seek() to the requested offset in an /incbin/ is not.  This is a bit oddly
inconsistent, and leaves us with a strange case that's awkward to deal with
down the line.

So, get rid of it and have failed seeks on an /incbin/ be immediately
fatal.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index efe81dd..bed857e 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -226,10 +226,9 @@ propdata:
 
 			if ($6 != 0)
 				if (fseek(f, $6, SEEK_SET) != 0)
-					print_error("Couldn't seek to offset %llu in \"%s\": %s",
-						     (unsigned long long)$6,
-						     $4.val,
-						     strerror(errno));
+					die("Couldn't seek to offset %llu in \"%s\": %s",
+					    (unsigned long long)$6, $4.val,
+					    strerror(errno));
 
 			d = data_copy_file(f, $8);
 
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
