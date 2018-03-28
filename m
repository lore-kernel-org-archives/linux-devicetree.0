From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 1/4] dt-bindings: timer: tpm: fix typo of clock name
Date: Wed, 28 Mar 2018 11:22:35 +0800
Message-ID: <1522207358-8388-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Linux-imx@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The clock name should be ipg instead of igp.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
index b4aa7dd..f82087b 100644
--- a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
+++ b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
@@ -15,7 +15,7 @@ Required properties:
 - interrupts :	Should be the clock event device interrupt.
 - clocks :	The clocks provided by the SoC to drive the timer, must contain
 		an entry for each entry in clock-names.
-- clock-names : Must include the following entries: "igp" and "per".
+- clock-names : Must include the following entries: "ipg" and "per".
 
 Example:
 tpm5: tpm@40260000 {
-- 
2.7.4
