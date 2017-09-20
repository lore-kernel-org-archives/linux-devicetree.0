From: Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v3 4/4] MAINTAINERS: Add entry for BCM2835 camera driver
Date: Wed, 20 Sep 2017 17:07:57 +0100
Message-ID: <ea03688b02c4a9ffbc04f610f98e6ee99ed22401.1505916622.git.dave.stevenson@raspberrypi.org>
References: <cover.1505916622.git.dave.stevenson@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <cover.1505916622.git.dave.stevenson@raspberrypi.org>
In-Reply-To: <cover.1505916622.git.dave.stevenson@raspberrypi.org>
References: <cover.1505916622.git.dave.stevenson@raspberrypi.org>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
---

No changes from v2 to v3

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb930eb..b47ddaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2713,6 +2713,13 @@ S:	Maintained
 N:	bcm2835
 F:	drivers/staging/vc04_services
 
+BROADCOM BCM2835 CAMERA DRIVER
+M:	Dave Stevenson <dave.stevenson@raspberrypi.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/platform/bcm2835/
+F:	Documentation/devicetree/bindings/media/bcm2835-unicam.txt
+
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
 M:	Rafał Miłecki <zajec5@gmail.com>
-- 
2.7.4
