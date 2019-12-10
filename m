Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F57C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 09:28:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B5E22073D
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 09:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sRuRnggV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfLJJ21 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 04:28:27 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42864 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfLJJ2Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 04:28:24 -0500
Received: by mail-wr1-f65.google.com with SMTP id a15so19131853wrf.9
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=oAs8ibnr4mvDvPDKIG5QSiRq0APvvSSUYr3TLtcey1c=;
        b=sRuRnggVkOKW6gbGS0j4n40P5A5fQbUOobxwjiMP8vC9THrPFc2kSF5OBow4+CPsFO
         42q7uSXgtaaQwSCHuv4e3jT8OtwPJNtT/3LeczYeqEbuQPOG1SLv4L/+dg/I5x4vIOyG
         olG8nEl8m68kZcMAfr0B+sM20uCCB6f3SEdFOpbbo31lDCpklzMvYZLdRgq+KPDcx6M0
         FgqTTsyPZLDLuCs6Z70pc4wMgI4tw+dGiTI5NRTL6woVqUASQfmBlKAZaqHxagugWO1r
         UF9+nPUkHjVKdFVxa9fg+lsHoEehhLL1RS7gX9z+2ChPy0UzCJmdhiYovWXijyowGyqx
         AIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oAs8ibnr4mvDvPDKIG5QSiRq0APvvSSUYr3TLtcey1c=;
        b=UqIRpKfkQjQcoF8njxSCmKif2Vge1sueCddoVgzLMIxJkRx2vgxDLgmi5TvjBQcylE
         KZctguNpPY+I7QZ4mQZjuAwpaEI4xqF52x/ZId7BEKLIpi/WZc2Q6IJ++Mk5WEidrCdK
         BJr7nMW80XAfy8w9fSFrY83L0eZIVep9GVj3Nv8ptEc8kw0GoE3Y6wA3f3e3K/ZWhLTX
         o0AEI8HHaGJ2rjHPHkYwy9UuFKVEdoKmbU3PlaEufC/sofx+HD3+PByWFNbKhGyWXhAe
         ZQCdeFqgyzouW73UNjCzxVm5ED2GjifG1n9NTxfhLr28UV8139r4RJCUr7UGfz7bhyOw
         ZA3g==
X-Gm-Message-State: APjAAAXyTEhz/ypngQ6+MDfPhJjMnTeIBlr3KV7XCu+EbmPrpUlkWiCM
        hPEa/J4vm98OPY4McCsYTnD7fw==
X-Google-Smtp-Source: APXvYqxItV/IdHWtVOSgaK4JqtnqK9fn7jjy/+Xj1c+6KcVGaRa6Cjx+549x4dxDF3wFheCoAD/vXw==
X-Received: by 2002:adf:f311:: with SMTP id i17mr2001059wro.81.1575970102448;
        Tue, 10 Dec 2019 01:28:22 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id o15sm2602560wra.83.2019.12.10.01.28.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Dec 2019 01:28:21 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org,
        wens@csie.org, georgii.staroselskii@emlid.com,
        aleksandr.aleksandrov@emlid.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] ARM: dts: allwinner: restore hdmi_con_in node
Date:   Tue, 10 Dec 2019 09:28:07 +0000
Message-Id: <1575970087-11667-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Compiling today next (20191210) fail to build with
arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts:53.25-55.4: ERROR (phandle_references): /soc/hdmi@1ee0000/ports/port@1/endpoint: Reference to non-existent node or label "hdmi_con_in"

This patch fixes the build by restoring this node.

Fixes: b120a822ef10 ("ARM: dts: allwinner: Split out non-SoC specific parts of Neutis N5")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts
index fb96d356055e..d6cc6592cfa3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dts
@@ -15,6 +15,17 @@
 		     "emlid,neutis-n5",
 		     "allwinner,sun50i-h5";
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	vdd_cpux: gpio-regulator {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-cpux";
-- 
2.23.0

