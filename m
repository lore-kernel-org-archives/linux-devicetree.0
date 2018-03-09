From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 3/9] v4l: Add sunxi Video Engine pixel format
Date: Fri,  9 Mar 2018 11:14:39 +0100
Message-ID: <20180309101445.16190-1-paul.kocialkowski@bootlin.com>
References: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: "Signed-off-by : Bob Ham" <rah@settrans.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Courbot <acourbot@chromium.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Florent Revest <revestflo@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Icenowy Zheng <icenowy@aosc.xyz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Thomas van Kleef <thomas@vitsch.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

From: Florent Revest <florent.revest@free-electrons.com>

Add support for the allwinner's proprietary pixel format described in
details here: http://linux-sunxi.org/File:Ve_tile_format_v1.pdf

This format is similar to V4L2_PIX_FMT_NV12M but the planes are divided
in tiles of 32x32px.

Signed-off-by: Florent Revest <florent.revest@free-electrons.com>
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 35706204e81d..cee906681db7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -669,6 +669,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
+#define V4L2_PIX_FMT_SUNXI    v4l2_fourcc('S', 'X', 'I', 'Y') /* Sunxi VE's 32x32 tiled NV12 */
 
 /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
2.16.2
