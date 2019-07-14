From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH 5/6] dt-bindings: pinctrl: Add X1500 bindings.
Date: Sun, 14 Jul 2019 11:53:55 +0800
Message-ID: <1563076436-5338-6-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Add the pinctrl bindings for the X1500 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index 7e2ee46..0014d98 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -27,6 +27,7 @@ Required properties:
     - "ingenic,jz4780-pinctrl"
     - "ingenic,x1000-pinctrl"
     - "ingenic,x1000e-pinctrl"
+    - "ingenic,x1500-pinctrl"
  - reg: Address range of the pinctrl registers.
 
 
-- 
2.7.4
