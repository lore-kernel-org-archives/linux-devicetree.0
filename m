From: Rob Herring <robh@kernel.org>
Subject: [PATCH] checkpatch.pl: Update DT vendor prefix check
Date: Wed, 22 May 2019 10:12:38 -0500
Message-ID: <20190522151238.25176-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Joe Perches <joe@perches.com>
List-Id: devicetree@vger.kernel.org

In commit 8122de54602e ("dt-bindings: Convert vendor prefixes to
json-schema"), vendor-prefixes.txt has been converted to a DT schema.
Update the checkpatch.pl DT check to extract vendor prefixes from the new
vendor-prefixes.yaml file.

Fixes: 8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
Cc: Joe Perches <joe@perches.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bb28b178d929..073051a4471b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3027,7 +3027,7 @@ sub process {
 			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
 
 			my $dt_path = $root . "/Documentation/devicetree/bindings/";
-			my $vp_file = $dt_path . "vendor-prefixes.txt";
+			my $vp_file = $dt_path . "vendor-prefixes.yaml";
 
 			foreach my $compat (@compats) {
 				my $compat2 = $compat;
@@ -3042,7 +3042,7 @@ sub process {
 
 				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
 				my $vendor = $1;
-				`grep -Eq "^$vendor\\b" $vp_file`;
+				`grep -oE "\\"\\^[a-zA-Z0-9]+" $vp_file | grep -q "$vendor"`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
 					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vp_file\n" . $herecurr);
-- 
2.20.1
