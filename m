From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 4/8] ARM: at91: pm: keep at91_pm_backup_init() only for
 SAMA5D2 SoCs
Date: Thu, 14 Feb 2019 15:54:47 +0000
Message-ID: <1550159642-26878-5-git-send-email-claudiu.beznea@microchip.com>
References: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

In at91_pm_backup_init() return if it is not about SAMA5D2 SoCs.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/mach-at91/pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index e42db02eafe4..c83f78000ab3 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -588,6 +588,9 @@ static int __init at91_pm_backup_init(void)
 	struct platform_device *pdev =3D NULL;
 	int ret =3D -ENODEV;
=20
+	if (!IS_ENABLED(CONFIG_SOC_SAMA5D2))
+		return -EPERM;
+
 	if (!at91_is_pm_mode_active(AT91_PM_BACKUP))
 		return 0;
=20
--=20
2.7.4
