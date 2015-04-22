From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Fwd: [PATCH 13/13] coresight: document the bindings for the ATCLK
Date: Wed, 22 Apr 2015 14:59:51 +0200
Message-ID: <CACRpkda09x4_vOQcJAe019nNVDUWyQsy1uF8vG8xxStVsCL1kQ@mail.gmail.com>
References: <1429534746-3068-1-git-send-email-linus.walleij@linaro.org>
	<1429534746-3068-13-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429534746-3068-13-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A copy to the devicetree list if something'd be controversial
about this uncontroversial change.


Linus

---------- Forwarded message ----------
From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Mon, Apr 20, 2015 at 2:59 PM
Subject: [PATCH 13/13] coresight: document the bindings for the ATCLK


Put in a blurb in the device tree bindings indicating that
coresight blocks may have an optional ATCLK.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/coresight.txt | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt
b/Documentation/devicetree/bindings/arm/coresight.txt
index 88602b75418e..8711c1065479 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -21,11 +21,14 @@ its hardware characteristcs.
        * reg: physical base address and length of the register
          set(s) of the component.

-       * clocks: the clock associated to this component.
-
-       * clock-names: the name of the clock as referenced by the code.
-         Since we are using the AMBA framework, the name should be
-         "apb_pclk".
+       * clocks: the clocks associated to this component.
+
+       * clock-names: the name of the clocks referenced by the code.
+         Since we are using the AMBA framework, the name of the clock
+         providing the interconnect should be "apb_pclk", and some
+         coresight blocks also have an additional clock "atclk", which
+         clocks the core of that coresight component. The latter clock
+         is optional.

        * port or ports: The representation of the component's port
          layout using the generic DT graph presentation found in
--
1.9.3
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
