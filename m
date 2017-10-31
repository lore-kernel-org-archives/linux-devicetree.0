From: Wenyou Yang <wenyou.yang@microchip.com>
Subject: [PATCH v4 3/3] MAINTAINERS: Add a new entry of the ov7740 driver
Date: Tue, 31 Oct 2017 09:11:45 +0800
Message-ID: <20171031011146.6899-4-wenyou.yang@microchip.com>
References: <20171031011146.6899-1-wenyou.yang@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171031011146.6899-1-wenyou.yang@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, Jonathan Corbet <corbet@lwn.net>, Hans Verkuil <hverkuil@xs4all.nl>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>, Wenyou Yang <wenyou.yang@microchip.com>
List-Id: devicetree@vger.kernel.org

Add a new entry of the ov7740 sensor driver to the MAINTAINERS file.

Signed-off-by: Wenyou Yang <wenyou.yang@microchip.com>
---

Changes in v4: None
Changes in v3:
 - Put the MAINTAINERS change to a separate patch.

Changes in v2:
 - Split off the bindings into a separate patch.
 - Add a new entry to the MAINTAINERS file.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index adbf69306e9e..42b93599a0af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9973,6 +9973,14 @@ S:	Maintained
 F:	drivers/media/i2c/ov7670.c
 F:	Documentation/devicetree/bindings/media/i2c/ov7670.txt
 
+OMNIVISION OV7740 SENSOR DRIVER
+M:	Wenyou Yang <wenyou.yang@microchip.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/ov7740.c
+F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
+
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.13.0
