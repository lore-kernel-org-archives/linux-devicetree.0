From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2] checkpatch: handle PCI/USB VID,PID in DT compatible
Date: Fri, 22 Feb 2019 18:24:40 -0800
Message-ID: <20190223022440.146915-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Documentation/devicetree/bindings/usb/usb-device.txt describes the
'usbVID,...' compatible format, where VID is lower-case hexadecimal,
with leading zeroes suppressed. Allow it here without complaining about
lack of documentation (we don't need a new entry for every ID).

PCI has a similar format
Documentation/devicetree/bindings/pci/pci.txt
http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf

For both, I try to detect something that's close to a VID,PID, but I
intentionally don't parse beyond 4 characters of PID, since USB supports
extending with an interface index, and PCI supports additional subystem
IDs.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Overall, this got a little more unwieldy, but it works.

v2:
 * Include PCI in addition to USB
 * Add special warning for leading zeroes and for upper-case
 * Move the VID,PID check up higher, so we don't complain about
   documentation at all if using the correct format
---
 scripts/checkpatch.pl | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b737ca9d7204..9e770a8f5dfa 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3001,6 +3001,24 @@ sub process {
 			my $vp_file = $dt_path . "vendor-prefixes.txt";
 
 			foreach my $compat (@compats) {
+				my ($vendor, $device) = ("", "");
+				if ($compat =~ /^([a-zA-Z0-9\-]+)\,(.*)$/) {
+					($vendor, $device) = ($1, $2);
+				}
+
+				# PCI and USB VIDs/PIDs have special rules.
+				if ($vendor =~ /^(usb|pci)[0-9a-fA-F]{1,4}$/ && $device =~ /^[0-9a-fA-F]{1,4}/) {
+					if ($vendor =~ /^(usb|pci).*[A-F]/ || $device =~ /[A-F]/) {
+						WARN("UNDOCUMENTED_DT_STRING",
+						     "VID/PID in DT compatible string (\"$compat\") should use lower-case hexadecimal\n" . $herecurr);
+					}
+					if ($vendor =~ /^(usb|pci)0/ || $device =~ /^0/) {
+						WARN("UNDOCUMENTED_DT_STRING",
+						     "VID/PID in DT compatible string (\"$compat\") should omit leading zeroes\n" . $herecurr);
+					}
+					next;
+				}
+
 				my $compat2 = $compat;
 				$compat2 =~ s/\,[a-zA-Z0-9]*\-/\,<\.\*>\-/;
 				my $compat3 = $compat;
@@ -3011,8 +3029,7 @@ sub process {
 					     "DT compatible string \"$compat\" appears un-documented -- check $dt_path\n" . $herecurr);
 				}
 
-				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
-				my $vendor = $1;
+				next if "$vendor" eq "";
 				`grep -Eq "^$vendor\\b" $vp_file`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
-- 
2.21.0.rc0.258.g878e2cd30e-goog
