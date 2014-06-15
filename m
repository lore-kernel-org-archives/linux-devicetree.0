From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 5/6] pinctrl: rockchip: support unrouted iomuxes per bank
Date: Mon, 16 Jun 2014 01:37:49 +0200
Message-ID: <2829145.SDmgcPOrPP@diego>
References: <1887108.ECBDVhibgn@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1887108.ECBDVhibgn@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On the upcoming RK3288 SoC contain some unrouted pins in their banks. So while
for example pin8 of bank5 stays pin8 with all its settings (register offset etc),
pins 0 to 7 are not routed outside the SoC at all.
Therefore add a flag to mark these unrouted iomuxes to prevent people from using
them.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 115c75d..c8920f5 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -70,6 +70,7 @@ enum rockchip_pinctrl_type {
 #define IOMUX_GPIO_ONLY		BIT(0)
 #define IOMUX_WIDTH_4BIT	BIT(1)
 #define IOMUX_SOURCE_PMU	BIT(2)
+#define IOMUX_UNROUTED		BIT(3)
 
 /**
  * @type: iomux variant using IOMUX_* constants
@@ -386,6 +387,11 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	if (iomux_num > 3)
 		return -EINVAL;
 
+	if (bank->iomux[iomux_num].type & IOMUX_UNROUTED) {
+		dev_err(info->dev, "pin %d is unrouted\n", pin);
+		return -EINVAL;
+	}
+
 	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY)
 		return RK_FUNC_GPIO;
 
@@ -436,6 +442,11 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (iomux_num > 3)
 		return -EINVAL;
 
+	if (bank->iomux[iomux_num].type & IOMUX_UNROUTED) {
+		dev_err(info->dev, "pin %d is unrouted\n", pin);
+		return -EINVAL;
+	}
+
 	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY) {
 		if (mux != RK_FUNC_GPIO) {
 			dev_err(info->dev,
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
