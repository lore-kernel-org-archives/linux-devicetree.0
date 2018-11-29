Return-Path: <SRS0=eLSC=OI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: rtc: pcf85363: Document pcf85263 real-time clock
Date: Thu, 29 Nov 2018 16:54:43 +0000
Message-Id: <1543510486-29532-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543510486-29532-1-git-send-email-biju.das@bp.renesas.com>
References: <1543510486-29532-1-git-send-email-biju.das@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The pcf85263 RTC is compatible with the pcf85363 RTC.

The difference between the pcf85263 and pcf85363 RTC is that the latter has
64 bytes more RAM. This renders them incompatible from a DT point of view.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
  V1-->V2 Incorporated Simon's review comment.
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
