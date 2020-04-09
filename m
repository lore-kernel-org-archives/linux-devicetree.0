Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7457EC3815B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 504B92087E
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="na/nJGjg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgDIRxO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:53:14 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:54251 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgDIRxO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:53:14 -0400
Received: by mail-wm1-f43.google.com with SMTP id d77so649587wmd.3;
        Thu, 09 Apr 2020 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ejespMMiPzZHhFOGLxs6wv6JPThWUWz2rdaye1ZX1xE=;
        b=na/nJGjgFezO8e/vI8YJvG17CZDC1pJR3wDAwHVN0Kg6zg3WJuuVg+ZtBXEV9gXEhu
         1hVIkpbsQz2h7BqycBWxaVmdWltbSoLHYyWEAkoYGXK9/KW0eBljif+28LpIyCBotil8
         urLBLTYl/PTUz5aTuighqc+9M/DVMPrd5HwWRUMHNbOnjbDCD9encsjzXiD3ErlPc70o
         zL+C/3fTFg+dr7Rihy6P4rfG0VtdeGVW3LqD7pqTIrmosdtjOxxnLai1z5aWNYqIk/Mm
         cjuiLQwvmHkQlWBEhEE4XnJ60+dfOAEohvIv3fVFGE0PrpyFfwlFX5ILGtlEpNmCsmKq
         SBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ejespMMiPzZHhFOGLxs6wv6JPThWUWz2rdaye1ZX1xE=;
        b=hvFB1IsRNVo5qUz/uiUR7Q+eA9dL7dL01DyKih/NBPkK/yo3oWrQNvideToZbY0/Or
         PHx4YAhzgqRl+LFTKdy5Mek649iVSFee4USn3mnpZmLX70h0X0tXFCSVwEP2xDsijybz
         vskvUN+6ReN6MynC+6gaRZr4f0n3b6bj4uhHxcGnvWOp3ps8hGbZn5S1zmW5bzgaCmKB
         R31o69l9SSo+zNtZ/G0uKWjsDmnYzttnTZrhTAmhcNdWUOONWSd9XrW/f6Ra1ZNuu2Ay
         OX4LmSaVCArsUYhzwSykshizAB6uXpV2kYSSiCA5MHliwzQlPfR3SxltvZSBTwmgg0Px
         Vubg==
X-Gm-Message-State: AGi0Publ28imaEHrT5JO134RMLCT4LKjYpu0rjabMc4smJvo/SPYnbmk
        c4LoFE+qq7rXZNjyqlESX4Y=
X-Google-Smtp-Source: APiQypL3dKnOO7FXsoV/3e3npn5r/roD4WenYMVwtUGfeoyUcdQ+9jTvwDH338TVj4Ni9rYVIlOWUA==
X-Received: by 2002:a1c:9658:: with SMTP id y85mr977190wmd.63.1586454790974;
        Thu, 09 Apr 2020 10:53:10 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id q9sm23295986wrp.61.2020.04.09.10.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:53:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 12/14] arm64: tegra: Add external memory controller node for Tegra210
Date:   Thu,  9 Apr 2020 19:52:36 +0200
Message-Id: <20200409175238.3586487-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

Add external memory controller (EMC) node for Tegra210

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- drop list of clocks because we need very strict ordering that DT can't
  guarantee
- drop hard-coded EMC table, bootloaders should add it dynamically

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 64c46ce3849d..3fa92dd8350b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -895,6 +895,17 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	external-memory-controller@7001b000 {
+		compatible = "nvidia,tegra210-emc";
+		reg = <0x0 0x7001b000 0x0 0x1000>,
+		      <0x0 0x7001e000 0x0 0x1000>,
+		      <0x0 0x7001f000 0x0 0x1000>;
+		clocks = <&tegra_car TEGRA210_CLK_EMC>;
+		clock-names = "emc";
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		nvidia,memory-controller = <&mc>;
+	};
+
 	sata@70020000 {
 		compatible = "nvidia,tegra210-ahci";
 		reg = <0x0 0x70027000 0x0 0x2000>, /* AHCI */
-- 
2.24.1

