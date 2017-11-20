From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Mon, 20 Nov 2017 11:50:00 -0800
Message-ID: <20171120195000.2070-1-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>, nathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The RISC-V privileged ISA mandates the presence of an SBI, but there's
no reason not to put it in the device tree.  This would allow us to
possibly remove the SBI later.

CC: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Signed-off-by: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/firmware/riscv.sbi.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/riscv.sbi.txt

diff --git a/Documentation/devicetree/bindings/firmware/riscv.sbi.txt b/Documentation/devicetree/bindings/firmware/riscv.sbi.txt
new file mode 100644
index 000000000000..42384d5d52cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/riscv.sbi.txt
@@ -0,0 +1,20 @@
+RISC-V Supervisor Binary Interface (SBI)
+
+The RISC-V privileged ISA specification mandates the presence of a supervisor
+binary interface that performs some operations which might otherwise require
+particularly complicated instructions.  This interface includes
+inter-processor interrupts, TLB flushes, i-cache and TLB shootdowns, a
+console, and power management.
+
+Required properties:
+- compatible: must contain one of the following
+ * "riscv,sbi" for the SBI defined by the privileged specification of the
+   system.
+
+Example:
+
+firmware {
+	sbi {
+		compatible = "riscv,sbi";
+	};
+};
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
