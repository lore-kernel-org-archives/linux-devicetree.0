From: Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] When dumping from file system show results in sane order
Date: Tue, 5 Oct 2010 14:07:21 -0500
Message-ID: <1286305641-23388-1-git-send-email-msm@freescale.com>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, when we run the following

$> dtc -I fs -O dts /proc/device-tree

We get the output in a "reverse order", this patch will reverse that
output order and should resemble your initial device more closely

Code copied over from kexec-tools

Signed-off-by: Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 fstree.c |   29 ++++++++++++++++++++++-------
 1 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fstree.c b/fstree.c
index f377453..fd2658d 100644
--- a/fstree.c
+++ b/fstree.c
@@ -23,21 +23,35 @@
 #include <dirent.h>
 #include <sys/stat.h>
 
+static int comparefunc(const void *dentry1, const void *dentry2)
+{
+	const char *str1 = (*(struct dirent * const *)dentry1)->d_name;
+	const char *str2 = (*(struct dirent * const *)dentry2)->d_name;
+
+	if (strchr(str1, '@') && strchr(str2, '@') &&
+		(strlen(str1) > strlen(str2)))
+		return 1;
+
+	return strcmp(str1, str2);
+}
+
 static struct node *read_fstree(const char *dirname)
 {
-	DIR *d;
-	struct dirent *de;
 	struct stat st;
 	struct node *tree;
+	struct dirent **namelist;
+	int numlist, i;
 
-	d = opendir(dirname);
-	if (!d)
-		die("Couldn't opendir() \"%s\": %s\n", dirname, strerror(errno));
+	numlist = scandir(dirname, &namelist, 0, comparefunc);
+	if (numlist <= 0)
+		die("unrecoverable error: could not scan \"%s\": %s\n",
+                    dirname, strerror(errno));
 
 	tree = build_node(NULL, NULL);
 
-	while ((de = readdir(d)) != NULL) {
+	for (i = 0; i < numlist; i++) {
 		char *tmpnam;
+		struct dirent *de = namelist[i];
 
 		if (streq(de->d_name, ".")
 		    || streq(de->d_name, ".."))
@@ -72,10 +86,11 @@ static struct node *read_fstree(const char *dirname)
 			add_child(tree, newchild);
 		}
 
+		free(de);
 		free(tmpnam);
 	}
+	free(namelist);
 
-	closedir(d);
 	return tree;
 }
 
-- 
1.6.0.6
