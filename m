From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 2/2] dt-bindings: display: clps711x-fb: fix native-mode setting
Date: Sat,  5 Oct 2019 15:09:21 +0200
Message-ID: <20191005130921.12874-3-martin@kaiser.cx>
References: <20190918193853.25689-1-martin@kaiser.cx>
 <20191005130921.12874-1-martin@kaiser.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191005130921.12874-1-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Alexander Shiyan <shc_work@mail.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

Move the native-mode setting inside the display-timing node. Outside of
display-timing, it is ignored.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
changes in v2
 fix the example in this binding as well

 Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt b/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
index b0e506610400..0ab5f0663611 100644
--- a/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
+++ b/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
@@ -27,11 +27,11 @@ Example:
 
 	display: display {
 		model = "320x240x4";
-		native-mode = <&timing0>;
 		bits-per-pixel = <4>;
 		ac-prescale = <17>;
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: 320x240 {
 				hactive = <320>;
 				hback-porch = <0>;
-- 
2.11.0
