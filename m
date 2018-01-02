From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: h8300 clocksource: correct spelling of pulse
Date: Tue,  2 Jan 2018 10:56:32 +0100
Message-ID: <20180102095632.18657-1-horms+renesas@verge.net.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Correct what appears to be a typo in the spelling of pulse.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/timer/renesas,tpu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tpu.txt b/Documentation/devicetree/bindings/timer/renesas,tpu.txt
index f8b25897fb31..1d46f9de4feb 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tpu.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,tpu.txt
@@ -1,4 +1,4 @@
-* Renesas H8/300 Timer Pluse Unit
+* Renesas H8/300 Timer Pulse Unit
 
 The TPU is a 16bit timer/counter with configurable clock inputs and
 programmable compare match.
-- 
2.11.0
