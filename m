From: naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH RESEND v2 2/2] DT: eFuse: Add binding document for IMG Generic eFuse Controller
Date: Sat, 22 Nov 2014 08:24:33 +0530
Message-ID: <1416624873-7823-3-git-send-email-Naidu.Tellapati@gmail.com>
References: <1416624873-7823-1-git-send-email-Naidu.Tellapati@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416624873-7823-1-git-send-email-Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Add binding document for Imagination Technologies Generic eFuse Controller
present on Pistachio SoC.

Signed-off-by: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/soc/img/img-efuse.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/img/img-efuse.txt

diff --git a/Documentation/devicetree/bindings/soc/img/img-efuse.txt b/Documentation/devicetree/bindings/soc/img/img-efuse.txt
new file mode 100644
index 0000000..e87738f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/img/img-efuse.txt
@@ -0,0 +1,18 @@
+* Imagination Technologies Generic eFuse controller
+
+Required properties:
+- compatible: Must be "img,efuse".
+- reg: Must contain the base address and length of the eFuse registers.
+- clocks: Must contain an entry for each entry in clock-names.
+  See ../clock/clock-bindings.txt for details.
+- clock-names: Must include the following entries:
+  - osc: External oscillator clock
+  - sys: eFuse system interface clock
+
+Example:
+efuse: efuse@18149200 {
+       compatible = "img,efuse";
+       reg = <0x18149200 0x200>;
+       clocks = <&osc>, <&system_clk>;
+       clock-names = "osc", "sys";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
