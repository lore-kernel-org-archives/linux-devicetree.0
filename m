From: Huang Shijie <b32955@freescale.com>
Subject: [PATCH v3 2/8] mtd: m25p80: add support for Spansion s25fl128s chip
Date: Fri, 30 Aug 2013 10:07:23 +0800
Message-ID: <1377828449-18912-3-git-send-email-b32955@freescale.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377828449-18912-1-git-send-email-b32955@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@kernel.org
Cc: dwmw2@infradead.org, dedekind1@gmail.com, computersforpeace@gmail.com, shawn.guo@linaro.org, kernel@pengutronix.de, b18965@freescale.com, b44548@freescale.com, lznuaa@gmail.com, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Huang Shijie <b32955@freescale.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 299cc69..cae419e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -751,6 +751,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
+	{ "s25fl128s", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-- 
1.7.1


