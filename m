From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 4/5] ARM: dts: sun8i: ippo-q8h-v5: Enable
 Reduced Serial Bus controller
Date: Thu, 24 Sep 2015 00:05:20 +0800
Message-ID: <1443024323-9115-5-git-send-email-wens@csie.org>
References: <1443024323-9115-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6U3ROYAKGQERJV674A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1443024323-9115-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Reduced Serial Bus controller is used to talk to the onboard PMIC.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

Changes since v3:

None

---
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
index 4f47fd654eea..af87e4922e44 100644
--- a/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
+++ b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
@@ -58,6 +58,10 @@
 	status = "failed";
 };
 
+&r_rsb {
+	status = "okay";
+};
+
 /*
  * FIXME for now we only support host mode and rely on u-boot to have
  * turned on Vbus which is controlled by the axp223 pmic on the board.
-- 
2.5.3
