From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: [PATCH v2 1/2] checkpatch: check vendor compatible with dashes
Date: Fri, 28 Feb 2014 17:25:41 +0100
Message-ID: <1393604742-14317-2-git-send-email-florian.vaussard@epfl.ch>
References: <1393604742-14317-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393604742-14317-1-git-send-email-florian.vaussard@epfl.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The current vendor compatible check will not match vendors with
dashes, like:

compatible="asahi-kasei"

Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Florian Vaussard <florian.vaussard@epfl.ch>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 464dcef..e304e77 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2058,7 +2058,7 @@ sub process {
 				my $vendor = $compat;
 				my $vendor_path = $dt_path . "vendor-prefixes.txt";
 				next if (! -f $vendor_path);
-				$vendor =~ s/^([a-zA-Z0-9]+)\,.*/$1/;
+				$vendor =~ s/^([a-zA-Z0-9\-]+)\,.*/$1/;
 				`grep -Eq "$vendor" $vendor_path`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
-- 
1.8.5.3
