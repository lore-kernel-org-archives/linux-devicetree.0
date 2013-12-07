From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v2 1/1] dts: bindings: doc fix, zero cell clock specifiers are valid
Date: Sat,  7 Dec 2013 14:22:32 +0100
Message-ID: <1386422552-7287-1-git-send-email-gsi@denx.de>
References: <1385999579-3184-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385999579-3184-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

fix a typo in the common clock binding's "clock specifiers" discussion,
and clarify the fact that the sequence of integer cells that go with the
clock provider's phandle and form "the clock specifier" may be empty

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>

---

changes in v2:
- patch: "zero or more cells" form a clock specifier
- commit msg: more specific title and description

---
 Documentation/devicetree/bindings/clock/clock-bindings.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index eb65d417f8c4..01b6a0caaa81 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -5,7 +5,7 @@ Sources of clock signal can be represented by any node in the device
 tree.  Those nodes are designated as clock providers.  Clock consumer
 nodes use a phandle and clock specifier pair to connect clock provider
 outputs to clock inputs.  Similar to the gpio specifiers, a clock
-specifier is an array of one more more cells identifying the clock
+specifier is an array of zero or more cells identifying the clock
 output on a device.  The length of a clock specifier is defined by the
 value of a #clock-cells property in the clock provider node.
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
