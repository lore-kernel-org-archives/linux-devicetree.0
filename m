From: Rob Herring <robh@kernel.org>
Subject: [PATCH] checkpatch: Warn if DT bindings are not in schema format
Date: Fri, 13 Sep 2019 16:13:49 -0500
Message-ID: <20190913211349.28245-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>
List-Id: devicetree@vger.kernel.org

DT bindings are moving to using a json-schema based schema format
instead of freeform text. Add a checkpatch.pl check to encourage using
the schema for new bindings. It's not yet a requirement, but is
progressively being required by some maintainers.

Cc: Andy Whitcroft <apw@canonical.com>
Cc: Joe Perches <joe@perches.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 93a7edfe0f05..1cbd85f16e32 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2822,6 +2822,14 @@ sub process {
 			     "added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
 		}
 
+# Check for adding new DT bindings not in schema format
+		if (!$in_commit_log &&
+		    ($line =~ /^new file mode\s*\d+\s*$/) &&
+		    ($realfile =~ m@^Documentation/devicetree/bindings/.*\.txt$@)) {
+			WARN("DT_SCHEMA_BINDING_PATCH",
+			     "DT bindings should be in DT schema format. See: Documentation/devicetree/writing-schema.rst\n");
+		}
+
 # Check for wrappage within a valid hunk of the file
 		if ($realcnt != 0 && $line !~ m{^(?:\+|-| |\\ No newline|$)}) {
 			ERROR("CORRUPTED_PATCH",
-- 
2.20.1
