Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B267BCA9EB7
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:20:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 920A12173B
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406600AbfJWPU3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:20:29 -0400
Received: from muru.com ([72.249.23.125]:39326 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390636AbfJWPU3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 23 Oct 2019 11:20:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 29A6F80CF;
        Wed, 23 Oct 2019 15:21:03 +0000 (UTC)
Date:   Wed, 23 Oct 2019 08:20:25 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 07/10] ARM: OMAP2+: Drop legacy platform data for dra7 rng
Message-ID: <20191023152025.GJ5610@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
 <20191018163220.3504-8-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018163220.3504-8-tony@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191018 16:33]:
> ---
>  arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
>  arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 36 -----------------------
>  2 files changed, 37 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -1898,7 +1898,6 @@
>  
>  		target-module@90000 {			/* 0x48090000, ap 55 12.0 */
>  			compatible = "ti,sysc-omap2", "ti,sysc";
> -			ti,hwmods = "rng";
>  			reg = <0x91fe0 0x4>,
>  			      <0x91fe4 0x4>;
>  			reg-names = "rev", "sysc";

Looks like I missed the patch description on this patch,
updated patch below with description and Signed-off-by
added.

Regards,

Tony

8< ------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Mon, 21 Oct 2019 14:16:40 -0700
Subject: [PATCH] ARM: OMAP2+: Drop legacy platform data for dra7 rng

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 36 -----------------------
 2 files changed, 37 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1898,7 +1898,6 @@
 
 		target-module@90000 {			/* 0x48090000, ap 55 12.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "rng";
 			reg = <0x91fe0 0x4>,
 			      <0x91fe4 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -1432,34 +1432,6 @@ static struct omap_hwmod dra7xx_des_hwmod = {
 	},
 };
 
-/* rng */
-static struct omap_hwmod_class_sysconfig dra7xx_rng_sysc = {
-	.rev_offs       = 0x1fe0,
-	.sysc_offs      = 0x1fe4,
-	.sysc_flags     = SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE,
-	.idlemodes      = SIDLE_FORCE | SIDLE_NO,
-	.sysc_fields    = &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_rng_hwmod_class = {
-	.name           = "rng",
-	.sysc           = &dra7xx_rng_sysc,
-};
-
-static struct omap_hwmod dra7xx_rng_hwmod = {
-	.name           = "rng",
-	.class          = &dra7xx_rng_hwmod_class,
-	.flags		= HWMOD_SWSUP_SIDLE,
-	.clkdm_name     = "l4sec_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4SEC_RNG_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4SEC_RNG_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'usb_otg_ss' class
  *
@@ -2070,13 +2042,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per1__des = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per1 -> rng */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__rng = {
-	.master         = &dra7xx_l4_per1_hwmod,
-	.slave          = &dra7xx_rng_hwmod,
-	.user           = OCP_USER_MPU,
-};
-
 /* l4_per3 -> usb_otg_ss1 */
 static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss1 = {
 	.master		= &dra7xx_l4_per3_hwmod,
@@ -2239,7 +2204,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 /* GP-only hwmod links */
 static struct omap_hwmod_ocp_if *dra7xx_gp_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_wkup__timer12,
-	&dra7xx_l4_per1__rng,
 	NULL,
 };
 
-- 
2.23.0
