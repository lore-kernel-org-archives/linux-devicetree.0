From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 4/9] mfd: axp20x: use correct platform device
 id for many PEK
Date: Wed, 26 Jul 2017 16:28:27 +0800
Message-ID: <20170726082832.16789-5-wens@csie.org>
References: <20170726082832.16789-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBNFF4HFQKGQE65WVHLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170726082832.16789-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

According to their datasheets, the AXP221, AXP223, AXP288, AXP803,
AXP809 and AXP813 PEK have different values for startup time bits from
the AXP20X, let's use the platform device id with the correct values.

Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/mfd/axp20x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index ec4271ca065c..336de66ca408 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -677,7 +677,7 @@ static struct mfd_cell axp20x_cells[] = {
 
 static struct mfd_cell axp221_cells[] = {
 	{
-		.name		= "axp20x-pek",
+		.name		= "axp221-pek",
 		.num_resources	= ARRAY_SIZE(axp22x_pek_resources),
 		.resources	= axp22x_pek_resources,
 	}, {
@@ -702,7 +702,7 @@ static struct mfd_cell axp221_cells[] = {
 
 static struct mfd_cell axp223_cells[] = {
 	{
-		.name			= "axp20x-pek",
+		.name			= "axp221-pek",
 		.num_resources		= ARRAY_SIZE(axp22x_pek_resources),
 		.resources		= axp22x_pek_resources,
 	}, {
@@ -835,7 +835,7 @@ static struct mfd_cell axp288_cells[] = {
 		.resources = axp288_fuel_gauge_resources,
 	},
 	{
-		.name = "axp20x-pek",
+		.name = "axp221-pek",
 		.num_resources = ARRAY_SIZE(axp288_power_button_resources),
 		.resources = axp288_power_button_resources,
 	},
@@ -846,7 +846,7 @@ static struct mfd_cell axp288_cells[] = {
 
 static struct mfd_cell axp803_cells[] = {
 	{
-		.name			= "axp20x-pek",
+		.name			= "axp221-pek",
 		.num_resources		= ARRAY_SIZE(axp803_pek_resources),
 		.resources		= axp803_pek_resources,
 	},
@@ -862,7 +862,7 @@ static struct mfd_cell axp806_cells[] = {
 
 static struct mfd_cell axp809_cells[] = {
 	{
-		.name			= "axp20x-pek",
+		.name			= "axp221-pek",
 		.num_resources		= ARRAY_SIZE(axp809_pek_resources),
 		.resources		= axp809_pek_resources,
 	}, {
@@ -873,7 +873,7 @@ static struct mfd_cell axp809_cells[] = {
 
 static struct mfd_cell axp813_cells[] = {
 	{
-		.name			= "axp20x-pek",
+		.name			= "axp221-pek",
 		.num_resources		= ARRAY_SIZE(axp803_pek_resources),
 		.resources		= axp803_pek_resources,
 	}
-- 
2.13.3
