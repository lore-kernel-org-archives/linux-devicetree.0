From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] extcon: arizona: Update binding example to use available defines
Date: Wed, 24 Jul 2019 10:49:14 +0100
Message-ID: <20190724094914.19284-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/devicetree/bindings/extcon/extcon-arizona.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
index 7f3d94ae81ffb..208daaff0be4f 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -72,5 +72,5 @@ codec: wm8280@0 {
 		1 2 1 /* MICDET2 MICBIAS2 GPIO=high */
 	>;
 
-	wlf,gpsw = <0>;
+	wlf,gpsw = <ARIZONA_GPSW_OPEN>;
 };
-- 
2.11.0
