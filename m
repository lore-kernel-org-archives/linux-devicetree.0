Return-Path: <SRS0=YIMn=O3=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 3/3] media: tc358746: update MAINTAINERS file
Date: Tue, 18 Dec 2018 15:12:40 +0100
Message-Id: <20181218141240.3056-4-m.felsch@pengutronix.de>
In-Reply-To: <20181218141240.3056-1-m.felsch@pengutronix.de>
References: <20181218141240.3056-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Add me as partial maintainer, others are welcome too.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 546f8d936589..f97dedbe545c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15230,6 +15230,13 @@ S:	Maintained
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC358746 DRIVER
+M:	Marco Felsch <kernel@pengutronix.de>
+L:	linux-media@vger.kernel.org
+S:	Odd Fixes
+F:	drivers/media/i2c/tc358746*
+F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.19.1
