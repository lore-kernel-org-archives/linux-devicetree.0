From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH v5 18/23] drivers/fsi: Document FSI master sysfs files in ABI
Date: Tue,  4 Apr 2017 21:06:02 -0500
Message-ID: <20170405020607.79939-19-cbostic@linux.vnet.ibm.com>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chris Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

From: Chris Bostic <cbostic@linux.vnet.ibm.com>

Add info for sysfs scan file in Documentaiton ABI/testing

Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
---
 Documentation/ABI/testing/sysfs-bus-fsi | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-fsi

diff --git a/Documentation/ABI/testing/sysfs-bus-fsi b/Documentation/ABI/testing/sysfs-bus-fsi
new file mode 100644
index 0000000..dfcbc1b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-fsi
@@ -0,0 +1,6 @@
+What:           /sys/bus/platform/devices/fsi-master/scan
+KernelVersion:  4.9
+Contact:        cbostic@us.ibm.com
+Description:
+                Initiates a FSI master scan for all connected
+                slave devices on its links.
-- 
1.8.2.2
