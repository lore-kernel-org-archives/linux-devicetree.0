Return-Path: <SRS0=mz9M=BP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EBAC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B998C2076E
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="YRCgWsJ8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgHETug (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Aug 2020 15:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgHEQxJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Aug 2020 12:53:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE265C061290
        for <devicetree@vger.kernel.org>; Wed,  5 Aug 2020 04:01:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so4103194pjb.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2020 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Az+AszYcHQWzYCnqT/5thfyfYHza99FgAVuo6NVwe5o=;
        b=YRCgWsJ8pGTf9hSUA+n2UAu2tevH60z+ftxm0yHShwRstP9B0a1upVpRfJz9WDL68j
         l8yEHTiQCLSdNiS/bRbYfVZ+rUErAa9vmbTXK3h+gByDGPVvEMF7jquoke5sRJfn1vME
         CoeVdQYK0iRon/IxKtqOxQkQ8hb7nxsG5ig+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Az+AszYcHQWzYCnqT/5thfyfYHza99FgAVuo6NVwe5o=;
        b=WmsoZA3hcgBQoioTebbvSMrqkwJVe2mswXLbTwbBWB52wQ9Q290gk7HncJFblvjDS8
         MTZbArADBf1QusnbSjDe5zjsw0Bb/p5h7YDPSAcgL1yIuEm5JX4QTlcLg3T5BRKgHP9U
         9T8VS27e46+pScvTR62/fZcDpxqqAxIRLx3BVLtrQrH31RBZ04q1fsfB/yCvHG/UELxR
         mV2GPD8fEsbk3ehLthS1xLssA8n/Kr6c1YVzLyDCtxeiLkLxqsBlPV9OUxr169CeAMjv
         tGQJF0sn/zPcdpQ/4jlsEca/utdpLKfwFH8YgcfhPPf4AtFbh6UsqaxFS2u+rL7i78ah
         agSg==
X-Gm-Message-State: AOAM533AI0/GbJA65Ql6tfMVgJK3RijJch2tTnqY9KXP2OW8VXyAuQ1H
        ogVK+KEsRNzanJhh04/2t29Nzw==
X-Google-Smtp-Source: ABdhPJxtCw0v0qrAXzPqLGiqTkiXcYFmKfdnKsHWfbhgvd5nuFoxNKvUzwQxkBrwLUbkzgfT+9qCGA==
X-Received: by 2002:a17:90a:e643:: with SMTP id ep3mr2780313pjb.18.1596625292189;
        Wed, 05 Aug 2020 04:01:32 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id fv21sm2583142pjb.16.2020.08.05.04.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 04:01:31 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        robh+dt@kernel.org, arnd@arndb.de, Daniel Palmer <daniel@0x0f.com>,
        Willy Tarreau <w@1wt.eu>
Subject: [PATCH 3/3] ARM: mstar: Add interrupt controller to base dtsi
Date:   Wed,  5 Aug 2020 20:00:52 +0900
Message-Id: <20200805110052.2655487-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805110052.2655487-1-daniel@0x0f.com>
References: <20200805110052.2655487-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the IRQ and FIQ intc instances to the base MStar/SigmaStar v7
dtsi. All of the known SoCs have both and at the same place with
their common IPs using the same interrupt lines.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Tested-by: Willy Tarreau <w@1wt.eu>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 3b7b9b793736..2b3bb0886d1a 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -85,6 +85,26 @@ reboot {
 				mask = <0x79>;
 			};
 
+			intc_fiq: intc@201310 {
+				compatible = "mstar,msc313-intc-fiq";
+				interrupt-controller;
+				reg = <0x201310 0x40>;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&gic>;
+				mstar,gic-offset = <96>;
+				mstar,nr-interrupts = <32>;
+			};
+
+			intc_irq: intc@201350 {
+				compatible = "mstar,msc313-intc-irq";
+				interrupt-controller;
+				reg = <0x201350 0x40>;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&gic>;
+				mstar,gic-offset = <32>;
+				mstar,nr-interrupts = <64>;
+			};
+
 			l3bridge: l3bridge@204400 {
 				compatible = "mstar,l3bridge";
 				reg = <0x204400 0x200>;
-- 
2.27.0

