From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v9 13/13] media: MAINTAINERS: add entry for Freescale i.MX7
 media driver
Date: Thu, 22 Nov 2018 15:18:34 +0000
Message-ID: <20181122151834.6194-14-rui.silva@linaro.org>
References: <20181122151834.6194-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181122151834.6194-1-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add maintainer entry for the imx7 media csi, mipi csis driver,
dt-bindings and documentation.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abecc528dac..afa2ad3c5600 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9134,6 +9134,17 @@ T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/platform/imx-pxp.[ch]
 
+MEDIA DRIVERS FOR FREESCALE IMX7
+M:	Rui Miguel Silva <rmfrfs@gmail.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/imx7-csi.txt
+F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
+F:	Documentation/media/v4l-drivers/imx7.rst
+F:	drivers/staging/media/imx/imx7-media-csi.c
+F:	drivers/staging/media/imx/imx7-mipi-csis.c
+
 MEDIA DRIVERS FOR HELENE
 M:	Abylay Ospan <aospan@netup.ru>
 L:	linux-media@vger.kernel.org
-- 
2.19.1
