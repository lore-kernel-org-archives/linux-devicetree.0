From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH v2 1/8] mfd: axp20x: name voltage ramping define properly
Date: Tue, 11 Dec 2018 17:17:05 +0200
Message-ID: <01367c4f4f1e174fefbef9aac645f6792bda07e5.1544512919.git-series.plaes@plaes.org>
References: <cover.923997dd7d7396bb4d71f8967698b58ca956b929.1544512919.git-series.plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDB4J47M7YERBAFKX7QAKGQEIPCLOBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.923997dd7d7396bb4d71f8967698b58ca956b929.1544512919.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>

The current axp20x names the ramping register 'scal' which probably
means scaling. Since the register really has nothing to do with
scaling, but really is the voltage ramp we rename it appropriately.

Signed-off-by: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/linux/mfd/axp20x.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 2302b62..a353cd2 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -35,7 +35,7 @@ enum axp20x_variants {
 #define AXP152_ALDO_OP_MODE		0x13
 #define AXP152_LDO0_CTRL		0x15
 #define AXP152_DCDC2_V_OUT		0x23
-#define AXP152_DCDC2_V_SCAL		0x25
+#define AXP152_DCDC2_V_RAMP		0x25
 #define AXP152_DCDC1_V_OUT		0x26
 #define AXP152_DCDC3_V_OUT		0x27
 #define AXP152_ALDO12_V_OUT		0x28
@@ -53,7 +53,7 @@ enum axp20x_variants {
 #define AXP20X_USB_OTG_STATUS		0x02
 #define AXP20X_PWR_OUT_CTRL		0x12
 #define AXP20X_DCDC2_V_OUT		0x23
-#define AXP20X_DCDC2_LDO3_V_SCAL	0x25
+#define AXP20X_DCDC2_LDO3_V_RAMP	0x25
 #define AXP20X_DCDC3_V_OUT		0x27
 #define AXP20X_LDO24_V_OUT		0x28
 #define AXP20X_LDO3_V_OUT		0x29
-- 
git-series 0.9.1
