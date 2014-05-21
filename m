From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: Make of_find_node_by_path() handle /aliases
Date: Tue, 20 May 2014 19:46:19 -0700
Message-ID: <537C137B.2000007@gmail.com>
References: <1399993115-21552-1-git-send-email-grant.likely@linaro.org> <1399993115-21552-3-git-send-email-grant.likely@linaro.org> <53757D25.1060005@gmail.com> <20140516105444.C1DB7C42277@trevor.secretlab.ca> <20140518092730.109AAC40B8A@trevor.secretlab.ca> <537C1252.3090900@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537C1252.3090900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5/20/2014 7:41 PM, Frank Rowand wrote:



< snip >



> I will reply to this email with an additional patch that restores the

> original behavior.



< snip >



From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

If __of_find_node_by_path() returns parent when the remaining portion of the
path is "/" then the behavior of of_find_node_by_path() has changed.

Previously, adding an extraneous "/" on the end of a path would result
in of_find_node_by_path() not finding a match.

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 drivers/of/base.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

Index: b/drivers/of/base.c
===================================================================
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -778,7 +778,7 @@ static struct device_node *__of_find_nod
 	int len = strchrnul(path, '/') - path;
 
 	if (!len)
-		return parent;
+		return NULL;
 
 	for_each_child_of_node(parent, child) {
 		const char *name = strrchr(child->full_name, '/');
@@ -813,6 +813,17 @@ struct device_node *of_find_node_by_path
 	struct property *pp;
 	unsigned long flags;
 
+	if (strcmp(path, "/") == 0) {
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		for (; np; np = np->allnext) {
+			if (np->full_name && (of_node_cmp(np->full_name, path) == 0)
+			    && of_node_get(np))
+				break;
+		}
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+		return np;
+	}
+
 	/* The path could begin with an alias */
 	if (*path != '/') {
 		char *p = strchrnul(path, '/');
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
