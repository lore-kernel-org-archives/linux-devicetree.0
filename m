From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH v2] phy: exynos5-usbdrd: Add MODULE_DEVICE_TABLE entry
Date: Mon, 25 Aug 2014 09:38:49 +0200
Message-ID: <1408952329-7697-1-git-send-email-sjoerd.simons@collabora.co.uk>
References: <53F8BFF3.8020001@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <53F8BFF3.8020001@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Add a MODULE_DEVICE_TABLE call for OF match tables. This allows the
module to be autoloaded based on devicetree information.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
Changes since v1:
  - Fix an indentation nitpick spotted by Andreas F=C3=A4rber

 drivers/phy/phy-exynos5-usbdrd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/phy-exynos5-usbdrd.c b/drivers/phy/phy-exynos5=
-usbdrd.c
index b05302b..392101c 100644
--- a/drivers/phy/phy-exynos5-usbdrd.c
+++ b/drivers/phy/phy-exynos5-usbdrd.c
@@ -542,6 +542,7 @@ static const struct of_device_id exynos5_usbdrd_phy=
_of_match[] =3D {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, exynos5_usbdrd_phy_of_match);
=20
 static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 {
--=20
2.1.0
