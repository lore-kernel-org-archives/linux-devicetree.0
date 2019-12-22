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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F20C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9C1120665
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uLUP93BW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLVOK6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:58 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41371 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbfLVOK6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:58 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so13944582wrw.8;
        Sun, 22 Dec 2019 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vzFYuc95AWY6svq+EBkTgwMguKL8GySeZ2TwbGI8OIM=;
        b=uLUP93BWw0o+JzGgvJbHS+JQq2j1+NBwmhp+m4Ik109/D6oaX5YQAmSL97SKYfWENj
         9U3hX5wRhynx3P/ymFwsgDAiQlvfSSoAoSyyoULEMnlaqPsc64jHQQLDlfRc7hGKjZ8m
         RkEUeiqYjQW+OG7JZROkofNpcYfASzs8CLN6WRihBpRh7zNO6hm8KKmnKFceUkx5f3DX
         4XeySBgPFwdUYAaOPuVgwj0oblL5rCXAvU14LkZTn76fQfE7x4jqAh45YvYgleyxNqAc
         EV2DBP5T4M48S/NnnqlZHiNveDd0i5hN8ZycFqoBb309C0x8tk6HfTnJyxnGOVU4oG5D
         USJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vzFYuc95AWY6svq+EBkTgwMguKL8GySeZ2TwbGI8OIM=;
        b=dKn2w8PTYYw6yuypmf36K5KMoxiqXoGzFzbLgNdfCPcezLF9NlDd/mypEOgus+4/Kl
         OfsXIx7vsu3d7Y9PE5kMwaKVTsQ7VGy0/Zv1AHli0UGqxliODCFAuo++AUJUK0eKoYVb
         mNWSDGG4nCv0/wDB0xzNt7kgkpmpDCEaEzsjd9VO22VNCYhl5XwTMbxDebF600weK5jt
         1QuiZTzz28VRcw9Dp91ZimtzIeBxCUI83aluCcQ//e44JQrM7RQXkXbpABnkMFnPLIzT
         MAzFjH/H4P+gr7e3V/sMf7ReE/LDMyoOGPmFOIlQPbVj3WRYxdkCJ4Z5Ktb6IMtYVrfY
         zg8A==
X-Gm-Message-State: APjAAAW287UnOhru1pAubnDisq9CNIpkseF1PozNpc0ybo2Q9feYv2Ot
        VdeT+sT04nwptAw5iyN4K1Y=
X-Google-Smtp-Source: APXvYqzAiT+VAg4ExN9JaDt0Y33c1cY7telDW1fwAubpR0qMOkVKKO0fuJ7ozhYjeykY1C+d8exOHg==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr24860066wro.352.1577023855885;
        Sun, 22 Dec 2019 06:10:55 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id c5sm16640151wmb.9.2019.12.22.06.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/13] arm64: tegra: Add interrupt for memory controller on Tegra186
Date:   Sun, 22 Dec 2019 15:10:33 +0100
Message-Id: <20191222141035.1649937-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The memory controller can be interrupted by certain conditions. Add the
interrupt to the device tree node to allow drivers to trap these
conditions.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 7dc7fa8bcc39..584498a999d4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -142,6 +142,7 @@ agic: interrupt-controller@2a40000 {
 	memory-controller@2c00000 {
 		compatible = "nvidia,tegra186-mc";
 		reg = <0x0 0x02c00000 0x0 0xb0000>;
+		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 		status = "disabled";
 	};
 
-- 
2.24.1

