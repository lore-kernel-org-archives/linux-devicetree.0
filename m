From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] scripts/dtc: dt_to_config, use full path for dtx_diff
Date: Fri, 24 Jun 2016 17:56:25 -0700
Message-ID: <576DD6B9.2040303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Do not require dtx_diff to be in $PATH.

dt_to_config already needs to be run from the root directory of a kernel
tree so use scripts/dtc/dtx_diff instead of dtx_diff.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 scripts/dtc/dt_to_config |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

Index: b/scripts/dtc/dt_to_config
===================================================================
--- a/scripts/dtc/dt_to_config
+++ b/scripts/dtc/dt_to_config
@@ -871,19 +871,10 @@ sub read_dts()
 		exit 3;
 	}
 
-	if (! `which dtx_diff`) {
-		print STDERR "\n";
-		print STDERR "file 'dtx_diff' is not executable or does not exist\n";
-		print STDERR "   Is scripts/dtc/ in the shell \$PATH variable?\n";
-		print STDERR "   Are you in the root directory of a kernel tree?\n";
-		print STDERR "\n";
-		exit 3;
-	}
-
-	if (!open(DT_FILE, "-|", "dtx_diff $file")) {
+	if (!open(DT_FILE, "-|", "$dtx_diff $file")) {
 		print STDERR "\n";
 		print STDERR "shell command failed:\n";
-		print STDERR "   dtx_diff $file\n";
+		print STDERR "   $dtx_diff $file\n";
 		print STDERR "\n";
 		exit 3;
 	}
@@ -1207,6 +1198,15 @@ if ($white_list_config) {
 	}
 }
 
+if (-x "scripts/dtc/dtx_diff") {
+	$dtx_diff = "scripts/dtc/dtx_diff";
+} else {
+
+	print STDERR "\n";
+	print STDERR "$script_name must be run from the root directory of a Linux kernel tree\n";
+	print STDERR "\n";
+	exit 3;
+}
 
 for $file (@ARGV) {
 	&read_dts($file);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
