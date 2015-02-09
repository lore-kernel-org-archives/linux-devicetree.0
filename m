From: Rostislav Lisovy <lisovy@gmail.com>
Subject: [PATCH 1/3] ARM: dts: Add vendor prefix for Grinn
Date: Mon,  9 Feb 2015 15:48:03 +0100
Message-ID: <1423493285-4231-1-git-send-email-lisovy@jablotron.cz>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rostislav Lisovy <lisovy@jablotron.cz>
List-Id: devicetree@vger.kernel.org

Grinn is a company located in Poland, Europe producing
System on Modules.
Webpage: http://www.grinn-global.com/

Signed-off-by: Rostislav Lisovy <lisovy@jablotron.cz>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389ca13..f6a9f25 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -77,6 +77,7 @@ giantplus	Giantplus Technology Co., Ltd.
 globalscale	Globalscale Technologies, Inc.
 gmt	Global Mixed-mode Technology, Inc.
 google	Google, Inc.
+grinn	Grinn
 gumstix	Gumstix, Inc.
 gw	Gateworks Corporation
 hannstar	HannStar Display Corporation
-- 
2.1.0

