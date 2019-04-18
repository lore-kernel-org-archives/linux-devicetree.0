From: Mark Brown <broonie@kernel.org>
Subject: Applied "MAINTAINERS: slg51000 updates to the Dialog Semiconductor search terms" to the regulator tree
Date: Thu, 18 Apr 2019 11:26:07 +0100 (BST)
Message-ID: <20190418102607.5AFC811279BB@debutante.sirena.org.uk>
References: <878724615d6edf4d1d8960fd4aa9058aaedab026.1555567784.git.eric.jeong.opensource@diasemi.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <878724615d6edf4d1d8960fd4aa9058aaedab026.1555567784.git.eric.jeong.opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: DEVICETREE <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, LINUX-KERNEL <linux-kernel@vger.kernel.org>linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

The patch

   MAINTAINERS: slg51000 updates to the Dialog Semiconductor search terms

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 4b01c5afc1817a966065d7da0fb962cc591c6fad Mon Sep 17 00:00:00 2001
From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Date: Thu, 18 Apr 2019 15:09:43 +0900
Subject: [PATCH] MAINTAINERS: slg51000 updates to the Dialog Semiconductor
 search terms

This patch adds the slg51000 bindings doc and driver to the Dialog
Semiconductor support list.

Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..656c1cc6431e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4603,6 +4603,7 @@ F:	Documentation/devicetree/bindings/mfd/da90*.txt
 F:	Documentation/devicetree/bindings/input/da90??-onkey.txt
 F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
 F:	Documentation/devicetree/bindings/regulator/da92*.txt
+F:	Documentation/devicetree/bindings/regulator/slg51000.txt
 F:	Documentation/devicetree/bindings/watchdog/da90??-wdt.txt
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
 F:	drivers/gpio/gpio-da90??.c
@@ -4618,6 +4619,7 @@ F:	drivers/power/supply/da9052-battery.c
 F:	drivers/power/supply/da91??-*.c
 F:	drivers/regulator/da903x.c
 F:	drivers/regulator/da9???-regulator.[ch]
+F:	drivers/regulator/slg51000-regulator.[ch]
 F:	drivers/thermal/da90??-thermal.c
 F:	drivers/rtc/rtc-da90??.c
 F:	drivers/video/backlight/da90??_bl.c
-- 
2.20.1
