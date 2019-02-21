Return-Path: <SRS0=8Fol=Q4=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/5] rtc: rx8581: Add rx8571 compatible
Date: Thu, 21 Feb 2019 09:40:44 +0000
Message-Id: <1550742048-28068-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
References: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The Epson rx8571 is compatible with the Epson rx8581 RTC.

The difference between the rx8571 and rx8581 RTC is that the former has
16 bytes more RAM. This renders them incompatible from a DT point of view.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/rtc/rtc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
index 3e6a215..0bc687e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -47,6 +47,7 @@ dallas,ds1374		I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and
 dallas,ds1672		Dallas DS1672 Real-time Clock
 dallas,ds3232		Extremely Accurate I²C RTC with Integrated Crystal and SRAM
 epson,rx8010		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
+epson,rx8571		I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
 epson,rx8581		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
 emmicro,em3027		EM Microelectronic EM3027 Real-time Clock
 isil,isl1208		Intersil ISL1208 Low Power RTC with Battery Backed SRAM
-- 
2.7.4
