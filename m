From: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v12 3/5] MAINTAINERS: add entry for Rockchip RGA driver
Date: Wed, 11 Oct 2017 15:29:36 +0800
Message-ID: <20171011072938.383-4-jacob-chen@iotwrt.com>
References: <20171011072938.383-1-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20171011072938.383-1-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6671f375f7fc..335497bbc3f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11509,6 +11509,13 @@ F:	drivers/hid/hid-roccat*
 F:	include/linux/hid-roccat*
 F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
 
+ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
+M:	Jacob chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
+L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Maintained
+F:	drivers/media/platform/rockchip/rga/
+F:	Documentation/devicetree/bindings/media/rockchip-rga.txt
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>
 L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
2.14.1
