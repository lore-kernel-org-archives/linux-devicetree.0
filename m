Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10942C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 21:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEB152053B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 21:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfLJV6i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 16:58:38 -0500
Received: from muru.com ([72.249.23.125]:44926 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbfLJV6i (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 16:58:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A4AE58385;
        Tue, 10 Dec 2019 21:59:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jean Pihet <jean.pihet@newoldbits.com>
Subject: [PATCH 2/2] ARM: OMAP2+: Drop legacy platform data for am4 qspi
Date:   Tue, 10 Dec 2019 13:58:31 -0800
Message-Id: <20191210215831.6199-2-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210215831.6199-1-tony@atomide.com>
References: <20191210215831.6199-1-tony@atomide.com>
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

Cc: Jean Pihet <jean.pihet@newoldbits.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi              |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 34 ----------------------
 2 files changed, 35 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -307,7 +307,6 @@ gpmc: gpmc@50000000 {
 
 		target-module@47900000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "qspi";
 			reg = <0x47900000 0x4>,
 			      <0x47900010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -315,32 +315,6 @@ static struct omap_hwmod am43xx_usb_otg_ss1_hwmod = {
 	},
 };
 
-static struct omap_hwmod_class_sysconfig am43xx_qspi_sysc = {
-	.rev_offs	= 0,
-	.sysc_offs      = 0x0010,
-	.sysc_flags     = SYSC_HAS_SIDLEMODE,
-	.idlemodes      = (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-				SIDLE_SMART_WKUP),
-	.sysc_fields    = &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class am43xx_qspi_hwmod_class = {
-	.name   = "qspi",
-	.sysc   = &am43xx_qspi_sysc,
-};
-
-static struct omap_hwmod am43xx_qspi_hwmod = {
-	.name           = "qspi",
-	.class          = &am43xx_qspi_hwmod_class,
-	.clkdm_name     = "l3s_clkdm",
-	.main_clk       = "l3s_gclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = AM43XX_CM_PER_QSPI_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'adc/tsc' class
@@ -681,13 +655,6 @@ static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss1 = {
 	.user           = OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l3_s__qspi = {
-	.master         = &am33xx_l3_s_hwmod,
-	.slave          = &am43xx_qspi_hwmod,
-	.clk            = "l3s_gclk",
-	.user           = OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if am43xx_dss__l3_main = {
 	.master		= &am43xx_dss_core_hwmod,
 	.slave		= &am33xx_l3_main_hwmod,
@@ -783,7 +750,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_wkup__smartreflex1,
 	&am43xx_l4_wkup__timer1,
 	&am43xx_l4_wkup__adc_tsc,
-	&am43xx_l3_s__qspi,
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
 	&am33xx_l4_ls__timer2,
-- 
2.24.0
