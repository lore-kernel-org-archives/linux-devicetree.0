From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/3] watchdog: orion: remove orion_wdt_set_timeout
Date: Wed,  6 Mar 2019 09:19:23 +1300
Message-ID: <20190305201924.14853-3-chris.packham@alliedtelesis.co.nz>
References: <20190305201924.14853-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190305201924.14853-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Wim Van Sebroeck <wim@linux-watchdog.org>
List-Id: devicetree@vger.kernel.org

The watchdog core will do the same thing if no set_timeout
is supplied so we can safely remove orion_wdt_set_timeout.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v2:
- Add Guenter's review

 drivers/watchdog/orion_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 9db3b09f7568..8b259c712c52 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -349,13 +349,6 @@ static unsigned int orion_wdt_get_timeleft(struct wa=
tchdog_device *wdt_dev)
 	return readl(dev->reg + dev->data->wdt_counter_offset) / dev->clk_rate;
 }
=20
-static int orion_wdt_set_timeout(struct watchdog_device *wdt_dev,
-				 unsigned int timeout)
-{
-	wdt_dev->timeout =3D timeout;
-	return 0;
-}
-
 static const struct watchdog_info orion_wdt_info =3D {
 	.options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
 	.identity =3D "Orion Watchdog",
@@ -366,7 +359,6 @@ static const struct watchdog_ops orion_wdt_ops =3D {
 	.start =3D orion_wdt_start,
 	.stop =3D orion_wdt_stop,
 	.ping =3D orion_wdt_ping,
-	.set_timeout =3D orion_wdt_set_timeout,
 	.get_timeleft =3D orion_wdt_get_timeleft,
 };
=20
--=20
2.21.0
