From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] nvmem: dt: document lpc1850 OTP binding
Date: Tue, 13 Sep 2016 18:12:40 +0200
Message-ID: <20160913161241.22492-3-manabian@gmail.com>
References: <20160913161241.22492-1-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160913161241.22492-1-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Documenation for the LPC18xx/43xx OTP memory bindings.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/nvmem/lpc1850-otp.txt        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/lpc1850-otp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/lpc1850-otp.txt b/Documentation/devicetree/bindings/nvmem/lpc1850-otp.txt
new file mode 100644
index 0000000..853b6a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/lpc1850-otp.txt
@@ -0,0 +1,20 @@
+* NXP LPC18xx OTP memory
+
+Internal OTP (One Time Programmable) memory for NXP LPC18xx/43xx devices.
+
+Required properties:
+  - compatible: Should be "nxp,lpc1850-otp"
+  - reg: Must contain an entry with the physical base address and length
+    for each entry in reg-names.
+  - address-cells: must be set to 1.
+  - size-cells: must be set to 1.
+
+See nvmem.txt for more information.
+
+Example:
+  otp: otp@40045000 {
+    compatible = "nxp,lpc1850-otp";
+    reg = <0x40045000 0x1000>;
+    #address-cells = <1>;
+    #size-cells = <1>;
+  };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
