From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 5/5] media: dt-bindings: si470x: Document new reset-gpios property
Date: Wed,  5 Dec 2018 16:47:50 +0100
Message-ID: <20181205154750.17996-6-pawel.mikolaj.chmiel@gmail.com>
References: <20181205154750.17996-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205154750.17996-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: hverkuil@xs4all.nl, fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

Add information about new reset-gpios property to driver documentation

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 Documentation/devicetree/bindings/media/si470x.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/si470x.txt b/Documentation/devicetree/bindings/media/si470x.txt
index 9294fdfd3aae..a9403558362e 100644
--- a/Documentation/devicetree/bindings/media/si470x.txt
+++ b/Documentation/devicetree/bindings/media/si470x.txt
@@ -10,6 +10,7 @@ Required Properties:
 
 Optional Properties:
 - interrupts : The interrupt number
+- reset-gpios: GPIO specifier for the chips reset line
 
 Example:
 
@@ -20,5 +21,6 @@ Example:
 
                 interrupt-parent = <&gpj2>;
                 interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+                reset-gpios = <&gpj2 5 GPIO_ACTIVE_HIGH>;
         };
 };
-- 
2.17.1
