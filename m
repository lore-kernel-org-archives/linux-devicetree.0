From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH 02/12] drm: sun4i: Add support for enabling DDC
 I2C bus to dw_hdmi glue
Date: Sat,  6 Apr 2019 01:45:04 +0200
Message-ID: <20190405234514.6183-3-megous@megous.com>
References: <20190405234514.6183-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBEWRT7SQKGQEW66UC4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190405234514.6183-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm802
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

Orange Pi 3 board requires enabling DDC I2C bus via some GPIO connected
transistors, before it can be used. Model this as a power supply for DDC
(via regulator framework).

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 17 ++++++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index dc47720c99ba..a1518525fa2f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -146,16 +146,28 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(hdmi->regulator);
 	}
 
+	hdmi->ddc_regulator = devm_regulator_get(dev, "ddc");
+	if (IS_ERR(hdmi->ddc_regulator)) {
+		dev_err(dev, "Couldn't get ddc regulator\n");
+		return PTR_ERR(hdmi->ddc_regulator);
+	}
+
 	ret = regulator_enable(hdmi->regulator);
 	if (ret) {
 		dev_err(dev, "Failed to enable regulator\n");
 		return ret;
 	}
 
+	ret = regulator_enable(hdmi->ddc_regulator);
+	if (ret) {
+		dev_err(dev, "Failed to enable ddc regulator\n");
+		goto err_disable_regulator;
+	}
+
 	ret = reset_control_deassert(hdmi->rst_ctrl);
 	if (ret) {
 		dev_err(dev, "Could not deassert ctrl reset control\n");
-		goto err_disable_regulator;
+		goto err_disable_ddc_regulator;
 	}
 
 	ret = clk_prepare_enable(hdmi->clk_tmds);
@@ -208,6 +220,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:
 	reset_control_assert(hdmi->rst_ctrl);
+err_disable_ddc_regulator:
+	regulator_disable(hdmi->ddc_regulator);
 err_disable_regulator:
 	regulator_disable(hdmi->regulator);
 
@@ -223,6 +237,7 @@ static void sun8i_dw_hdmi_unbind(struct device *dev, struct device *master,
 	sun8i_hdmi_phy_remove(hdmi);
 	clk_disable_unprepare(hdmi->clk_tmds);
 	reset_control_assert(hdmi->rst_ctrl);
+	regulator_disable(hdmi->ddc_regulator);
 	regulator_disable(hdmi->regulator);
 }
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 720c5aa8adc1..6e93d55560b6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -188,6 +188,7 @@ struct sun8i_dw_hdmi {
 	struct sun8i_hdmi_phy		*phy;
 	struct dw_hdmi_plat_data	plat_data;
 	struct regulator		*regulator;
+	struct regulator		*ddc_regulator;
 	const struct sun8i_dw_hdmi_quirks *quirks;
 	struct reset_control		*rst_ctrl;
 };
-- 
2.21.0
