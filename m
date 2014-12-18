From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH v2 2/2] mfd: arizona: Update DT binding to support
 OUTn_MONO init_data
Date: Thu, 18 Dec 2014 19:53:16 +0900
Message-ID: <1418899996-19744-3-git-send-email-ideal.song@samsung.com>
References: <1418899996-19744-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1418899996-19744-1-git-send-email-ideal.song@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, ckeepax@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, Inha Song <ideal.song@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch update DT binding to support OUTn_MONO init_data. Each
output signal can be configurated as a mono differential output.
The mono differential configuration is selected using the OUTn_MONO
registers.

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 7bd1273..cf11d42 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -49,6 +49,13 @@ Optional properties:
     input singals. If values less than the number of input signals, elements
     that has not been specifed are set to 0 by default.
 
+  - wlf,out-mono : A list of OUTn_MONO register values, where n is the number
+    of output signals. Valid values are 0 (Disabled) and 1 (Enabled). If absent,
+    OUTn_MONO registers set to 0 by default. If present, values must be specified
+    less than or equal to the number of output signals. If values less than the
+    number of input signals, elements that has not been specified are set to 0
+    by default.
+
   - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
     they are being externally supplied. As covered in
     Documentation/devicetree/bindings/regulator/regulator.txt
-- 
2.0.0.390.gcb682f8
