From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] checkpatch: add DT compatible string documentation check
Date: Tue, 26 Nov 2013 10:01:15 -0600
Message-ID: <1385481675-26675-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This adds a simple check that any compatible strings in DeviceTree dts
files are present in Documentation/devicetree/bindings. This should be a
temporary check until we have more sophisticated binding schema checking.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
---
 scripts/checkpatch.pl | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9c98100..3fc3517 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2034,6 +2034,21 @@ sub process {
 			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
 		}
 
+# check for compatible documentation
+		if ($realfile =~ /\.dts/ && $rawline =~ /\+\s*compatible\s*=/) {
+			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,]+)\"/g;
+
+			foreach my $compat (@compats) {
+				my $compat2 = $compat;
+				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
+				`egrep -rq "$compat|$compat2" "Documentation/devicetree/bindings/"`;
+				if ( $? >> 8 ) {
+					WARN("UNDOCUMENTED_DT_BINDING",
+					     "DT compatible string \"$compat\" appears un-documented -- check Documentation/devicetree/bindings/\n" . $herecurr);
+				}
+			}
+		}
+
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|s|S|pl|sh)$/);
 
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
