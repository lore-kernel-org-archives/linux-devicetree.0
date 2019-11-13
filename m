Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6741C1744A
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90FE82245B
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HHGRBnBM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfKMNlI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 08:41:08 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46082 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727497AbfKMNlH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 08:41:07 -0500
Received: by mail-wr1-f68.google.com with SMTP id b3so2380736wrs.13
        for <devicetree@vger.kernel.org>; Wed, 13 Nov 2019 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xUHBzoq9SNl+3pMWbPtXPGVnvUBANpVssHw7iXkIZIo=;
        b=HHGRBnBMg8+wCvJsMAvdrY+RFtcPOQsLzz0e965o3Dgf6Fna1KhJRssZaGQZTyaRVB
         mBNNFr/+L71bYiuVTRNz3zLbSISnN21FY+7qXByWD3ElAwpaNugL+Qvk47JXWiZFvYzi
         u+T5YKnANIkZsBVVF8X90vHRkNfNN1EfLvbElXT+YabV9Te3dePfF4lJk2CRNVQUEwIk
         LvzydLlHkRAxncmIVdUDHHmGKlOIATxU3m8YGPlZrru68/+1rONF7/geBxdKjOGXwJDg
         69YenwXVro4CxYTfM4A8hZdwZjSRZWcBztn4U/MpErmsSIstiwTRV7DG2gKns1nDIbaU
         mp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xUHBzoq9SNl+3pMWbPtXPGVnvUBANpVssHw7iXkIZIo=;
        b=ET2t0KAGdVLperltEfrocKgR7WuC/QS/Q4WtfdKAd0rDzJtnvOEIoOTbEyIU/kJgVm
         BYQ0D+jpCCxKJ2rOuM1pnK7eqwicSk0KG9Habv+Nlo+C/clMF4PZTEikddNwEPRZwYQp
         uQZ6AZ9st9mnxMHbbQCtIaGt1ih4xY95d+vPyIwIoqxYzjTjEQFHcoUq51UT+EGJJggk
         glZSBLCTV+aKYc819PerL5iOcBPRMyehMsX1UxdR8HkiEioVmGIXXXB/fl4PM5d1ht+L
         ycK91uS8Swt5g//CnZ7xjo2moXfy7iNxiPcwy9lvWgIvZfE8+sP8+fGLNJZHcziqyBbI
         jzgQ==
X-Gm-Message-State: APjAAAVm4TD8EFUxBQeX+/jAn9QEcUfqpOD2qKQKwhg2k8QV4qQoUdUy
        JhNAFxo+CUBaIWHVCNSpfqs=
X-Google-Smtp-Source: APXvYqzMeDEMOr6jJXevVw3EJPZivbRAyr1ynHZcgbxgkkqbWKe/6Xy9o/utpo+IKLlMcsg2v8kIcA==
X-Received: by 2002:adf:e682:: with SMTP id r2mr2992493wrm.358.1573652465812;
        Wed, 13 Nov 2019 05:41:05 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id r15sm4195831wrc.5.2019.11.13.05.41.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 05:41:05 -0800 (PST)
From:   Christoph Fritz <chf.fritz@googlemail.com>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] dt-bindings: mfd: da9062: describe buck modes
Date:   Wed, 13 Nov 2019 14:40:15 +0100
Message-Id: <1573652416-9848-4-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
References: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds DT description of da9062 buck regulator modes.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index edca653..bc4b59d 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -66,6 +66,9 @@ Sub-nodes:
   details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
 
+  regulator-initial-mode may be specified for buck regulators using mode values
+  from include/dt-bindings/regulator/dlg,da9063-regulator.h.
+
 - rtc : This node defines settings required for the Real-Time Clock associated
   with the DA9062. There are currently no entries in this binding, however
   compatible = "dlg,da9062-rtc" should be added if a node is created.
@@ -96,6 +99,7 @@ Example:
 				regulator-max-microvolt = <1570000>;
 				regulator-min-microamp = <500000>;
 				regulator-max-microamp = <2000000>;
+				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
 				regulator-boot-on;
 			};
 			DA9062_LDO1: ldo1 {
-- 
2.1.4

