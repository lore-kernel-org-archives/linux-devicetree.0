From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] drm/panel: lcd_olinuxino_funcs can be static
Date: Tue, 19 Jun 2018 19:16:27 +0800
Message-ID: <20180619111627.GA67130@cairo>
References: <1529397260-16340-1-git-send-email-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529397260-16340-1-git-send-email-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Stefan Mavrodiev <stefan@olimex.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Fixes: 17a867cdd048 ("drm/panel: Add support for Olimex LCD-OLinuXino panel")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 panel-olimex-lcd-olinuxino.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 0bc04ff..daa9ef5 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -212,7 +212,7 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel)
 	return num;
 }
 
-struct drm_panel_funcs lcd_olinuxino_funcs = {
+static struct drm_panel_funcs lcd_olinuxino_funcs = {
 	.disable = lcd_olinuxino_disable,
 	.unprepare = lcd_olinuxino_unprepare,
 	.prepare = lcd_olinuxino_prepare,
