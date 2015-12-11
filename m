From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] mfd: arizona: Update binding docs for selecting mono/stereo outputs
Date: Fri, 11 Dec 2015 10:28:23 +0000
Message-ID: <1449829703-600-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1449829703-600-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449829703-600-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Update the device tree binding documentation to include the wlf,out-mono
property that is used to specify whether each output is a mono or stereo
output.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 2b6ccdb..489dd07 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -65,6 +65,10 @@ Optional properties:
     that have not been specified are set to 0 by default. Entries are:
     <IN1, IN2, IN3, IN4> (wm5102, wm5110, wm8280, wm8997)
     <IN1A, IN2A, IN1B, IN2B> (wm8998, wm1814)
+  - wlf,out-mono : A boolean indicating whether each output is mono or stereo.
+    A non-zero value indicates a mono output. If present, the number of values
+    should be less than or equal to the number of outputs, if less values are
+    supplied the additional outputs will be treated as stereo.
 
   - wlf,dmic-ref : DMIC reference voltage source for each input, can be
     selected from either MICVDD or one of the MICBIAS's, defines
-- 
2.1.4
