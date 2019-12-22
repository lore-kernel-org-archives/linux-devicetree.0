Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E5EC2D0D3
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49D3420733
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHqDsh7P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLVLjh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 06:39:37 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56166 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfLVLjg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 06:39:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so13188309wmj.5;
        Sun, 22 Dec 2019 03:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BHjz7vpaJMgCiJxedS2/DgNIB5kdLeeix42Ihq8AUE8=;
        b=jHqDsh7PHiAU0A2PLZUoxpQR2wzTxZ/UOF/1k9mbJF39TG9UIbJwL5yiUooW2wG9pa
         qk8iDvSvnhL5Sg+TpBTDyh/sNVQWJ3xCc66CJWs6fuH67h7DAI51ROuSDkZJTF1QoXNx
         O9E0FfRJqZ2+suljC/RurqX+I1s7si5Rso2gTnFE1Ythst+TPBPJ3mDIP9LYwim7rCgi
         SB0A9XConqu9/dfD2GTlSShOG6bo2JvvMUjLDIrqIXpoPZ2+PWMQJc6PLuluzcwFJKav
         6wnQOdfsx0qzpZvapJlRhFHgJPYWG6sb4QO/c/FfJJUEMTQ4vR58u2IMpbog0XpdMv6N
         /zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BHjz7vpaJMgCiJxedS2/DgNIB5kdLeeix42Ihq8AUE8=;
        b=lxBfExVdkNPtsvqvlDk9Wx4rXwFCRJD4NQZGBLu5jyYoeWKxziN8XSeyuM4nnO5cPw
         WO1AmelHx5nr3QOG5cpi4WsbY3Wm8KtpnJfi3Bv5AtpKPKCwpsGmLVsChiVRkK+AIhCe
         KraPw08T8ch2JioasMB/592Y5wO8XRnJrBPRJdIOubvZMME2OyyZUQA7d811mvYsh6+j
         K2j/E2XQ7hRHS5UW8I0KwwfgskwD7Ztgcw7r7Eu4dhmWpoSEVGdvl3bOc7vagFrttgaA
         Rm3KVIhineu+08OtQtXzGMZCzG8bY81jnOmJ6fIGjy5Ou933ncvBHlLaTuh9mcCP4Vjn
         uRug==
X-Gm-Message-State: APjAAAVjSVJ94SrDKluKXhSAG64PqoybB+Ewg7gkqBRUc3iQ12caY+xT
        kCfxMvTuiIZ4F3pv2IiY+m0=
X-Google-Smtp-Source: APXvYqyPpmzYMc/qk93sM8p9elfRQveUws+795Ae2kc0u/tuwHQohHIVpnIMNTyP48o8gGQQ75SKqg==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr26631309wma.62.1577014774392;
        Sun, 22 Dec 2019 03:39:34 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id h2sm17937457wrt.45.2019.12.22.03.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:39:33 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 6/6] arm64: tegra: Rename EMC on Tegra132
Date:   Sun, 22 Dec 2019 12:39:21 +0100
Message-Id: <20191222113921.1469372-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222113921.1469372-1-thierry.reding@gmail.com>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Rename the EMC node to external-memory-controller according to device
tree best practices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 31caebada944..34367179ba24 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -602,7 +602,7 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
-	emc: emc@7001b000 {
+	emc: external-memory-controller@7001b000 {
 		compatible = "nvidia,tegra132-emc", "nvidia,tegra124-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
 		clocks = <&tegra_car TEGRA124_CLK_EMC>;
-- 
2.24.1

