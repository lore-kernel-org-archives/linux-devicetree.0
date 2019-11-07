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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D2CC5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1FC7206C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pCBjLTt1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387811AbfKGKFR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:05:17 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40746 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKGKFR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 05:05:17 -0500
Received: by mail-wm1-f65.google.com with SMTP id f3so1682242wmc.5
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 02:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y4QrBSeK+hGh96w3EkNRr4uaK4vS4b4d9bYcu1vsj1I=;
        b=pCBjLTt1tKeJRanuVDAc9NiX/RFST88Q7X0GOtrWKOfAbTN8fyN8eQkx3HX7hLXysn
         i2CsPZeeY2FOvHN2AjMX/wQHwSeJCyNi4TEaWNR3MUYyOhNcbUr2OlfUP3DOoL9pIWi1
         RIb8MsqHH+EXZhPAXEWWjexZ2Cl97Gx5um1qcUt4435RgQMkqX51AQPdfxE695WF6uY3
         u05xs8nifHepL6hTjb1ARmrEmmjqeq4p/2MvK50zSoL1LKUJuXSU3KpYJg5gE3VdNQ8w
         KOPve6pVRIQLqM/XppO7ptHYpmjjDGgIbs5YX+5cGm/KoYTEkAoA7CtdXt7SYooBwfTy
         GFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y4QrBSeK+hGh96w3EkNRr4uaK4vS4b4d9bYcu1vsj1I=;
        b=fIMz4L/eN3Ub3DxnvrW+uqJFpNXpPq/ypGpEd/ohC3m3/zAT+0r6p+gJLm30wAheKR
         N1F7a2PizkP66r34B3KZ9qVw9xXAC0lGnfKoh1fMyxozEMCGPIgpQZHYwJm8xOh25SKQ
         etttnHedDK5yNfrxA8LAZTnqvO3feNfLM80diVW0lFBZ1SjY1+WbdcCRcL864RvltqES
         3pCDy1WCL0SgAFD4h3qvkglteUJTFAB9ute0KYB3C62WQz++Ymj82hFTWOEocpc5J2V7
         sWn7t1CrgCpJT+qggvNCUa+MnxgHMdFgKukEaYiMpe6peYVtLgaMz3XIHsp2oImX1MCT
         JFmQ==
X-Gm-Message-State: APjAAAXOEr1tsWDN6kL6UnjDGc/mcwXWtAGnIHsj46N/rIQRpvN/mTJP
        Q5H7H5qgiQKqHsbBO1y/aIM=
X-Google-Smtp-Source: APXvYqxzdHgmIC2FjgOq4HoxeBvcWfv1hR6LcFzdGk8UgnT53wvX8OUhBAvs6MO0TbQnVfT4xpfHKQ==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr1925909wme.135.1573121115871;
        Thu, 07 Nov 2019 02:05:15 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id v184sm2225860wme.31.2019.11.07.02.05.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Nov 2019 02:05:15 -0800 (PST)
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
Subject: [PATCH 3/4] dt-bindings: regulator: describe da906x buck regulator modes
Date:   Thu,  7 Nov 2019 11:04:09 +0100
Message-Id: <1573121050-4728-4-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
References: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds DT description of da906x buck regulator modes.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index edca653..5989411 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -66,6 +66,9 @@ Sub-nodes:
   details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
 
+  regulator-initial-mode may be specified for buck regulators using mode values
+  from include/dt-bindings/regulator/dlg,da906x-regulator.h.
+
 - rtc : This node defines settings required for the Real-Time Clock associated
   with the DA9062. There are currently no entries in this binding, however
   compatible = "dlg,da9062-rtc" should be added if a node is created.
@@ -96,6 +99,7 @@ Example:
 				regulator-max-microvolt = <1570000>;
 				regulator-min-microamp = <500000>;
 				regulator-max-microamp = <2000000>;
+				regulator-initial-mode = <DA906X_BUCK_MODE_SYNC>;
 				regulator-boot-on;
 			};
 			DA9062_LDO1: ldo1 {
-- 
2.1.4

