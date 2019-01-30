From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 3/3] MAINTAINERS: Add entry for the SMSC USB333x ULPI USB PHY
Date: Wed, 30 Jan 2019 16:50:23 +0100
Message-ID: <20190130155023.4495-4-paul.kocialkowski@bootlin.com>
References: <20190130155023.4495-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130155023.4495-1-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Add a new MAINTAINERS entry for this ULPI USB PHY.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d2d5caf789c7..33f1538b30c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14146,6 +14146,12 @@ L:	linux-fbdev@vger.kernel.org
 S:	Maintained
 F:	drivers/video/fbdev/smscufx.c
 
+SMSC USB333x ULPI USB PHY DRIVER
+M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/phy/smsc/phy-usb333x.c
+
 SMSC47B397 HARDWARE MONITOR DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.20.1
