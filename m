From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] checkpatch.pl: Add SPDX license tag check for dts files and headers
Date: Thu, 23 Feb 2017 09:56:44 -0600
Message-ID: <20170223155644.24213-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a check for using SPDX-License-Identifier tags to define the license of
.dts{i} and DT header files rather than using free form license text. This
check looks for GPL, BSD, or X11(really incorrectly labeled MIT license)
license text which are the commonly used DT licenses.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
---
 scripts/checkpatch.pl | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 982c52ca6473..ce802b3146e3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2139,6 +2139,7 @@ sub process {
 	my $commit_log_has_diff = 0;
 	my $reported_maintainer_file = 0;
 	my $non_utf8_charset = 0;
+	my $licensefile = '';
 
 	my $last_blank_line = 0;
 	my $last_coalesced_string_linenr = -1;
@@ -2805,6 +2806,18 @@ sub process {
 			}
 		}
 
+# check for using SPDX tag instead of free form license text in dts and binding header files
+		if ($licensefile ne $realfile &&
+		    ($realfile =~ /\.dtsi?$/ || $realfile =~ /dt-bindings\/.*\.h$/) &&
+		    $rawline !~ /\bSPDX-License-Identifier/ &&
+		    ($rawline =~ /^\+.*\bGeneral\s+Public\s+License/i ||
+		    $rawline =~ /^\+.*\bTHE\s+SOFTWARE\s+IS\s+PROVIDED\s+\"AS\s+IS\"/i ||
+		    $rawline =~ /^\+.*\b(GPL|BSD|X11)/)) {
+			$licensefile = $realfile;
+			WARN("SPDX_LICENSE_TAG",
+			     "Use SPDX-License-Identifier tags instead of full license text\n" . $herecurr);
+		}
+
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);
 
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
