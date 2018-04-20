From: <jan.tuerk@emtrion.com>
Subject: [PATCH v3 1/6] drm/panel: Add support for the EDT ETM0700G0BDH6
Date: Fri, 20 Apr 2018 14:50:48 +0200
Message-ID: <20180420125108.14197-2-jan.tuerk@emtrion.com>
References: <20171220134710.64479-2-jan.tuerk@emtrion.com>
 <20180420125108.14197-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180420125108.14197-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Jan Tuerk <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jan Tuerk <jan.tuerk@emtrion.com>

The Emerging Display Technology ETM0700G0BDH6 is exactly
the same display as the ETM0700G0DH6, exept the pixelclock
polarity. Therefore re-use the ETM0700G0DH6 modes. It is
used by default on emtrion Avari based development kits.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index cbf1ab404ee7..8b7feb2888f2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -909,6 +909,18 @@ static const struct panel_desc edt_etm0700g0dh6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
 };
 
+static const struct panel_desc edt_etm0700g0bdh6 = {
+	.modes = &edt_etm0700g0dh6_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
 static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode = {
 	.clock = 32260,
 	.hdisplay = 800,
@@ -2134,6 +2146,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "edt,etm0700g0dh6",
 		.data = &edt_etm0700g0dh6,
 	}, {
+		.compatible = "edt,etm0700g0bdh6",
+		.data = &edt_etm0700g0bdh6,
+	}, {
 		.compatible = "foxlink,fl500wvr00-a0t",
 		.data = &foxlink_fl500wvr00_a0t,
 	}, {
-- 
2.11.0
