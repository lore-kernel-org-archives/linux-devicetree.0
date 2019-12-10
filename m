Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CE0C2D0C4
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 17:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE1E020828
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 17:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbfLJRVU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 12:21:20 -0500
Received: from muru.com ([72.249.23.125]:44706 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfLJRVU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 12:21:20 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4063A81D0;
        Tue, 10 Dec 2019 17:21:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/5] ARM: dts: Configure omap4 rng to probe with ti-sysc
Date:   Tue, 10 Dec 2019 09:21:07 -0800
Message-Id: <20191210172108.38868-5-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210172108.38868-1-tony@atomide.com>
References: <20191210172108.38868-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add RNG interconnect data for omap4 similar to what dra7 has. The
clock is OMAP4_CM_L4SEC_RNG_CLKCTRL_OFFSET at offset address 0x01c0,
which matches what dra7 also has with DRA7_L4SEC_CLKCTRL_INDEX(0x1c0).

Note that we need to also add the related l4_secure clock entries.
I've only added RNG, the others can be added as they get tested.
They are probably very similar to what we already have for dra7
in dra7_l4sec_clkctrl_regs[].

With the clock tagged CLKF_SOC_NONSEC, clock is set disabled for secure
devices and clk_get() will fail. Additionally we disable the RNG target
module on droid4 to avoid introducing new boot time warnings.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../boot/dts/motorola-mapphone-common.dtsi    |  5 +++++
 arch/arm/boot/dts/omap4-l4.dtsi               | 20 ++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -650,6 +650,11 @@ OMAP4_IOPAD(0x040, PIN_OUTPUT_PULLDOWN | MUX_MODE3)
 	};
 };
 
+/* RNG is used by secure mode and not accessible */
+&rng_target {
+	status = "disabled";
+};
+
 /* Configure pwm clock source for timers 8 & 9 */
 &timer8 {
 	assigned-clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2002,12 +2002,26 @@ timer11: timer@0 {
 			};
 		};
 
-		target-module@90000 {			/* 0x48090000, ap 57 2a.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+		rng_target: target-module@90000 {	/* 0x48090000, ap 57 2a.0 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x91fe0 0x4>,
+			      <0x91fe4 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>;
+			/* Domains (P, C): l4per_pwrdm, l4_secure_clkdm */
+			clocks = <&l4_secure_clkctrl OMAP4_RNG_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x90000 0x2000>;
+
+			rng: rng@0 {
+				compatible = "ti,omap4-rng";
+				reg = <0x0 0x2000>;
+				interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@96000 {			/* 0x48096000, ap 37 26.0 */
-- 
2.24.0
