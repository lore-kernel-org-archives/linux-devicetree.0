Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AE9CA9EAB
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7A51222C5
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfJRQcq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 12:32:46 -0400
Received: from muru.com ([72.249.23.125]:38150 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392259AbfJRQcq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9B2558168;
        Fri, 18 Oct 2019 16:33:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 10/10] ARM: OMAP2+: Drop legacy platform data for musb on omap4
Date:   Fri, 18 Oct 2019 09:32:20 -0700
Message-Id: <20191018163220.3504-11-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 63 ----------------------
 2 files changed, 64 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -381,7 +381,6 @@
 
 		target-module@2b000 {			/* 0x4a0ab000, ap 84 12.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "usb_otg_hs";
 			reg = <0x2b400 0x4>,
 			      <0x2b404 0x4>,
 			      <0x2b408 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -2086,51 +2086,6 @@ static struct omap_hwmod omap44xx_usb_host_hs_hwmod = {
 	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
 };
 
-/*
- * 'usb_otg_hs' class
- * high-speed on-the-go universal serial bus (usb_otg_hs) controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_usb_otg_hs_sysc = {
-	.rev_offs	= 0x0400,
-	.sysc_offs	= 0x0404,
-	.syss_offs	= 0x0408,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_ENAWAKEUP |
-			   SYSC_HAS_MIDLEMODE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
-			   MSTANDBY_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_usb_otg_hs_hwmod_class = {
-	.name	= "usb_otg_hs",
-	.sysc	= &omap44xx_usb_otg_hs_sysc,
-};
-
-/* usb_otg_hs */
-static struct omap_hwmod_opt_clk usb_otg_hs_opt_clks[] = {
-	{ .role = "xclk", .clk = "usb_otg_hs_xclk" },
-};
-
-static struct omap_hwmod omap44xx_usb_otg_hs_hwmod = {
-	.name		= "usb_otg_hs",
-	.class		= &omap44xx_usb_otg_hs_hwmod_class,
-	.clkdm_name	= "l3_init_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "usb_otg_hs_ick",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INIT_USB_OTG_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INIT_USB_OTG_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-	.opt_clks	= usb_otg_hs_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(usb_otg_hs_opt_clks),
-};
-
 /*
  * 'usb_tll_hs' class
  * usb_tll_hs module is the adapter on the usb_host_hs ports
@@ -2338,14 +2293,6 @@ static struct omap_hwmod_ocp_if omap44xx_usb_host_hs__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* usb_otg_hs -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_usb_otg_hs__l3_main_2 = {
-	.master		= &omap44xx_usb_otg_hs_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_3 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_3 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -2970,14 +2917,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__usb_host_hs = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> usb_otg_hs */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__usb_otg_hs = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_usb_otg_hs_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> usb_tll_hs */
 static struct omap_hwmod_ocp_if omap44xx_l4_cfg__usb_tll_hs = {
 	.master		= &omap44xx_l4_cfg_hwmod,
@@ -3024,7 +2963,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__l3_main_2,
 	/* &omap44xx_usb_host_fs__l3_main_2, */
 	&omap44xx_usb_host_hs__l3_main_2,
-	&omap44xx_usb_otg_hs__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_3,
 	&omap44xx_l3_main_2__l3_main_3,
 	&omap44xx_l4_cfg__l3_main_3,
@@ -3104,7 +3042,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_per__timer11,
 	/* &omap44xx_l4_cfg__usb_host_fs, */
 	&omap44xx_l4_cfg__usb_host_hs,
-	&omap44xx_l4_cfg__usb_otg_hs,
 	&omap44xx_l4_cfg__usb_tll_hs,
 	&omap44xx_mpu__emif1,
 	&omap44xx_mpu__emif2,
-- 
2.23.0
