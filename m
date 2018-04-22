Return-Path: <SRS0=Fqr3=HL=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/3] pinctrl: meson: meson8: add support for the Meson8m2 SoC
Date: Sun, 22 Apr 2018 12:53:29 +0200
Message-Id: <20180422105330.4712-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

Add Meson8m2 support to the existing Meson8 pinctrl driver. Since there
are only very few changes (Meson8m2 has an extra signal on 10 CBUS pins,
no other differences were found so far).
Add the new compatible strings for Meson8m2 to the existing Meson8
driver so we don't have to duplicate the whole driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 49c7ce03547b..086082aeb796 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -1,5 +1,5 @@
 /*
- * Pin controller and GPIO driver for Amlogic Meson8.
+ * Pin controller and GPIO driver for Amlogic Meson8 and Meson8m2.
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  *
@@ -1080,6 +1080,14 @@ static const struct of_device_id meson8_pinctrl_dt_match[] = {
 		.compatible = "amlogic,meson8-aobus-pinctrl",
 		.data = &meson8_aobus_pinctrl_data,
 	},
+	{
+		.compatible = "amlogic,meson8m2-cbus-pinctrl",
+		.data = &meson8_cbus_pinctrl_data,
+	},
+	{
+		.compatible = "amlogic,meson8m2-aobus-pinctrl",
+		.data = &meson8_aobus_pinctrl_data,
+	},
 	{ },
 };
 
-- 
2.17.0
