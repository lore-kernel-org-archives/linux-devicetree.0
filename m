From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v8 27/34] media: imx: csi: increase burst size for YUV formats
Date: Wed,  7 Jun 2017 11:34:06 -0700
Message-ID: <1496860453-6282-28-git-send-email-steve_longerbeam@mentor.com>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

The IDMAC supports burst sizes of up to 32 pixels for interleaved YUV
formats and up to 64 pixels for planar YUV formats.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-csi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 83c8697..b9220cc 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -332,6 +332,23 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
 		passthrough = true;
 		passthrough_bits = 16;
 		break;
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_NV12:
+		burst_size = (image.pix.width & 0x3f) ?
+			     ((image.pix.width & 0x1f) ?
+			      ((image.pix.width & 0xf) ? 8 : 16) : 32) : 64;
+		passthrough = (sensor_ep->bus_type != V4L2_MBUS_CSI2 &&
+			       sensor_ep->bus.parallel.bus_width >= 16);
+		passthrough_bits = 16;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
+		burst_size = (image.pix.width & 0x1f) ?
+			     ((image.pix.width & 0xf) ? 8 : 16) : 32;
+		passthrough = (sensor_ep->bus_type != V4L2_MBUS_CSI2 &&
+			       sensor_ep->bus.parallel.bus_width >= 16);
+		passthrough_bits = 16;
+		break;
 	default:
 		burst_size = (image.pix.width & 0xf) ? 8 : 16;
 		passthrough = (sensor_ep->bus_type != V4L2_MBUS_CSI2 &&
-- 
2.7.4
