From: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V3 1/2] devicetree/bindings: Add binding for operator panel on FSP machines
Date: Thu, 28 Apr 2016 17:02:37 +1000
Message-ID: <1461826958-3925-1-git-send-email-sjitindarsingh@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a binding to Documentation/devicetree/bindings/powerpc/opal
(oppanel-opal.txt) for the operator panel which is present on IBM
Power Systems machines with FSPs.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

---

Change Log:

V1 -> V2:
	- Nothing
V2 -> V3:
	- Change "IBM pseries machines" to "IBM Power Systems machines"
	in the commit message for improved clarity.
---
 .../devicetree/bindings/powerpc/opal/oppanel-opal.txt      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/opal/oppanel-opal.txt

diff --git a/Documentation/devicetree/bindings/powerpc/opal/oppanel-opal.txt b/Documentation/devicetree/bindings/powerpc/opal/oppanel-opal.txt
new file mode 100644
index 0000000..dffb791
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/opal/oppanel-opal.txt
@@ -0,0 +1,14 @@
+IBM OPAL Operator Panel Binding
+-------------------------------
+
+Required properties:
+- compatible : Should be "ibm,opal-oppanel".
+- #lines     : Number of lines on the operator panel e.g. <0x2>.
+- #length    : Number of characters per line of the operator panel e.g. <0x10>.
+
+Example:
+	oppanel {
+		compatible = "ibm,opal-oppanel";
+		#lines = <0x2>;
+		#length = <0x10>;
+	};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
