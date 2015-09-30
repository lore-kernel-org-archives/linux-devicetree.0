From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 1/3] mfd: axp20x: Drop AXP221 DC1SW and
 DC5LDO regulator supplies from bindings
Date: Wed, 30 Sep 2015 14:39:45 +0800
Message-ID: <1443595188-1283-2-git-send-email-wens@csie.org>
References: <1443595188-1283-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZMIV2YAKGQEGFILFKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1443595188-1283-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
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

Since they are internally connected within the PMIC, their relationships
should not be visible in the device tree.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 41811223e5be..a474359dd206 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -60,8 +60,8 @@ DCDC2		: DC-DC buck	: vin2-supply
 DCDC3		: DC-DC	buck	: vin3-supply
 DCDC4		: DC-DC	buck	: vin4-supply
 DCDC5		: DC-DC	buck	: vin5-supply
-DC1SW		: On/Off Switch	: dcdc1-supply		: DCDC1 secondary output
-DC5LDO		: LDO		: dcdc5-supply		: input from DCDC5
+DC1SW		: On/Off Switch	:			: DCDC1 secondary output
+DC5LDO		: LDO		:			: input from DCDC5
 ALDO1		: LDO		: aldoin-supply		: shared supply
 ALDO2		: LDO		: aldoin-supply		: shared supply
 ALDO3		: LDO		: aldoin-supply		: shared supply
-- 
2.5.3
