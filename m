Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53ECC33CAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 13:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF1E12467B
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 13:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nOFVLQvm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgAWNrI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 08:47:08 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:34888 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgAWNrI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 08:47:08 -0500
Received: by mail-pj1-f67.google.com with SMTP id s7so1339678pjc.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jan 2020 05:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6qQxJ2SyEvVPvMIErsNNl1ijsgX+GmiVrQvVTmqjFSI=;
        b=nOFVLQvmwK7zQcfoX6RgA2rrAPXk4uIPXzRXCI/bneBDiL0Ik2eIKCNwhvr4BnCr5H
         wvsxMbXx6Ve+D9iIe6dS2smIjruESE1T7KPLu5LG0YaI7vKLsy2rK7EFLq5z73+/VkSX
         xjWrBRsLB8Opl9F6BmXyYe+0uWyqsaOK50p2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6qQxJ2SyEvVPvMIErsNNl1ijsgX+GmiVrQvVTmqjFSI=;
        b=GLovFs+wiAcBjMGlOPeCFVgGVYZcklNkqdTKDHk1ArlRLtTjaXq8robAZndhrmwVMJ
         Fil5G2C3sanLvc3Z5ImULmAmJKnOh8/98Fs78Fz4mLdXFvF8OChooYOABCDjt9pvmcMz
         42MQdbd4R6e3b8sDs9wubwsuMdRvkBhpHL+3U/Skg4/HuXJoWIb4ocNt9ApvBr3QJRns
         nokADLQ2wM7OtqI5oR/b/I81Y4SfVgFI2mjJxvYvYSw9ta1b0x+9Z3rPJRUH4HulhKDe
         M+QVZzFRz8MlF4Zhe/TrEpApGq40KaIRExIBHNHcjByXM4WuBQLOoknCOSqUxykAO8Lu
         YLAA==
X-Gm-Message-State: APjAAAVkNpdxlnGkLF7raVm47bMZHqrH3YnCMR9aXn5cYWqqbaQkTyFf
        Q1B/0z2bf/fQk9jE6Eguem4+MA==
X-Google-Smtp-Source: APXvYqxluBr8pbd/5ZuACzarEI+J3Nv0qKlV4YpT+VWQoiazdSaVUD7XjER8s9Oeyn6ZbbfLh5m2jA==
X-Received: by 2002:a17:902:16a:: with SMTP id 97mr16134852plb.163.1579787227342;
        Thu, 23 Jan 2020 05:47:07 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.109])
        by smtp.gmail.com with ESMTPSA id a10sm3119275pgm.81.2020.01.23.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 05:47:06 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 3/3] ARM: dts: rockchip: Add vcc50_hdmi for rk3288-vyasa
Date:   Thu, 23 Jan 2020 19:16:41 +0530
Message-Id: <20200123134641.30720-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20200123134641.30720-1-jagan@amarulasolutions.com>
References: <20200123134641.30720-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add vcc50_hdmi regulator for Vyasa RK3288 board.

VCC50_HDMI is the real name used for this regulator as
per the schematics.

This regulator used for HDMI connector by detecting the
cable via HDMI_EN gpio and input rails are sourced from
VSUS_5V regulator.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/rk3288-vyasa.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-vyasa.dts b/arch/arm/boot/dts/rk3288-vyasa.dts
index 88c63946f2a3..52291faf7aef 100644
--- a/arch/arm/boot/dts/rk3288-vyasa.dts
+++ b/arch/arm/boot/dts/rk3288-vyasa.dts
@@ -78,6 +78,17 @@
 		vin-supply = <&vcc_io>;
 	};
 
+	vcc50_hdmi: vcc50-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc50_hdmi";
+		enable-active-high;
+		gpio = <&gpio7 RK_PB4 GPIO_ACTIVE_HIGH>; /* HDMI_EN */
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc50_hdmi_en>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vsus_5v>;
+	};
 	vusb1_5v: vusb1-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "vusb1_5v";
@@ -446,6 +457,12 @@
 		};
 	};
 
+	hdmi {
+		vcc50_hdmi_en: vcc50-hdmi-en {
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int: pmic-int {
 			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.18.0.321.gffc6fa0e3

