From: Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v7 14/14] MAINTAINERS: add entry for Rockchip ISP1 driver
Date: Wed,  3 Jul 2019 16:09:10 -0300
Message-ID: <20190703190910.32633-15-helen.koike@collabora.com>
References: <20190703190910.32633-1-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703190910.32633-1-helen.koike@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com, Helen Koike <helen.koike@collabora.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: devicetree@vger.kernel.org

Add MAINTAINERS entry for the rockchip isp1 driver.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

Changes in v7: None

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 866969b36a13..47c8f17b0b1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13518,6 +13518,14 @@ F:	drivers/hid/hid-roccat*
 F:	include/linux/hid-roccat*
 F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
 
+ROCKCHIP ISP V1 DRIVER
+M:	Helen Koike <helen.koike@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/platform/rockchip/isp1/
+F:	Documentation/devicetree/bindings/media/rockchip-isp1.txt
+F:	Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
+
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
 M:	Jacob chen <jacob2.chen@rock-chips.com>
 L:	linux-media@vger.kernel.org
-- 
2.20.1
