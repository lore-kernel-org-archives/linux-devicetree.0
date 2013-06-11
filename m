From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: [PATCH 1/4] ARM: dts: OMAP3: Include IRQ header
Date: Tue, 11 Jun 2013 16:49:46 +0200
Message-ID: <1370962189-9689-2-git-send-email-florian.vaussard@epfl.ch>
References: <1370962189-9689-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1370962189-9689-1-git-send-email-florian.vaussard@epfl.ch>
Sender: linux-omap-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-omap@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Florian Vaussard <florian.vaussard@epfl.ch>
List-Id: devicetree@vger.kernel.org

Some nodes in OMAP3 DTS now use edge or level sensitive interrupts.

Signed-off-by: Florian Vaussard <florian.vaussard@epfl.ch>
---
 arch/arm/boot/dts/omap3.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 6d05ee0..8e1a87f 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/omap.h>
 
 #include "skeleton.dtsi"
-- 
1.7.5.4

