From: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [4.2.y-ckt stable] Patch "pinctrl: pistachio: fix mfio84-89 function description and pinmux." has been added to the 4.2.y-ckt tree
Date: Mon, 11 Apr 2016 15:33:56 -0700
Message-ID: <1460414036-24106-1-git-send-email-kamal@canonical.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, kernel-team-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a note to let you know that I have just added a patch titled

    pinctrl: pistachio: fix mfio84-89 function description and pinmux.

to the linux-4.2.y-queue branch of the 4.2.y-ckt extended stable tree 
which can be found at:

    http://kernel.ubuntu.com/git/ubuntu/linux.git/log/?h=linux-4.2.y-queue

This patch is scheduled to be released in version 4.2.8-ckt8.

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 4.2.y-ckt tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Kamal

---8<------------------------------------------------------------

>From 74a0ced3654a9c534af6bfd425576990962e6431 Mon Sep 17 00:00:00 2001
From: Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Date: Fri, 4 Mar 2016 15:28:22 +0000
Subject: pinctrl: pistachio: fix mfio84-89 function description and pinmux.

commit e9adb336d0bf391be23e820975ca5cd12c31d781 upstream.

mfio 84 to 89 are described wrongly, fix it to describe
the right pin and add them to right pin-mux group.

The correct order is:
	pll1_lock => mips_pll	-- MFIO_83
	pll2_lock => audio_pll	-- MFIO_84
	pll3_lock => rpu_v_pll	-- MFIO_85
	pll4_lock => rpu_l_pll	-- MFIO_86
	pll5_lock => sys_pll	-- MFIO_87
	pll6_lock => wifi_pll	-- MFIO_88
	pll7_lock => bt_pll	-- MFIO_89

Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Fixes: cefc03e5995e("pinctrl: Add Pistachio SoC pin control driver")
Signed-off-by: Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Acked-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 .../bindings/pinctrl/img,pistachio-pinctrl.txt     | 12 +++++------
 drivers/pinctrl/pinctrl-pistachio.c                | 24 +++++++++++-----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
index 08a4a32..0326154 100644
--- a/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
@@ -134,12 +134,12 @@ mfio80		ddr_debug, mips_trace_data, mips_debug
 mfio81		dreq0, mips_trace_data, eth_debug
 mfio82		dreq1, mips_trace_data, eth_debug
 mfio83		mips_pll_lock, mips_trace_data, usb_debug
-mfio84		sys_pll_lock, mips_trace_data, usb_debug
-mfio85		wifi_pll_lock, mips_trace_data, sdhost_debug
-mfio86		bt_pll_lock, mips_trace_data, sdhost_debug
-mfio87		rpu_v_pll_lock, dreq2, socif_debug
-mfio88		rpu_l_pll_lock, dreq3, socif_debug
-mfio89		audio_pll_lock, dreq4, dreq5
+mfio84		audio_pll_lock, mips_trace_data, usb_debug
+mfio85		rpu_v_pll_lock, mips_trace_data, sdhost_debug
+mfio86		rpu_l_pll_lock, mips_trace_data, sdhost_debug
+mfio87		sys_pll_lock, dreq2, socif_debug
+mfio88		wifi_pll_lock, dreq3, socif_debug
+mfio89		bt_pll_lock, dreq4, dreq5
 tck
 trstn
 tdi
diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 63100be..8a5bc77 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -469,27 +469,27 @@ static const char * const pistachio_mips_pll_lock_groups[] = {
 	"mfio83",
 };

-static const char * const pistachio_sys_pll_lock_groups[] = {
+static const char * const pistachio_audio_pll_lock_groups[] = {
 	"mfio84",
 };

-static const char * const pistachio_wifi_pll_lock_groups[] = {
+static const char * const pistachio_rpu_v_pll_lock_groups[] = {
 	"mfio85",
 };

-static const char * const pistachio_bt_pll_lock_groups[] = {
+static const char * const pistachio_rpu_l_pll_lock_groups[] = {
 	"mfio86",
 };

-static const char * const pistachio_rpu_v_pll_lock_groups[] = {
+static const char * const pistachio_sys_pll_lock_groups[] = {
 	"mfio87",
 };

-static const char * const pistachio_rpu_l_pll_lock_groups[] = {
+static const char * const pistachio_wifi_pll_lock_groups[] = {
 	"mfio88",
 };

-static const char * const pistachio_audio_pll_lock_groups[] = {
+static const char * const pistachio_bt_pll_lock_groups[] = {
 	"mfio89",
 };

@@ -559,12 +559,12 @@ enum pistachio_mux_option {
 	PISTACHIO_FUNCTION_DREQ4,
 	PISTACHIO_FUNCTION_DREQ5,
 	PISTACHIO_FUNCTION_MIPS_PLL_LOCK,
+	PISTACHIO_FUNCTION_AUDIO_PLL_LOCK,
+	PISTACHIO_FUNCTION_RPU_V_PLL_LOCK,
+	PISTACHIO_FUNCTION_RPU_L_PLL_LOCK,
 	PISTACHIO_FUNCTION_SYS_PLL_LOCK,
 	PISTACHIO_FUNCTION_WIFI_PLL_LOCK,
 	PISTACHIO_FUNCTION_BT_PLL_LOCK,
-	PISTACHIO_FUNCTION_RPU_V_PLL_LOCK,
-	PISTACHIO_FUNCTION_RPU_L_PLL_LOCK,
-	PISTACHIO_FUNCTION_AUDIO_PLL_LOCK,
 	PISTACHIO_FUNCTION_DEBUG_RAW_CCA_IND,
 	PISTACHIO_FUNCTION_DEBUG_ED_SEC20_CCA_IND,
 	PISTACHIO_FUNCTION_DEBUG_ED_SEC40_CCA_IND,
@@ -620,12 +620,12 @@ static const struct pistachio_function pistachio_functions[] = {
 	FUNCTION(dreq4),
 	FUNCTION(dreq5),
 	FUNCTION(mips_pll_lock),
+	FUNCTION(audio_pll_lock),
+	FUNCTION(rpu_v_pll_lock),
+	FUNCTION(rpu_l_pll_lock),
 	FUNCTION(sys_pll_lock),
 	FUNCTION(wifi_pll_lock),
 	FUNCTION(bt_pll_lock),
-	FUNCTION(rpu_v_pll_lock),
-	FUNCTION(rpu_l_pll_lock),
-	FUNCTION(audio_pll_lock),
 	FUNCTION(debug_raw_cca_ind),
 	FUNCTION(debug_ed_sec20_cca_ind),
 	FUNCTION(debug_ed_sec40_cca_ind),
--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
