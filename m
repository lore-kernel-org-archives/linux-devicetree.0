From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 3/9] regulator: core: Try full range when
 adjusting regulators to constraints
Date: Sun, 21 Aug 2016 10:11:19 +0800
Message-ID: <20160821021125.1521-4-wens@csie.org>
References: <20160821021125.1521-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZ5V4S6QKGQEZLKFQ3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160821021125.1521-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently when we try to bring regulator in bounds of its constraints,
we pick either the minimum or maximum voltage as the target. This fails
if the regulator range is not continuous, and the target voltage is not
an exact value the regulator can achieve, i.e. the target is not aligned
to the step of the regulator.

Instead pass the full range of the constraints, and have the regulator
core work out a suitable voltage within.

Fixes: ("regulator: core: Ensure we are at least in bounds for our
	 constraints")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/regulator/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index db320e8fa865..86f69c92ce7a 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -897,13 +897,9 @@ static int machine_constraints_voltage(struct regulator_dev *rdev,
 		target_min = current_uV;
 		target_max = current_uV;
 
-		if (current_uV < rdev->constraints->min_uV) {
+		if (current_uV < rdev->constraints->min_uV ||
+		    current_uV > rdev->constraints->max_uV) {
 			target_min = rdev->constraints->min_uV;
-			target_max = rdev->constraints->min_uV;
-		}
-
-		if (current_uV > rdev->constraints->max_uV) {
-			target_min = rdev->constraints->max_uV;
 			target_max = rdev->constraints->max_uV;
 		}
 
-- 
2.9.3
