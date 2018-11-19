From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/16] dt-bindings: Add RDA Micro vendor prefix
Date: Mon, 19 Nov 2018 22:39:24 +0530
Message-ID: <20181119170939.19153-2-manivannan.sadhasivam@linaro.org>
References: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: olof@lixom.net, arnd@arndb.de, robh+dt@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, daniel.lezcano@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, amit.kucheria@linaro.org, linus.walleij@linaro.org, zhao_steven@263.net, service@rdamicro.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

From: Andreas Färber <afaerber@suse.de>

RDA Microelectronics is a Chinese SoC manufacturer.

Cc: service@rdamicro.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8fcc16..b15012454d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -320,6 +320,7 @@ ralink	Mediatek/Ralink Technology Corp.
 ramtron	Ramtron International
 raspberrypi	Raspberry Pi Foundation
 raydium	Raydium Semiconductor Corp.
+rda	RDA Microelectronics, Inc.
 realtek Realtek Semiconductor Corp.
 renesas	Renesas Electronics Corporation
 richtek	Richtek Technology Corporation
-- 
2.17.1
