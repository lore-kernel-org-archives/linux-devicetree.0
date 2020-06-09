Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AD8C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:01:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E65D120760
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQBCPOQc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731397AbgFIRBh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 13:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731388AbgFIRBe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 13:01:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4B7C05BD1E
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 10:01:32 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so3880548wmh.5
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=56AvKWjySgBgySSonnii/IUH4GT5dcqEj7+lumT1cRY=;
        b=XQBCPOQcVAJQlXTu6CWnVAFcgJLUEWrBEKEyghumX8BpKiSz/NS70PbTAcrACrc1QX
         68g9Yhyn00KF4e/vDRky98Ac6TJQohJD8MhVucqhHVTMahC6w1Rbavt6mB7wjin9c3sq
         5JN+0Gz/3AoarQb/kzAgsPxYaworJHJYPHC1Pdzb1NP3w3nhItxMB0p8+1Oo7Z14ODD1
         pwrU+vZfomKirX5Eaj1MFykHr40PtRhGTMIpihX9IaOzpctElvn08+96dFtzjle+SvtV
         2iBMTz41jMTVJFmn8n5+76z+c2SNYjTpmC01emNAdB9TcakjDPzNCNXi7k2SaFbMkyqs
         LQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=56AvKWjySgBgySSonnii/IUH4GT5dcqEj7+lumT1cRY=;
        b=YNxhOP/GT7l1zU7wvZYMyQ82BmugyyrFT5AN7ckiMKVzRfFUXhanh54OCrf3n4y5LV
         pYnlWrD/2gxPZp/oVdnkMBlKgO0vZHP2falEb8+Ebv6UJiqM0Qq4KZBUv19nggCI8+4m
         3dNTQ1ZSYmq0Q4IrrZaDmg+ZDHroDCBMN7ewm89ZG+4YSmKQVjFfCWtM9RrhcvxqpaMO
         lxu6wLYLI/q1zEy7nr4+TjkPQGibYiYW7gjg5BYqEu251M9tIcdcQK63F/QoZTxFJAh/
         zCRQnkv69C/E0/2mROyz2Ty7uaxeyAOsGhZ2cH2biky5UAEs8YEk54phTgzNeuU6A0N3
         hJpw==
X-Gm-Message-State: AOAM533tzyqHXWfok67GBX3uTXbe3MXwyEZDBhx/hJsezkjYO6kr2b0H
        wSacRVHrVtD+uiN18ToKKPU=
X-Google-Smtp-Source: ABdhPJziUydPOV9zp3et4UyExSQjH9O6K4W1YcNIq3XL7uN3xQiYGzUUym2Piw3iXAr1nsQN8ubfaw==
X-Received: by 2002:a1c:230a:: with SMTP id j10mr4949426wmj.124.1591722091702;
        Tue, 09 Jun 2020 10:01:31 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id 23sm3734204wmo.18.2020.06.09.10.01.31
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 09 Jun 2020 10:01:31 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
Cc:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: bcm: Select ARM_TIMER_SP804 for ARCH_BCM_NSP
Date:   Tue,  9 Jun 2020 17:58:31 +0100
Message-Id: <afd290238d7a7b392aa477590f3d05f3ebb2f9b9.1591719237.git.mnhagan88@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
References: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The NSP SoC includes an SP804 timer so should be enabled here.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/mach-bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 6aa938b949db..1df0ee01ee02 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -53,6 +53,7 @@ config ARCH_BCM_NSP
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
 	select ARM_ERRATA_764369 if SMP
+	select ARM_TIMER_SP804
 	select THERMAL
 	select THERMAL_OF
 	help
-- 
2.25.4

