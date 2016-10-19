From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 2/8] drm: bridge: vga-dac: Add adi,adv7123 compatible string
Date: Wed, 19 Oct 2016 17:25:37 +0300
Message-ID: <1476887143-24831-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The ADV7123 is a transparent VGA DAC. Unlike dumb VGA DACs it can be
controlled through a power save pin, and requires a power supply.
However, on most boards where the device is used neither the power save
signal nor the power supply are controllable.

To avoid developing a separate device-specific driver add an
"adi,adv7123" compatible entry to the dumb-vga-dac driver. This will
allow supporting most ADV7123-based boards easily, while allowing future
development of an adv7123 driver when needed without breaking backward
compatibility.

Cc: devicetree@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dumb-vga-dac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index afec232185a7..b33e3f829e4f 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -204,6 +204,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
 
 static const struct of_device_id dumb_vga_match[] = {
 	{ .compatible = "dumb-vga-dac" },
+	{ .compatible = "adi,adv7123" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dumb_vga_match);
-- 
Regards,

Laurent Pinchart
