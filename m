Return-Path: <SRS0=lwod=N6=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  1/4] dt-bindings: rtc: pcf85363: Document pcf85263 real-time clock
Date: Mon, 19 Nov 2018 11:15:05 +0000
Message-Id: <1542626108-61344-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1542626108-61344-1-git-send-email-biju.das@bp.renesas.com>
References: <1542626108-61344-1-git-send-email-biju.das@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch adds binding for NXP pcf85263 real-time clock. pcf85263 rtc is
compatible with pcf85363 rtc except that pcf85363 has 64 bytes additional
RAM.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/rtc/pcf85363.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
index 76fdabc..94adc1c 100644
--- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
+++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
@@ -1,8 +1,8 @@
-NXP PCF85363 Real Time Clock
+NXP PCF85263/PCF85363 Real Time Clock
 ============================
 
 Required properties:
-- compatible: Should contain "nxp,pcf85363".
+- compatible: Should contain "nxp,pcf85263" or "nxp,pcf85363".
 - reg: I2C address for chip.
 
 Optional properties:
-- 
2.7.4
