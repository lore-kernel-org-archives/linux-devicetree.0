From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 5/5] ARM: dts: add bus clock bsc3_apb for bcm281xx
Date: Tue, 20 May 2014 07:55:23 -0500
Message-ID: <537B50BB.6050400@linaro.org>
References: <1400590362-11177-1-git-send-email-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400590362-11177-1-git-send-email-elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the bus clock named "bsc3_apb" to the list of those provided by
the slave CCU.

Signed-off-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
[Re-sent this one manually because it failed while sending. -Alex]

 arch/arm/boot/dts/bcm11351.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi
b/arch/arm/boot/dts/bcm11351.dtsi
index 64d069b..faff8af 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -247,7 +247,8 @@
 					     "bsc1",
 					     "bsc2",
 					     "bsc3",
-					     "pwm";
+					     "pwm",
+					     "bsc3_apb";
 		};

 		ref_1m_clk: ref_1m {
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
