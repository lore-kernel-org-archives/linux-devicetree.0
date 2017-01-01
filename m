From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH V7 2/4] MAINTAINERS: Add entry for GE B850v3 LVDS/DP++ Bridge
Date: Sun,  1 Jan 2017 21:24:30 +0100
Message-ID: <597f32d0aac5f87b88b88d99b2e8622ffe71a165.1483301745.git.peter.senna@collabora.com>
References: <cover.1483301745.git.peter.senna@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1483301745.git.peter.senna@collabora.com>
In-Reply-To: <cover.1483301745.git.peter.senna@collabora.com>
References: <cover.1483301745.git.peter.senna@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, architt@codeaurora.org, akpm@linux-foundation.org, daniel.vetter@ffwll.ch, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, eballetbo@gmail.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, javier@dowhile0.org, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, peter.senna@gmail.com, p.zabel@pengutronix.de, thierry.reding@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org
Cc: Rob Herring <robh@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

Update the MAINTAINERS file for the GE B850v3 LVDS/DP++ Bridge.

Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
CC: David Airlie <airlied@linux.ie>
CC: Thierry Reding <treding@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fdd9d5e3..1d3f17a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5371,6 +5371,14 @@ W:	https://linuxtv.org
 S:	Maintained
 F:	drivers/media/radio/radio-gemtek*
 
+GENERAL ELECTRIC B850V3 LVDS/DP++ BRIDGE
+M:	Peter Senna Tschudin <peter.senna@collabora.com>
+M:	Martin Donnelly <martin.donnelly@ge.com>
+M:	Martyn Welch <martyn.welch@collabora.co.uk>
+S:	Maintained
+F:	drivers/gpu/drm/bridge/ge_b850v3_dp2.c
+F:	Documentation/devicetree/bindings/ge/b850v3_dp2_bridge.txt
+
 GENERIC GPIO I2C DRIVER
 M:	Haavard Skinnemoen <hskinnemoen@gmail.com>
 S:	Supported
-- 
2.5.5
