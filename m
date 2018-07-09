Return-Path: <SRS0=7VqK=JZ=amarulasolutions.com=anthony@kernel.org>
From: Anthony Brandon <anthony@amarulasolutions.com>
Subject: [PATCH v2 2/4] mfd: wm8994: Allow to configure Speaker Mode Pullup from dts
Date: Mon,  9 Jul 2018 19:46:44 +0200
Message-Id: <1531158406-18646-2-git-send-email-anthony@amarulasolutions.com>
In-Reply-To: <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
References: <20180709160631.GU18740@imbe.wolfsonmicro.main>
 <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, alberto@amarulasolutions.com, devicetree@vger.kernel.org
Cc: Anthony Brandon <anthony@amarulasolutions.com>
List-ID: <devicetree@vger.kernel.org>

From: Alberto Panizzo <alberto@amarulasolutions.com>

Configuring Speaker Mode Pullup was already supported in pdata, but not
in the dts.

Signed-off-by: Alberto Panizzo <alberto@amarulasolutions.com>
Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
---
 drivers/mfd/wm8994-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index a944841..fa4b1b7 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -302,6 +302,8 @@ static int wm8994_set_pdata_from_of(struct wm8994 *wm8994)
 	if (of_find_property(np, "wlf,ldoena-always-driven", NULL))
 		pdata->lineout2fb = true;
 
+	pdata->spkmode_pu = of_property_read_bool(np, "wlf,spkmode-pu");
+
 	pdata->ldo[0].enable = of_get_named_gpio(np, "wlf,ldo1ena", 0);
 	if (pdata->ldo[0].enable < 0)
 		pdata->ldo[0].enable = 0;
-- 
2.7.4
