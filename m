From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH] pinctrl: Fix path error in documentation
Date: Mon, 3 Nov 2014 10:28:11 +0800
Message-ID: <1414981691-14087-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, hc.yen@mediatek.com, eddie.huang@mediatek.com, nathan.chung@mediatek.com, yh.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Fix pinconfig include file path.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 98eb94d..47d84b6 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -216,4 +216,4 @@ arguments are described below.
   or 0 to disable debouncing
 
 More in-depth documentation on these parameters can be found in
-<include/linux/pinctrl/pinconfig-generic.h>
+<include/linux/pinctrl/pinconf-generic.h>
-- 
1.8.1.1.dirty
