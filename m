From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH V6 2/4] MAINTAINERS: Add entry for GE B850v3 LVDS/DP++ Bridge
Date: Thu, 27 Oct 2016 15:01:54 +0200
Message-ID: <80df3e0417dc27713287ebb37136836b443c873e.1477572814.git.peter.senna@collabora.com>
References: <cover.1477572814.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1477572814.git.peter.senna@collabora.com>
In-Reply-To: <cover.1477572814.git.peter.senna@collabora.com>
References: <cover.1477572814.git.peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: airlied@linux.ie, architt@codeaurora.org, akpm@linux-foundation.org, daniel.vetter@ffwll.ch, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, eballetbo@gmail.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, javier@dowhile0.org, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, peter.senna@gmail.com, p.zabel@pengutronix.de, thierry.reding@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, ykk@rock-chips.com
Cc: Fabio Estevam <fabio.estevam@nxp.com>
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
index 6834df3..23100f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5249,6 +5249,14 @@ W:	https://linuxtv.org
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
