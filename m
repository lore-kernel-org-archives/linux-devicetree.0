From: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH,RESEND2] regulator: fixed, gpio: dt: regulator-name is required property
Date: Tue, 13 Feb 2018 14:43:08 +0000
Message-ID: <1518532988-10990-1-git-send-email-harald@ccbib.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These two drivers fail to probe if no name is provided. For details see:
https://www.spinics.net/lists/kernel/msg2457515.html

Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
This is already the second resend for this trivial device probing bug
fix. It was written to your specification, got an ACK from devicetree
and has no unaddressed review comments, so I can't see what might be
holding it back. If there is still anything wrong with it, I'd appreciate
actual feedback instead of a canned response or silence.

BTW, it took me a bit to figure out that by "content free ping" you are
refering to the quoting of the patch. Maybe you can reword your canned
response to make it easier to understand.

The ACK was added in the (first) resend.

 Documentation/devicetree/bindings/regulator/fixed-regulator.txt | 1 +
 Documentation/devicetree/bindings/regulator/gpio-regulator.txt  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
index 4fae41d..0c2a6c8 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
@@ -2,6 +2,7 @@ Fixed Voltage regulators
 
 Required properties:
 - compatible: Must be "regulator-fixed";
+- regulator-name: Defined in regulator.txt as optional, but required here.
 
 Optional properties:
 - gpio: gpio to use for enable control
diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
index dd1ed78..1f49615 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
@@ -2,6 +2,8 @@ GPIO controlled regulators
 
 Required properties:
 - compatible		: Must be "regulator-gpio".
+- regulator-name	: Defined in regulator.txt as optional, but required
+			  here.
 - states		: Selection of available voltages and GPIO configs.
                           if there are no states, then use a fixed regulator
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
