Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545D9C5DF60
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F094206C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jCMF/kyp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfKGKFY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:05:24 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39609 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKGKFY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 05:05:24 -0500
Received: by mail-wm1-f65.google.com with SMTP id t26so1692343wmi.4
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 02:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=khWGTMFVP7NY2n7izmIV3AsvSBCLzkWeN571KxpueAg=;
        b=jCMF/kypuGb0DacQuf+2CljxzKCgbDWzLNbiBVTCopCRzkXljblxe8Dc7v37kL3uXA
         hIH/fJP2WsD+iAfIKobKl8qMwNq0xiK/V6+qAQf2wz8FUs6Eu9qxNP/FmteO4oMkF4mh
         b73z+L7fjSp4AJTQtbaOvk8+oMo6bCefgkzyvvCz1UgalH3bY0wF3SCM3J/IdyhJoygj
         SCuZNNRcNQEPxx391ziJLmVokG6VYNMYt+RsderKRorMxP6s0P79G/Qit1pWrlOF1Vo8
         iw/xsMGuK5swIT/ioTZFH+oqEQWzQnvAdNX4uEMeuOvPM13alnjEvbiw8WY9+2B+89Rh
         7jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=khWGTMFVP7NY2n7izmIV3AsvSBCLzkWeN571KxpueAg=;
        b=QFNgQvmBrG59zzB1WkxkaW6TbrHeL1TuAIztJEezhGVxPN0FTA7hd7jc7kmKAF5meQ
         R2GoVM+VTP0OqnLQ2YK9wPJKOlkLfyYNXQ/7cgMrpHEos0Aztd2NrnWxivGQJtQ0ZHmj
         ayIbXtllbtaxKkkTjopuRVw/hHgIv2VQjFbCvqy7jubcCR1lZ6jtTYbBsI6Veq+hFGpV
         UsKR4ZDAZ69ilJDNmgLfFxoso/x7ZR0NCw6qvFAU2Uuv4XXCBSSzrcPPXwxOKtoIO8U+
         1wM0UjnXQklhtzhZTMSvs/aeetEN1iphvGWIWelckvMUtFkHC6kP037d3cnMYnPSuddX
         rO4A==
X-Gm-Message-State: APjAAAVZeopXlZIElVWjEowadKtwUxBWBMakBTCDLvqMXRvlFBVvJ/4J
        Yo2NtqNddaoTHIfEBNliAdc8vl6FRwk=
X-Google-Smtp-Source: APXvYqxK9N2z9ldVSRjttwUtDfr7ty7I992fBqsuEjVqQyS6ihq2UiTzHNOzguzrOJSon+I9EkogQA==
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr1892493wmg.99.1573121120730;
        Thu, 07 Nov 2019 02:05:20 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id v184sm2225860wme.31.2019.11.07.02.05.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Nov 2019 02:05:20 -0800 (PST)
From:   Christoph Fritz <chf.fritz@googlemail.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] ARM: dts: phycore-imx6: set buck regulator modes explicitly
Date:   Thu,  7 Nov 2019 11:04:10 +0100
Message-Id: <1573121050-4728-5-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
References: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch sets initial buck regulator modes explicitly to a state
this hardware needs.  So a wrong initial mode set by bootloader or
pmic itself does not interfere anymore.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
index 6486df3..e3f2181 100644
--- a/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/dlg,da906x-regulator.h>
 
 / {
 	aliases {
@@ -109,6 +110,7 @@
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <730000>;
 				regulator-max-microvolt = <1380000>;
+				regulator-initial-mode = <DA906X_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
 
@@ -116,6 +118,7 @@
 				regulator-name = "vdd_soc";
 				regulator-min-microvolt = <730000>;
 				regulator-max-microvolt = <1380000>;
+				regulator-initial-mode = <DA906X_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
 
@@ -123,6 +126,7 @@
 				regulator-name = "vdd_ddr3";
 				regulator-min-microvolt = <1500000>;
 				regulator-max-microvolt = <1500000>;
+				regulator-initial-mode = <DA906X_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
 
@@ -130,6 +134,7 @@
 				regulator-name = "vdd_eth";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
+				regulator-initial-mode = <DA906X_BUCK_MODE_SYNC>;
 				regulator-always-on;
 			};
 
-- 
2.1.4

