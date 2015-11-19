From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 6/6] extcon: arizona: Update DT binding documentation for jack detection
Date: Thu, 19 Nov 2015 15:45:40 +0000
Message-ID: <1447947940-3054-7-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add additional bindings for both inverting the polarity of the jack
detection pins and allowing the use of a second jack detection pin. Note
that the second jack detection pin is hard wired in the chip so can only
be enabled through the binding, rather than a pin being specified.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 .../devicetree/bindings/extcon/extcon-arizona.txt  |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
index d661811..7640a35 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -14,6 +14,12 @@ Optional properties:
     If this node is not mentioned or if the value is unknown, then
     headphone detection mode is set to HPDETL.
 
+  - wlf,use-jd-gpio : Use GPIO input along with JD1 for dual pin jack
+    detection.
+  - wlf,use-jd-gpio-nopull : Internal pull on GPIO is disabled when used for
+    jack detection.
+  - wlf,jd-invert : Invert the polarity of the jack detection switch
+
   - wlf,micd-software-compare : Use a software comparison to determine mic
     presence
   - wlf,micd-detect-debounce : Additional software microphone detection
-- 
1.7.2.5
