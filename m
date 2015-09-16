From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/3] regulators: axp20x: Rename supply names for
 AXP221 DC1SW and DC5LDO
Date: Wed, 16 Sep 2015 11:05:31 +0800
Message-ID: <1442372732-27434-3-git-send-email-wens@csie.org>
References: <1442372732-27434-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBD5Z4OXQKGQEX3YVEHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1442372732-27434-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The DC1SW and DC5LDO regulators in the AXP221 are internally chained
to DCDC1 and DCDC5, hence the names. The original bindings used the
parent regulator names for the supply regulator property. This causes
some confusion when we actually use it in the dts:

	axp221 {
		/* self supplying? */
		dcdc1-supply = <&dcdc1>;
		dcdc5-supply = <&dcdc5>;

		dcdc1: dcdc1 {
			...
		};

		dcdc5: dcdc5 {
			...
		};
	};

Change them to the downstream regulator names, or "dc1sw" and "dc5ldo"
respectively.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/regulator/axp20x-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 01bf3476a791..27ebee8e224c 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -196,10 +196,10 @@ static const struct regulator_desc axp22x_regulators[] = {
 	AXP_DESC(AXP22X, DCDC5, "dcdc5", "vin5", 1000, 2550, 50,
 		 AXP22X_DCDC5_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(4)),
 	/* secondary switchable output of DCDC1 */
-	AXP_DESC_SW(AXP22X, DC1SW, "dc1sw", "dcdc1", 1600, 3400, 100,
+	AXP_DESC_SW(AXP22X, DC1SW, "dc1sw", "dc1sw", 1600, 3400, 100,
 		    AXP22X_DCDC1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(7)),
 	/* LDO regulator internally chained to DCDC5 */
-	AXP_DESC(AXP22X, DC5LDO, "dc5ldo", "dcdc5", 700, 1400, 100,
+	AXP_DESC(AXP22X, DC5LDO, "dc5ldo", "dc5ldo", 700, 1400, 100,
 		 AXP22X_DC5LDO_V_OUT, 0x7, AXP22X_PWR_OUT_CTRL1, BIT(0)),
 	AXP_DESC(AXP22X, ALDO1, "aldo1", "aldoin", 700, 3300, 100,
 		 AXP22X_ALDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(6)),
-- 
2.5.1
