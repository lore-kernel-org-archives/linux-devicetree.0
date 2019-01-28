Return-Path: <SRS0=/eZE=QE=ysoft.com=michal.vokac@kernel.org>
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH RESEND v2 1/4] dt-bindings: display: ssd1307fb: Remove reset-active-low from examples
Date: Mon, 28 Jan 2019 12:53:00 +0100
Message-Id: <1548676383-29685-2-git-send-email-michal.vokac@ysoft.com>
In-Reply-To: <1548676383-29685-1-git-send-email-michal.vokac@ysoft.com>
References: <1548676383-29685-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-ID: <devicetree@vger.kernel.org>

The reset-active-low property has been removed brom the binding a while
ago. So remove it from the examples as well.

Fixes: 519b4db ("fbdev: ssd1307fb: Remove reset-active-low from the DT binding document")
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes in v2 resend:
 - Add R-by from Alexandre.

Changes from v1:
 - Add R-by from Rob

 Documentation/devicetree/bindings/display/ssd1307fb.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
index 209d931..b67f8ca 100644
--- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
+++ b/Documentation/devicetree/bindings/display/ssd1307fb.txt
@@ -36,7 +36,6 @@ ssd1307: oled@3c {
         reg = <0x3c>;
         pwms = <&pwm 4 3000>;
         reset-gpios = <&gpio2 7>;
-        reset-active-low;
 };
 
 ssd1306: oled@3c {
@@ -44,7 +43,6 @@ ssd1306: oled@3c {
         reg = <0x3c>;
         pwms = <&pwm 4 3000>;
         reset-gpios = <&gpio2 7>;
-        reset-active-low;
         solomon,com-lrremap;
         solomon,com-invdir;
         solomon,com-offset = <32>;
-- 
2.1.4
