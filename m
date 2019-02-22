From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] checkpatch: don't complain about "undocumented" USB VID
Date: Fri, 22 Feb 2019 14:55:45 -0800
Message-ID: <20190222225545.78031-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Documentation/devicetree/bindings/usb/usb-device.txt describes the
'usbVID,...' compatible format, where VID is hexadecimal, with leading
zeroes suppressed. Allow it here without complaining.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b737ca9d7204..124c6fc116b3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3012,6 +3012,8 @@ sub process {
 				}
 
 				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
+				# USB VIDs don't need special vendor prefix documentation.
+				next if $compat =~ /^usb[1-9a-f][0-9a-f]{0,3},/;
 				my $vendor = $1;
 				`grep -Eq "^$vendor\\b" $vp_file`;
 				if ( $? >> 8 ) {
-- 
2.21.0.rc0.258.g878e2cd30e-goog
