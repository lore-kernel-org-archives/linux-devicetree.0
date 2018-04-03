From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 3/6] dt-bindings: timer: tpm: fix typo of clock name
Date: Tue,  3 Apr 2018 15:00:27 +0200
Message-ID: <1522760432-32048-3-git-send-email-daniel.lezcano@linaro.org>
References: <b2886156-4d6e-4c0c-1047-a54da8049ef6@linaro.org>
 <1522760432-32048-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522760432-32048-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

The clock name should be ipg instead of igp.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
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
