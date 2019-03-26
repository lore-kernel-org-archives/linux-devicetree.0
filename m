Return-Path: <SRS0=1wp7=R5=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v5 6/6] MAINTAINERS: add entry for fxas21002c gyro driver
Date: Tue, 26 Mar 2019 10:16:51 +0000
Message-Id: <20190326101651.25056-7-rui.silva@linaro.org>
In-Reply-To: <20190326101651.25056-1-rui.silva@linaro.org>
References: <20190326101651.25056-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add me as maintainer of the nxp fxas21002c gyroscope driver.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..2748e406889c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11107,6 +11107,16 @@ F:	Documentation/ABI/stable/sysfs-bus-nvmem
 F:	include/linux/nvmem-consumer.h
 F:	include/linux/nvmem-provider.h
 
+NXP FXAS21002C DRIVER
+M:	Rui Miguel Silva <rmfrfs@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/gyroscope/fxas21002c.txt
+F:	drivers/iio/gyro/fxas21002c_core.c
+F:	drivers/iio/gyro/fxas21002c.h
+F:	drivers/iio/gyro/fxas21002c_i2c.c
+F:	drivers/iio/gyro/fxas21002c_spi.c
+
 NXP SGTL5000 DRIVER
 M:	Fabio Estevam <festevam@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.21.0
