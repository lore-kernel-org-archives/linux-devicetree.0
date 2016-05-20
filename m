From: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] documentation: drivers/core/of: fix name of of_node symlink
Date: Fri, 20 May 2016 14:23:38 +0200
Message-ID: <20160520122338.17701.38409.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Device Tree mailing list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
devices with an OF node") added a symlink called "of_node" to sysfs
however the documentation describes it as "of_path".

Fix the documentation to match what the code actually does.

Signed-off-by: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
---
 Documentation/ABI/stable/sysfs-devices |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-devices b/Documentation/ABI/stable/sysfs-devices
index 43f78b88d..df449d7 100644
--- a/Documentation/ABI/stable/sysfs-devices
+++ b/Documentation/ABI/stable/sysfs-devices
@@ -1,7 +1,7 @@
 # Note: This documents additional properties of any device beyond what
 # is documented in Documentation/sysfs-rules.txt
 
-What:		/sys/devices/*/of_path
+What:		/sys/devices/*/of_node
 Date:		February 2015
 Contact:	Device Tree mailing list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
 Description:

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
