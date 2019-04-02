Return-Path: <SRS0=5rLq=SE=googlemail.com=chrysh.ng@kernel.org>
From: Christina Quast <cquast@hanoverdisplays.com>
Subject: [PATCH v2 2/6] ARM: dts: am33xx: Added AM33XX_PADCONF macro
Date: Tue,  2 Apr 2019 18:09:47 +0200
Message-Id: <20190402160949.14190-3-cquast@hanoverdisplays.com>
In-Reply-To: <20190402160949.14190-1-cquast@hanoverdisplays.com>
References: <20190314150524.GB19425@atomide.com>
 <20190402160949.14190-1-cquast@hanoverdisplays.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christina Quast <cquast@hanoverdisplays.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

AM33XX_PADCONF takes three instead of two parameters, to make
future changes to #pinctrl-cells easier.

For old boards which are not mainlined, we left the AM33XX_IOPAD
macro.

Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
---
 include/dt-bindings/pinctrl/omap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
index 49b5dea2b388..625718042413 100644
--- a/include/dt-bindings/pinctrl/omap.h
+++ b/include/dt-bindings/pinctrl/omap.h
@@ -65,6 +65,7 @@
 #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
+#define AM33XX_PADCONF(pa, dir, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) ((dir) | (mux))
 
 /*
  * Macros to allow using the offset from the padconf physical address
-- 
2.20.1
