From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCH 2/2] gpio: pca953x: Add DT binding documentation for XRA1207
Date: Fri, 15 Jan 2016 15:11:40 +0100
Message-ID: <1452867100-22701-2-git-send-email-sean.nyekjaer@prevas.dk>
References: <1452867100-22701-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1452867100-22701-1-git-send-email-sean.nyekjaer@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Sean Nyekjaer <sean@nyekjaer.dk>, devicetree@vger.kernel.org, Sean Nyekjaer <sean.nyekjaer@prevas.dk>
List-Id: devicetree@vger.kernel.org

From: Sean Nyekjaer <sean@nyekjaer.dk>

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 13df993..cac0fc2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -26,6 +26,7 @@ Required properties:
 	ti,tca6424
 	ti,tca9539
 	exar,xra1202
+	exar,xra1207
 
 Example:
 
-- 
2.7.0

