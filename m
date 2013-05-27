From: Afzal Mohammed <afzal@ti.com>
Subject: [PATCH v2 13/14] Documentation: dt: binding: serial: omap: am43x
Date: Mon, 27 May 2013 20:07:25 +0530
Message-ID: <c25bea2491ad5137ece8d924e5c20e46f6e2886b.1369658705.git.afzal@ti.com>
References: <cover.1369658705.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <cover.1369658705.git.afzal@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>, Russell King <linux@arm.linux.org.uk>, Benoit Cousson <benoit.cousson@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>
List-Id: devicetree@vger.kernel.org

AM43x uart binding.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 Documentation/devicetree/bindings/serial/omap_serial.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/omap_serial.txt b/Documentation/devicetree/bindings/serial/omap_serial.txt
index 342eedd..f37fdda 100644
--- a/Documentation/devicetree/bindings/serial/omap_serial.txt
+++ b/Documentation/devicetree/bindings/serial/omap_serial.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible : should be "ti,omap2-uart" for OMAP2 controllers
 - compatible : should be "ti,omap3-uart" for OMAP3 controllers
 - compatible : should be "ti,omap4-uart" for OMAP4 controllers
+- compatible : "ti,am4372-uart","ti,omap2-uart" for AM43x controller
 - ti,hwmods : Must be "uart<n>", n being the instance number (1-based)
 
 Optional properties:
-- 
1.7.12

