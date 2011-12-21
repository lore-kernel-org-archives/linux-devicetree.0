From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/4] regulator: mc13892: remove the unnecessary prefix from
 regulator name
Date: Wed, 21 Dec 2011 23:00:45 +0800
Message-ID: <1324479647-4580-3-git-send-email-shawn.guo@linaro.org>
References: <1324479647-4580-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324479647-4580-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It's not really necessary to add a prefix 'MC13892__' for each mc13892
regulator name, since the chip must have been identified as mc13892
when we look at the regulator name.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/mc13xxx.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/mc13xxx.h b/drivers/regulator/mc13xxx.h
index 2775826..75e3832 100644
--- a/drivers/regulator/mc13xxx.h
+++ b/drivers/regulator/mc13xxx.h
@@ -48,7 +48,7 @@ extern struct regulator_ops mc13xxx_fixed_regulator_ops;
 #define MC13xxx_DEFINE(prefix, _name, _reg, _vsel_reg, _voltages, _ops)	\
 	[prefix ## _name] = {				\
 		.desc = {						\
-			.name = #prefix "_" #_name,			\
+			.name = #_name,					\
 			.n_voltages = ARRAY_SIZE(_voltages),		\
 			.ops = &_ops,			\
 			.type = REGULATOR_VOLTAGE,			\
@@ -66,7 +66,7 @@ extern struct regulator_ops mc13xxx_fixed_regulator_ops;
 #define MC13xxx_FIXED_DEFINE(prefix, _name, _reg, _voltages, _ops)	\
 	[prefix ## _name] = {				\
 		.desc = {						\
-			.name = #prefix "_" #_name,			\
+			.name = #_name,					\
 			.n_voltages = ARRAY_SIZE(_voltages),		\
 			.ops = &_ops,		\
 			.type = REGULATOR_VOLTAGE,			\
@@ -81,7 +81,7 @@ extern struct regulator_ops mc13xxx_fixed_regulator_ops;
 #define MC13xxx_GPO_DEFINE(prefix, _name, _reg,  _voltages, _ops)	\
 	[prefix ## _name] = {				\
 		.desc = {						\
-			.name = #prefix "_" #_name,			\
+			.name = #_name,					\
 			.n_voltages = ARRAY_SIZE(_voltages),		\
 			.ops = &_ops,		\
 			.type = REGULATOR_VOLTAGE,			\
-- 
1.7.4.1
