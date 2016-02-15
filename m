From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 04/10] regulator: axp20x: Use of_match name
 as default regulator name
Date: Mon, 15 Feb 2016 18:31:22 +0800
Message-ID: <1455532288-30870-5-git-send-email-wens@csie.org>
References: <1455532288-30870-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBB6SQ23AKGQEIYYL4BY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455532288-30870-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Originally the helper macros used uppercase regulator names, which
are primarily used to expand to the regulator ID enum, as the default
names. This is aestheticly unpleasent.

Since the of_match bits are the same, just lowercase, use that as the
default names instead.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/regulator/axp20x-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 81f25383f2d5..40cd894e4df5 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -39,7 +39,7 @@
 #define AXP_DESC_IO(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
 		    _vmask, _ereg, _emask, _enable_val, _disable_val)		\
 	[_family##_##_id] = {							\
-		.name		= #_id,						\
+		.name		= (_match),					\
 		.supply_name	= (_supply),					\
 		.of_match	= of_match_ptr(_match),				\
 		.regulators_node = of_match_ptr("regulators"),			\
@@ -61,7 +61,7 @@
 #define AXP_DESC(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
 		 _vmask, _ereg, _emask) 					\
 	[_family##_##_id] = {							\
-		.name		= #_id,						\
+		.name		= (_match),					\
 		.supply_name	= (_supply),					\
 		.of_match	= of_match_ptr(_match),				\
 		.regulators_node = of_match_ptr("regulators"),			\
@@ -80,7 +80,7 @@
 
 #define AXP_DESC_SW(_family, _id, _match, _supply, _ereg, _emask)		\
 	[_family##_##_id] = {							\
-		.name		= #_id,						\
+		.name		= (_match),					\
 		.supply_name	= (_supply),					\
 		.of_match	= of_match_ptr(_match),				\
 		.regulators_node = of_match_ptr("regulators"),			\
@@ -94,7 +94,7 @@
 
 #define AXP_DESC_FIXED(_family, _id, _match, _supply, _volt)			\
 	[_family##_##_id] = {							\
-		.name		= #_id,						\
+		.name		= (_match),					\
 		.supply_name	= (_supply),					\
 		.of_match	= of_match_ptr(_match),				\
 		.regulators_node = of_match_ptr("regulators"),			\
@@ -109,7 +109,7 @@
 #define AXP_DESC_RANGES(_family, _id, _match, _supply, _ranges, _n_voltages,	\
 			_vreg, _vmask, _ereg, _emask)				\
 	[_family##_##_id] = {							\
-		.name		= #_id,						\
+		.name		= (_match),					\
 		.supply_name	= (_supply),					\
 		.of_match	= of_match_ptr(_match),				\
 		.regulators_node = of_match_ptr("regulators"),			\
-- 
2.7.0
