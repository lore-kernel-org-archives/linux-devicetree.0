Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F28C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F069208A9
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="gwMEPelP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgG3NCp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 09:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbgG3NCl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 09:02:41 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08620C0619D2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:02:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mt12so4137836pjb.4
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1mAnNNAZfPfzyF88X1fOSRFSMBROfjHobKP31kxfdOc=;
        b=gwMEPelPCgps8yK/7P5U/nJeMrOiHbmuTpDjW3s5ScDbElTNZlQ48BdHcUjSr3otHT
         f9gqkU53F4K8jQ1FDa9L9zSnEylVfJq7FvPbjC1rGH6N21g8UqQWPJfl6hHzzKksHuBo
         K41e4E6uwPaneffN2lXMuphGRuQzOqFIEcuR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1mAnNNAZfPfzyF88X1fOSRFSMBROfjHobKP31kxfdOc=;
        b=dl0LRCvxuOiE12h0UZoisVFNt6z4xm/fFa4/RRvpHelEu6dEQ7/Jv4vj8e2GFlZXyr
         GxA5lVhljO+0mp8H3YBXJt/dwxZIBIfKLsM5WqiuziDt/UMVYIryjsLI74EMdCx+Mhsd
         Bh22WutSiAH+zmlhGAcG3lDW89GxrO0Mwi/NL4nYWGPI0YXNUf2xC+YdILgUVaUXKH3i
         MVDolq8/uDbmNkp0SHG/UHHN1WEUYUDIMHxJkZabesgIok0UD8hKMIh5j1T/RnRTbLvI
         pPcEGGjkEKyg2DowNbIqHbPy8Ke3ZP9oP6pOC77yCW9vRFy6nd84csb3HxUK11gXVEim
         CuOg==
X-Gm-Message-State: AOAM533Km6eT2A29/bV6h1YZCECHvnRW1+hFEYaMskWqI2A+2WrlctFw
        h8pX3XxXWZFn6l0NS1svSey3OdHVupk=
X-Google-Smtp-Source: ABdhPJxNukSgN9Qo/irUQx6o1//oMXDCOpTPEIiCWNID4Fq0bqW7VIUaf+7hbETLGyIkE09W+8cNcQ==
X-Received: by 2002:a62:8307:: with SMTP id h7mr3159636pfe.149.1596114159579;
        Thu, 30 Jul 2020 06:02:39 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id b13sm6758704pgd.36.2020.07.30.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 06:02:38 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux@armlinux.org.uk, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 3/3] ARM: mstar: Add interrupt controller to base dtsi
Date:   Thu, 30 Jul 2020 22:00:44 +0900
Message-Id: <20200730130044.2037509-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730130044.2037509-1-daniel@0x0f.com>
References: <20200730130044.2037509-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the IRQ and FIQ intc instances to the base MStar/SigmaStar v7
dtsi. All of the know SoCs have both and at the same place with
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

