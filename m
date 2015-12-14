From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 3/3] extcon: arizona: Add DT binding examples
Date: Mon, 14 Dec 2015 10:37:13 +0000
Message-ID: <1450089433-11398-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1450089433-11398-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450089433-11398-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, robh@kernel.org
List-Id: devicetree@vger.kernel.org

Add an example for all elements of the Arizona extcon device tree
binding.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 .../devicetree/bindings/extcon/extcon-arizona.txt  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
index fd9b898..e27341f 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -47,3 +47,29 @@ Optional properties:
     The third cell represents the value of the micd-pol-gpio pin.
 
   - wlf,gpsw : Settings for the general purpose switch
+
+Example:
+
+codec: wm8280@0 {
+	compatible = "wlf,wm8280";
+	reg = <0>;
+	...
+
+	wlf,use-jd2;
+	wlf,use-jd2-nopull;
+	wlf,jd-invert;
+
+	wlf,micd-software-compare;
+	wlf,micd-detect-debounce = <0>;
+	wlf,micd-pol-gpio = <&codec 2 0>;
+	wlf,micd-rate = <ARIZONA_MICD_TIME_8MS>;
+	wlf,micd-dbtime = <4>;
+	wlf,micd-timeout-ms = <100>;
+	wlf,micd-force-micbias;
+	wlf,micd-configs = <
+		0 1 0 /* MICDET1 MICBIAS1 GPIO=low */
+		1 2 1 /* MICDET2 MICBIAS2 GPIO=high */
+	>;
+
+	wlf,gpsw = <0>;
+};
-- 
2.1.4
