From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH v2 3/3] omapdss: panel-tpo-td028ec1: Add module alias
Date: Wed, 23 Apr 2014 22:15:20 +0200
Message-ID: <1398284120-4986-4-git-send-email-marek@goldelico.com>
References: <1398284120-4986-1-git-send-email-marek@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398284120-4986-1-git-send-email-marek@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, bcousson@baylibre.com, tony@atomide.com, linux@arm.linux.org.uk, plagnioj@jcrosoft.com, tomi.valkeinen@ti.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, hns@goldelico.com, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

Add module alias string to make it working when panel is compiled as module.
Without this change panel module is not probed thus display is not working.

Signed-off-by: Marek Belisko <marek@goldelico.com>
---
 drivers/video/fbdev/omap2/displays-new/panel-tpo-td028ttec1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap2/displays-new/panel-tpo-td028ttec1.c b/drivers/video/fbdev/omap2/displays-new/panel-tpo-td028ttec1.c
index 5b3466e..728808b 100644
--- a/drivers/video/fbdev/omap2/displays-new/panel-tpo-td028ttec1.c
+++ b/drivers/video/fbdev/omap2/displays-new/panel-tpo-td028ttec1.c
@@ -505,6 +505,7 @@ static struct spi_driver td028ttec1_spi_driver = {
 
 module_spi_driver(td028ttec1_spi_driver);
 
+MODULE_ALIAS("spi:toppoly,td028ttec1");
 MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
 MODULE_DESCRIPTION("Toppoly TD028TTEC1 panel driver");
 MODULE_LICENSE("GPL");
-- 
1.8.3.2
