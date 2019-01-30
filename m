Return-Path: <SRS0=ERvF=QG=linaro.org=linus.walleij@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] dt-bindings: Add a prefix for Gateworks Corporation
Date: Wed, 30 Jan 2019 21:20:05 +0100
Message-Id: <20190130202005.17561-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Imre Kaloz <kaloz@openwrt.org>, Tim Harvey <tharvey@gateworks.com>
List-ID: <devicetree@vger.kernel.org>

As I am adding a PLD GPIO driver for Gateworks, we need
their prefix among the vendors.

Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Rob: you can either apply this to your tree of ACK and I
will put it in the GPIO tree.
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..c9af4e33f00b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -141,6 +141,7 @@ focaltech	FocalTech Systems Co.,Ltd
 friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd
 fsl	Freescale Semiconductor
 fujitsu	Fujitsu Ltd.
+gateworks	Gateworks Corporation
 gcw Game Consoles Worldwide
 ge	General Electric Company
 geekbuying	GeekBuying
-- 
2.20.1
