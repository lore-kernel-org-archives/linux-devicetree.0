From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3 v3] Documentation: dt: add the CSR atlas7 hwspinlock bindings document
Date: Tue, 19 May 2015 06:41:37 +0000
Message-ID: <1432017698-23725-2-git-send-email-21cnbao@gmail.com>
References: <1432017698-23725-1-git-send-email-21cnbao@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432017698-23725-1-git-send-email-21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: workgroup.linux-kQvG35nSl+M@public.gmane.org, Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>

The Hardware Spinlock device on atlas7 provides hardware assistance
for synchronization between the multiple processors in the system
(dual Cortex-A7, CAN bus Cortex-M3 and audio DSP).
This patch adds the DT bindings information for this hwspinlock
module.

Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Signed-off-by: Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>
Signed-off-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
---
 .../devicetree/bindings/hwlock/sirf,hwspinlock.txt | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt

diff --git a/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
new file mode 100644
index 0000000..cc6d351
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
@@ -0,0 +1,25 @@
+SIRF Hardware spinlock device Binding
+-----------------------------------------------
+
+Required properties :
+- compatible : shall contain only one of the following:
+	"sirf,hwspinlock"
+
+- reg : the register address of hwspinlock
+
+Please look at the generic hwlock binding for usage information for consumers,
+"Documentation/devicetree/bindings/hwlock/hwlock.txt"
+
+Example of hwlock provider:
+	hwlock {
+		compatible = "sirf,hwspinlock";
+		reg = <0x13240000 0x00010000>;
+		#hwlock-cells = <1>;
+	};
+
+Example of hwlock users:
+	node {
+		...
+		hwlocks = <&hwlock 2>;
+		...
+	};
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
