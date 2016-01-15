From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [PATCH V4 4/7] clk: bcm2835: enable management of PCM clock
Date: Fri, 15 Jan 2016 14:21:03 +0000
Message-ID: <1452867667-2447-5-git-send-email-kernel@martin.sperl.org>
References: <1452867667-2447-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452867667-2447-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

Enable the PCM clock in the SOC, which is used by the
bcm2835-i2s driver.

Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
---
 drivers/clk/bcm/clk-bcm2835.c       |   13 +++++++++++++
 include/dt-bindings/clock/bcm2835.h |    1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 567c265..8bc0a76 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -88,6 +88,8 @@
 #define CM_HSMDIV		0x08c
 #define CM_OTPCTL		0x090
 #define CM_OTPDIV		0x094
+#define CM_PCMCTL		0x098
+#define CM_PCMDIV		0x09c
 #define CM_PWMCTL		0x0a0
 #define CM_PWMDIV		0x0a4
 #define CM_SMICTL		0x0b0
@@ -817,6 +819,16 @@ static const struct bcm2835_clock_data bcm2835_clock_pwm_data = {
 	.frac_bits = 12,
 };
 
+static const struct bcm2835_clock_data bcm2835_clock_pcm_data = {
+	.name = "pcm",
+	.num_mux_parents = ARRAY_SIZE(bcm2835_clock_per_parents),
+	.parents = bcm2835_clock_per_parents,
+	.ctl_reg = CM_PCMCTL,
+	.div_reg = CM_PCMDIV,
+	.int_bits = 12,
+	.frac_bits = 12,
+};
+
 struct bcm2835_gate_data {
 	const char *name;
 	const char *parent;
@@ -1578,6 +1590,7 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 	[BCM2835_CLOCK_HSM]	= REGISTER_CLK(&bcm2835_clock_hsm_data),
 	[BCM2835_CLOCK_EMMC]	= REGISTER_CLK(&bcm2835_clock_emmc_data),
 	[BCM2835_CLOCK_PWM]	= REGISTER_CLK(&bcm2835_clock_pwm_data),
+	[BCM2835_CLOCK_PCM]	= REGISTER_CLK(&bcm2835_clock_pcm_data),
 	/* the gates */
 	[BCM2835_CLOCK_PERI_IMAGE] = REGISTER_GATE(
 		&bcm2835_clock_peri_image_data),
diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/clock/bcm2835.h
index 87235ac..9a7b4a5 100644
--- a/include/dt-bindings/clock/bcm2835.h
+++ b/include/dt-bindings/clock/bcm2835.h
@@ -44,3 +44,4 @@
 #define BCM2835_CLOCK_EMMC		28
 #define BCM2835_CLOCK_PERI_IMAGE	29
 #define BCM2835_CLOCK_PWM		30
+#define BCM2835_CLOCK_PCM		31
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
