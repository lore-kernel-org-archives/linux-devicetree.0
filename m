From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 6/6] mfd: arizona: Update DT binding documentation for jack detection
Date: Thu, 10 Sep 2015 12:41:47 +0100
Message-ID: <1441885307-24499-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add additional bindings for both inverting the polarity of the jack
detection pins and allowing the use of a second jack detection pin. Note
that the second jack detection pin is hard wired in the chip so can only
be enabled through the binding, rather than a pin being specified.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index b98a11b..48bca6a 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -73,6 +73,12 @@ Optional properties:
     If this node is not mentioned or if the value is unknown, then
     headphone detection mode is set to HPDETL.
 
+  - wlf,use-jd-gpio : Use GPIO input alongwith JD1 for dual pin jack
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
