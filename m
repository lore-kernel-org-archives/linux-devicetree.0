From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] mfd: arizona: Update DT binding documentation for inmode
Date: Mon,  9 Mar 2015 14:48:20 +0000
Message-ID: <1425912500-28450-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Update the DT binding documentation for the inmode binding to mention
the new defines and clarify the text slightly.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 7665aa95..cbcd2d6 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -49,12 +49,11 @@ Optional properties:
     a value that is out of range for a 16 bit register then the chip default
     will be used. If present exactly five values must be specified.
 
-  - wlf,inmode : A list of INn_MODE register values, where n is the number
-    of input signals. Valid values are 0 (Differential), 1 (Single-ended) and
-    2 (Digital Microphone). If absent, INn_MODE registers set to 0 by default.
-    If present, values must be specified less than or equal to the number of
-    input singals. If values less than the number of input signals, elements
-    that has not been specifed are set to 0 by default.
+  - wlf,inmode : A list of the mode for each input. Each input can be set to
+    differential, single-ended or a digital microphone. Defines for all values
+    (ARIZONA_INMODE_xxxx) are located in <dt-bindings/mfd/arizona.txt>. If
+    present, the number of values should be less than or equal to the number
+    of inputs, unspecified inputs will use the chip default.
 
   - wlf,dmic-ref : DMIC reference voltage source for each input, can be
     selected from either MICVDD or one of the MICBIAS's, defines
-- 
1.7.2.5
