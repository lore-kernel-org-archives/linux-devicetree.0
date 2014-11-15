From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V8 10/14] Documentation: devicetree: Add vendor prefix for
 parade
Date: Sat, 15 Nov 2014 15:25:05 +0530
Message-ID: <1416045309-13359-11-git-send-email-ajaykumar.rs@samsung.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, seanpaul@google.com, thierry.reding@gmail.com, daniel.vetter@ffwll.ch, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: devicetree@vger.kernel.org

ps8622 eDP-LVDS converter bridge chip is from parade technologies

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 723999d..0be1508 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -110,6 +110,7 @@ nxp	NXP Semiconductors
 onnn	ON Semiconductor Corp.
 opencores	OpenCores.org
 panasonic	Panasonic Corporation
+parade	Parade Technologies Inc.
 phytec	PHYTEC Messtechnik GmbH
 picochip	Picochip Ltd
 plathome	Plat'Home Co., Ltd.
-- 
1.7.9.5
