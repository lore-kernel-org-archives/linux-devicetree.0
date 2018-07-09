Return-Path: <SRS0=7VqK=JZ=amarulasolutions.com=anthony@kernel.org>
From: Anthony Brandon <anthony@amarulasolutions.com>
Subject: [PATCH v2 4/4] mfd: wm8994: Allow to configure CS/ADDR Pulldown from dts
Date: Mon,  9 Jul 2018 19:46:46 +0200
Message-Id: <1531158406-18646-4-git-send-email-anthony@amarulasolutions.com>
In-Reply-To: <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
References: <20180709160631.GU18740@imbe.wolfsonmicro.main>
 <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, alberto@amarulasolutions.com, devicetree@vger.kernel.org
Cc: Anthony Brandon <anthony@amarulasolutions.com>
List-ID: <devicetree@vger.kernel.org>

From: Alberto Panizzo <alberto@amarulasolutions.com>

For designs where CS/ADDR pin is floating, it is useful to
allow dts to define whether to keep internal pull down or not.

Signed-off-by: Alberto Panizzo <alberto@amarulasolutions.com>
Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
---
 drivers/mfd/wm8994-core.c        | 4 ++++
 include/linux/mfd/wm8994/pdata.h | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index fa4b1b7..22bd652 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -304,6 +304,8 @@ static int wm8994_set_pdata_from_of(struct wm8994 *wm8994)
 
 	pdata->spkmode_pu = of_property_read_bool(np, "wlf,spkmode-pu");
 
+	pdata->csnaddr_pd = of_property_read_bool(np, "wlf,csnaddr-pd");
+
 	pdata->ldo[0].enable = of_get_named_gpio(np, "wlf,ldo1ena", 0);
 	if (pdata->ldo[0].enable < 0)
 		pdata->ldo[0].enable = 0;
@@ -562,6 +564,8 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 
 	if (pdata->spkmode_pu)
 		pulls |= WM8994_SPKMODE_PU;
+	if (pdata->csnaddr_pd)
+		pulls |= WM8994_CSNADDR_PD;
 
 	/* Disable unneeded pulls */
 	wm8994_set_bits(wm8994, WM8994_PULL_CONTROL_2,
diff --git a/include/linux/mfd/wm8994/pdata.h b/include/linux/mfd/wm8994/pdata.h
index 90c6052..b19c370 100644
--- a/include/linux/mfd/wm8994/pdata.h
+++ b/include/linux/mfd/wm8994/pdata.h
@@ -222,6 +222,12 @@ struct wm8994_pdata {
 	 */
 	bool spkmode_pu;
 
+	/*
+	 * CS/ADDR must be pulled internally by the device on this
+	 * system.
+	 */
+	bool csnaddr_pd;
+
 	/**
 	 * Maximum number of channels clocks will be generated for,
 	 * useful for systems where and I2S bus with multiple data
-- 
2.7.4
