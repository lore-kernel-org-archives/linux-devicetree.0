Return-Path: <SRS0=YuQm=5V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A69C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 17:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F28482075A
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 17:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="iUoJfZfC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgDEReA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Apr 2020 13:34:00 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:11501 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgDEReA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Apr 2020 13:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586108038;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=5eexSbKaD4PWK4+vSfn+rMLl0XvRZRi7o/XZA3aRFVw=;
        b=iUoJfZfC4CTRxBBqoQSWGj58y+cigCrp6HjzoKq1ECiUIAd2bS5hLKCQ79HOP8zKGo
        BTsC+Nx4IsGNs6c6cAvCD1Ds5M3+B7fIhPzDhAmd1PEIMr0SnMbangHxLMOXMON4fEE0
        4pCsgYVczCG/Np2y8sdQoOVDWnWZ62meGJbOjKygwDJs+nz1qxGEgO0R2Uhg4XXIuIQs
        CdBuoPY/2atSdyW848DxCTOlcqr51lLtIesnL3USKWNzZrZMPqR4MzNrlpv2MMoGqRVs
        eBGlCQV9MFbo4MNhj4cxVGh3omof9j7n+g8zmObDteXZpyvGXNUMdL4G8Bo0nOE3OGb9
        gGUA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NfqU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w35HXqxmd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 5 Apr 2020 19:33:52 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] ARM: dts: ux500: samsung-golden: Add proximity sensor
Date:   Sun,  5 Apr 2020 19:32:51 +0200
Message-Id: <20200405173252.67614-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

samsung-golden has the same sharp,gp2ap002s00f proximity sensor
that is also used in samsung-skomer.

A driver was added for it in
commit 97d642e23037 ("iio: light: Add a driver for Sharp GP2AP002x00F").

Now that it was merged we can add an entry for it in the device tree
for samsung-golden.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../arm/boot/dts/ste-ux500-samsung-golden.dts | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
index 313f0ab16866..0e9e33f4ca3c 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
@@ -146,6 +146,32 @@ uart@80007000 {
 			pinctrl-1 = <&u2rxtx_c_1_sleep>;
 		};
 
+		i2c@80004000 {
+			status = "okay";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c0_a_1_default>;
+			pinctrl-1 = <&i2c0_a_1_sleep>;
+
+			proximity@44 {
+				compatible = "sharp,gp2ap002s00f";
+				reg = <0x44>;
+
+				/* GPIO146 (PS_INT) */
+				interrupt-parent = <&gpio4>;
+				interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+
+				vdd-supply = <&ab8500_ldo_aux1_reg>;
+				vio-supply = <&ab8500_ldo_aux8_reg>;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&proximity_default>;
+
+				sharp,proximity-far-hysteresis = <0x40>;
+				sharp,proximity-close-hysteresis = <0x0f>;
+			};
+		};
+
 		i2c@80128000 {
 			status = "okay";
 
@@ -375,6 +401,15 @@ golden_cfg1 {
 		};
 	};
 
+	proximity {
+		proximity_default: proximity_default {
+			golden_cfg1 {
+				pins = "GPIO146_D13";	/* PS_INT */
+				ste,config = <&gpio_in_nopull>;
+			};
+		};
+	};
+
 	imu {
 		imu_default: imu_default {
 			golden_cfg1 {
-- 
2.26.0

