From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] ARM: dts: sun5i-gr8: Rename pwm0_pins_a to pwm0_pins
Date: Fri, 10 Feb 2017 11:42:34 +0800
Message-ID: <20170210034234.3612-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBMPN6TCAKGQEXVH7DBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The GR8, like other sun5i SoCs, has only 1 pin option for PWM0 output.
Other SoCs had named the pingroup "pwm0_pins" in their dtsi files, while
GR8 named it "pwm0_pins_a". When we switched to the new common sun5i
dtsi file, we forgot to rename the pingroup references in the GR8 board
dts files.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

Fixes: a2138ce584d5 ("ARM: sun5i: gr8: Use common sun5i DTSI")

Since the broken patch is only in Maxime's tree, the above tag contains
the current commit hash in his tree. This is likely to change once
4.11-rc1 is released and the branch is rebased.

Maxime, maybe you could insert this patch before the "common sun5i"
patches, and do a bit of fixup?

Until then I'll keep this patch at the tip of our own sunxi-next branch.

ChenYu

 arch/arm/boot/dts/sun5i-gr8-chip-pro.dts | 2 +-
 arch/arm/boot/dts/sun5i-gr8-evb.dts      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
index e5eb46b500ae..c55b11a4d3c7 100644
--- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
+++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
@@ -171,7 +171,7 @@
 
 &pwm {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pwm0_pins_a>, <&pwm1_pins>;
+	pinctrl-0 = <&pwm0_pins>, <&pwm1_pins>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/sun5i-gr8-evb.dts b/arch/arm/boot/dts/sun5i-gr8-evb.dts
index ebd8388e2ba1..558c16a30543 100644
--- a/arch/arm/boot/dts/sun5i-gr8-evb.dts
+++ b/arch/arm/boot/dts/sun5i-gr8-evb.dts
@@ -281,7 +281,7 @@
 
 &pwm {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pwm0_pins_a>;
+	pinctrl-0 = <&pwm0_pins>;
 	status = "okay";
 };
 
-- 
2.11.0
