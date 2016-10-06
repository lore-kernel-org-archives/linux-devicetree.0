From: Vijay Kumar <vijay.ac.kumar@oracle.com>
Subject: [PATCH v2 2/2] Documentation/ABI: Added ABI information for devspec and obppath.
Date: Thu,  6 Oct 2016 12:06:12 -0700
Message-ID: <1475780772-252393-2-git-send-email-vijay.ac.kumar@oracle.com>
References: <1475780772-252393-1-git-send-email-vijay.ac.kumar@oracle.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475780772-252393-1-git-send-email-vijay.ac.kumar@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vijay.ac.kumar@oracle.com
List-Id: devicetree@vger.kernel.org

Updated Documentation/ABI for devspec and obppath sysfs entries.

Signed-off-by: Vijay Kumar <vijay.ac.kumar@oracle.com>
---
 Documentation/ABI/stable/sysfs-devices |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-devices b/Documentation/ABI/stable/sysfs-devices
index df449d7..35c457f 100644
--- a/Documentation/ABI/stable/sysfs-devices
+++ b/Documentation/ABI/stable/sysfs-devices
@@ -8,3 +8,17 @@ Description:
 		Any device associated with a device-tree node will have
 		an of_path symlink pointing to the corresponding device
 		node in /sys/firmware/devicetree/
+
+What:		/sys/devices/*/devspec
+Date:		October 2016
+Contact:	Device Tree mailing list <devicetree@vger.kernel.org>
+Description:
+		If CONFIG_OF is enabled, then this file is present. When
+		read, it returns full name of the device node.
+
+What:		/sys/devices/*/obppath
+Date:		October 2016
+Contact:	Device Tree mailing list <devicetree@vger.kernel.org>
+Description:
+		If CONFIG_OF is enabled, then this file is present. When
+		read, it returns full name of the device node.
-- 
1.7.1
