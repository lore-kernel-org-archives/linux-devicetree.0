From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: add entry for sensirion sps30 driver
Date: Thu, 20 Jun 2019 21:50:11 +0200
Message-ID: <20190620195011.30942-3-tduszyns@gmail.com>
References: <20190620195011.30942-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620195011.30942-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Add myself as a sensirion sps30 driver maintainer.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1eb971608ac4..dafa02ba161c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14172,6 +14172,12 @@ S:	Maintained
 F:	drivers/misc/phantom.c
 F:	include/uapi/linux/phantom.h
 
+SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
+M:	Tomasz Duszynski <tduszyns@gmail.com>
+S:	Maintained
+F:	drivers/iio/chemical/sps30.c
+F:	Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml
+
 SERIAL DEVICE BUS
 M:	Rob Herring <robh@kernel.org>
 L:	linux-serial@vger.kernel.org
-- 
2.22.0
