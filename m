Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBE0C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A9AB20675
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6gmBW2w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgENQL7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 12:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgENQL7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 12:11:59 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B043C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:11:59 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r22so1417119pga.12
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kERbVPKOH+FX4g8aG+gjJYUwyTHcVS7ylYTdMC7w4rU=;
        b=M6gmBW2wkreDT1FjE3XduSEnQnlx1OmUN/sGm+c1dA/9z8Lf+QwnE+4mSUZQxq3Yqu
         M+JaZF5Iuuwjecknhi+K9sE/vriSN4mlm9OwWCv2XKKJCA1r0Y1TW0CEjmAZ3XrnKeu1
         6dlncoMK7eu2uW+ysxkfQK101dKE0lU0xBsST/dXRin/2gdLg5OQKZ6nQltS4hfH/7F1
         40eds0q0Ae92dk8jUUsigc+rLMM26S2w3p3JAieBkUe9F1kZFZjFs/+Wv/R30hIWvBQz
         dSYWgFo7wkCPwULy0CDpZ+UwLEXqPIMC6ucOabOIVLSIk1rCiq+/QRzlJpmvZGrIyObB
         WivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kERbVPKOH+FX4g8aG+gjJYUwyTHcVS7ylYTdMC7w4rU=;
        b=cgEwXqsQ55grOVQLzVaLIs/KlO5LWyRRRi9ajRHcGiDjAfGq7fNzjHD21XWGrcwB+6
         nG7vVjZs8TchJcGq4z3m5z0q3+fU5tGSUoFyDlbGvFUK9RaF9F227MsaOdn0dvz+4DKy
         JCX6bHVAxR8D3mDu5nceMl+vi0bo42Axmiocpof39Ml4fXz9ioCxZgWEYuvBM1NlHGEe
         xChAuFQ8AWQOS56crvXxqxjJPEtJiclHTOVPRpV0EDZ3VohROAopZYPlDR108kBo5EkS
         WutZdUORLYkOVFpBXieuSCl3rS82C80LZe1u/eoRc80ee8ZoH27ChwhUCLjMGTUAf+4z
         iAHQ==
X-Gm-Message-State: AOAM530qE5byZHJrrZUkz+jvfEn6NFDRnyWTMflT/n6RANqt3V5AgA3d
        XPx1o5sVzJBAoVQtRrBs1Lo=
X-Google-Smtp-Source: ABdhPJx221SdCqxog59nayKDC2HJHmIZOnrjna5bc90Ic4mLEglczKwHZp+qojX8hzWdHl57pCXkSA==
X-Received: by 2002:a63:f90a:: with SMTP id h10mr4621315pgi.57.1589472718688;
        Thu, 14 May 2020 09:11:58 -0700 (PDT)
Received: from localhost.localdomain ([106.215.24.137])
        by smtp.gmail.com with ESMTPSA id t5sm2331755pgp.80.2020.05.14.09.11.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 09:11:58 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v1 4/9] arm64: dts: actions: do not merge disable sps node from S700
Date:   Thu, 14 May 2020 21:40:52 +0530
Message-Id: <1589472657-3930-5-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

After commit 7cdf8446ed1d ("arm64: dts: actions: Add pinctrl node for
Actions Semi S700") following error has been observed while booting
Linux on Cubieboard7-lite(based on S700 SoC).

[    0.257415] pinctrl-s700 e01b0000.pinctrl: can't request region for
resource [mem 0xe01b0000-0xe01b0fff]
[    0.266902] pinctrl-s700: probe of e01b0000.pinctrl failed with error -16

This is due to the fact that memory range for "sps" power domain controller
clashes with pinctrl.

This commit disable "sps" to avoid this conflict and let us test DMA and MMC
related changes.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
Changes since RFC:
	* kept as do not merge.
---
 arch/arm64/boot/dts/actions/s700.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 2006ad5424fa..0397c5dd3dec 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -220,6 +220,7 @@
 			compatible = "actions,s700-sps";
 			reg = <0x0 0xe01b0100 0x0 0x100>;
 			#power-domain-cells = <1>;
+			status = "disabled";
 		};
 
 		timer: timer@e024c000 {
-- 
2.7.4

