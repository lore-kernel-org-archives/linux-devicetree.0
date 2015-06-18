From: <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Documentation: DT: Fix a typo in the filename
 "lantiq,<chip>-pinumx.txt"
Date: Thu, 18 Jun 2015 18:19:02 +0000
Message-ID: <593AEF6C47F46446852B067021A273D6FBC08AD6@MUCSE037.lantiq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>

To fix it, use the chance to rename according the compatible string,
which is "lantiq,pinctrl-falcon" and  "lantiq,pinctrl-xway"

Signed-off-by: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>
Cc: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
I am not sure who else should be added to Cc: as this is no new binding, only fixing a typo.

 .../pinctrl/{lantiq,falcon-pinumx.txt => lantiq,pinctrl-falcon.txt}    |    0
 .../pinctrl/{lantiq,xway-pinumx.txt => lantiq,pinctrl-xway.txt}        |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{lantiq,falcon-pinumx.txt => lantiq,pinctrl-falcon.txt} (100%)
 rename Documentation/devicetree/bindings/pinctrl/{lantiq,xway-pinumx.txt => lantiq,pinctrl-xway.txt} (100%)

diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-falcon.txt
similarity index 100%
rename from Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt
rename to Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-falcon.txt
diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
similarity index 100%
rename from Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt
rename to Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
-- 
1.7.10.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
